import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../application/book_feed_controller.dart';

const _genres = ['All', 'Fiction', 'Non-fiction', 'Textbook', 'Sci-fi', 'Other'];

class BookFeedScreen extends ConsumerStatefulWidget {
  const BookFeedScreen({super.key});

  @override
  ConsumerState<BookFeedScreen> createState() => _BookFeedScreenState();
}

class _BookFeedScreenState extends ConsumerState<BookFeedScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(bookFeedControllerProvider.notifier).loadMore();
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      ref.read(bookFeedControllerProvider.notifier).search(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final feedAsync = ref.watch(bookFeedControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Boibritto'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => context.push(AppRoutes.myProfile),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRoutes.newBook),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: const InputDecoration(
                hintText: 'Search title or author',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _genres.length,
                separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.xs),
                itemBuilder: (context, index) {
                  final genre = _genres[index];
                  //final selected = (feedAsync.valueOrNull?.genre ?? 'All') == genre;
                  final selected = feedAsync.when(
                    data: (state) => (state.genre ?? 'All') == genre,
                    loading: () => false, // Default fallback while loading
                    error: (err, stack) => false, // Default fallback if an error occurs
                  );
                  return ChoiceChip(
                    label: Text(genre),
                    selected: selected,
                    onSelected: (_) => ref
                        .read(bookFeedControllerProvider.notifier)
                        .filterByGenre(genre == 'All' ? null : genre),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Expanded(
              child: feedAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) => Center(child: Text("Couldn't load books: $err")),
                data: (feedState) {
                  if (feedState.books.isEmpty) {
                    return const Center(child: Text('No books match your search yet.'));
                  }
                  return RefreshIndicator(
                    onRefresh: () => ref.read(bookFeedControllerProvider.notifier).refresh(),
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: feedState.books.length + (feedState.hasMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= feedState.books.length) {
                          return const Padding(
                            padding: EdgeInsets.all(AppSpacing.md),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        final book = feedState.books[index];
                        return ListTile(
                          leading: SizedBox(
                            width: 40,
                            height: 56,
                            child: CachedNetworkImage(
                              imageUrl: book.coverUrl,
                              fit: BoxFit.cover,
                              errorWidget: (_, __, ___) => const Icon(Icons.menu_book),
                            ),
                          ),
                          title: Text(book.title),
                          subtitle: Text('${book.author} · ${book.ownerName}'),
                          trailing: Text(book.available ? 'Available' : 'On loan'),
                          onTap: () => context.push(AppRoutes.bookDetail(book.id)),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
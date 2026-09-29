import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../application/book_detail_controller.dart';
import '../../application/book_form_controller.dart';
import '../../data/models/book.dart';

class BookFormScreen extends ConsumerStatefulWidget {
  const BookFormScreen({super.key, this.editBookId});

  /// Null = create mode; non-null = editing that book.
  final int? editBookId;

  @override
  ConsumerState<BookFormScreen> createState() => _BookFormScreenState();
}

class _BookFormScreenState extends ConsumerState<BookFormScreen> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _genreController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _coverUrlController = TextEditingController();
  bool _prefilled = false;

  bool get isEditing => widget.editBookId != null;

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _genreController.dispose();
    _descriptionController.dispose();
    _coverUrlController.dispose();
    super.dispose();
  }

  void _prefillIfNeeded(Book book) {
    if (_prefilled) return;
    _titleController.text = book.title;
    _authorController.text = book.author;
    _genreController.text = book.genre;
    _descriptionController.text = book.description;
    _coverUrlController.text = book.coverUrl;
    _prefilled = true;
  }

  Future<void> _submit() async {
    final title = _titleController.text.trim();
    final author = _authorController.text.trim();
    if (title.isEmpty || author.isEmpty) return;

    final controller = ref.read(bookFormControllerProvider.notifier);
    final ok = isEditing
        ? await controller.update(
            widget.editBookId!,
            title: title,
            author: author,
            genre: _genreController.text.trim(),
            description: _descriptionController.text.trim(),
            coverUrl: _coverUrlController.text.trim(),
          )
        : await controller.create(
            title: title,
            author: author,
            genre: _genreController.text.trim().isEmpty ? null : _genreController.text.trim(),
            description: _descriptionController.text.trim().isEmpty
                ? null
                : _descriptionController.text.trim(),
            coverUrl: _coverUrlController.text.trim().isEmpty
                ? null
                : _coverUrlController.text.trim(),
          );

    if (ok && mounted) {
      context.pop();
    } else if (mounted) {
      final message = ref.read(bookFormControllerProvider).errorMessage;
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookFormControllerProvider);

    if (isEditing) {
      ref.watch(bookDetailControllerProvider(widget.editBookId!)).whenData(_prefillIfNeeded);
    }

    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit listing' : 'List a book')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(label: 'Title', controller: _titleController),
              const SizedBox(height: AppSpacing.md),
              AppTextField(label: 'Author', controller: _authorController),
              const SizedBox(height: AppSpacing.md),
              AppTextField(label: 'Genre', controller: _genreController),
              const SizedBox(height: AppSpacing.md),
              AppTextField(label: 'Description', controller: _descriptionController),
              const SizedBox(height: AppSpacing.md),
              AppTextField(label: 'Cover image URL', controller: _coverUrlController),
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                label: isEditing ? 'Save changes' : 'List book',
                loading: state.submitting,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
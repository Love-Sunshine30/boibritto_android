import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/messages_repository.dart';
import '../data/models/message.dart';

/// A plain StreamProvider family — there's no mutation to coordinate here
/// beyond what Firestore's own listener already does.
final threadMessagesProvider =
    StreamProvider.family<List<Message>, int>((ref, requestId) {
  return ref.watch(messagesRepositoryProvider).watchMessages(requestId);
});

class ComposerState {
  const ComposerState({this.sending = false, this.errorMessage});
  final bool sending;
  final String? errorMessage;

  ComposerState copyWith({bool? sending, String? errorMessage}) {
    return ComposerState(
      sending: sending ?? this.sending,
      errorMessage: errorMessage,
    );
  }
}

/// One instance per open thread. Success doesn't touch `messages` state at
/// all — the sent message appears via [threadMessagesProvider]'s own
/// Firestore listener, not from here (architecture §10).
class ComposerController extends Notifier<ComposerState> {
  ComposerController(this.requestId);
  final int requestId;

  @override
  ComposerState build() => const ComposerState();

  Future<bool> send(String body) async {
    if (body.trim().isEmpty) return false;
    state = state.copyWith(sending: true, errorMessage: null);
    try {
      await ref.read(messagesRepositoryProvider).sendMessage(requestId, body.trim());
      state = state.copyWith(sending: false);
      return true;
    } catch (_) {
      state = state.copyWith(sending: false, errorMessage: 'Message failed to send.');
      return false;
    }
  }
}

final composerControllerProvider =
    NotifierProvider.family<ComposerController, ComposerState, int>(
  ComposerController.new,
);
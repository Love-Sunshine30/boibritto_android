/// Path string constants, one per OpenAPI path (`contracts/openapi.yml` in
/// the backend repo is the source of truth — keep this in sync, per
/// architecture §13's "contract drift guard"). Paths are relative to
/// [AppConfig.baseUrl], which already includes `/api/v1`.
abstract class ApiEndpoints {
  // Profile
  static const me = '/me';
  static String user(int id) => '/users/$id';

  // Books
  static const books = '/books';
  static String book(int id) => '/books/$id';
  static String bookRequests(int id) => '/books/$id/requests';
  static String bookForum(int id) => '/books/$id/forum';

  // Requests
  static const requestsSent = '/requests/sent';
  static const requestsIncoming = '/requests/incoming';
  static String request(int id) => '/requests/$id';
  static String requestConfirm(int id) => '/requests/$id/confirm';
  static String requestReturn(int id) => '/requests/$id/return';

  // Messages
  static const threads = '/threads';
  static String threadMessages(int id) => '/threads/$id/messages';

  // Push
  static const pushSubscribe = '/push/subscribe';
  static const pushUnsubscribe = '/push/unsubscribe';

  // Forum
  static String forumPost(int id) => '/forum/$id';

  // Admin
  static String adminBookCover(int id) => '/admin/books/$id/cover';
}
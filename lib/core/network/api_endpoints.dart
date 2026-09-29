/// Path string constants, one per OpenAPI path (`contracts/openapi.yml` in
/// the backend repo is the source of truth — keep this in sync, per
/// architecture §13's "contract drift guard"). Paths are relative to
/// [AppConfig.baseUrl], which already includes `/api/v1`.
abstract class ApiEndpoints {
  // Profile
  static const me = '/me';
  static String user(String id) => '/users/$id';

  // Books
  static const books = '/books';
  static String book(String id) => '/books/$id';
  static String bookRequests(String id) => '/books/$id/requests';
  static String bookForum(String id) => '/books/$id/forum';

  // Requests
  static String request(String id) => '/requests/$id';
  static String requestConfirm(String id) => '/requests/$id/confirm';
  static String requestReturn(String id) => '/requests/$id/return';

  // Messages
  static const threads = '/threads';
  static String threadMessages(String id) => '/threads/$id/messages';

  // Push
  static const pushSubscribe = '/push/subscribe';
  static const pushUnsubscribe = '/push/unsubscribe';

  // Admin
  static String adminBookCover(String id) => '/admin/books/$id/cover';
}
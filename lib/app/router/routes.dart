abstract class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const completeProfile = '/complete-profile';
  static const myProfile = '/profile';

  static const books = '/books';
  static const newBook = '/books/new';
  static String bookDetail(int id) => '/books/$id';
  static String bookEdit(int id) => '/books/$id/edit';

  static const myShelf = '/my-shelf';
  static const requests = '/requests';
  static const messages = '/messages';

  static String requestDetail(int id) => '/requests/$id';

  static String threadDetail(int requestId) => '/messages/$requestId';

  static String bookForum(int id) => '/books/$id/forum';
}
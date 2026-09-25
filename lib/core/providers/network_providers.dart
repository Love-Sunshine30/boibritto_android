import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/api_client.dart';

final authTokenProvider = Provider<Future<String?> Function()>(
  (ref) {
    return () async {
      return null;
    };
  },
);

final apiClientProvider = Provider<ApiClient>(
  (ref) {
    final tokenProvider = ref.watch(authTokenProvider);

    return ApiClient(
      tokenProvider: tokenProvider,
    );
  },
);
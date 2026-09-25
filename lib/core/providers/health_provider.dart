import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'network_providers.dart';

final healthProvider = FutureProvider<String>((ref) async {
  final api = ref.watch(apiClientProvider);

  final response = await api.get<Map<String, dynamic>>(
    '/healthz',
  );

  return response.data?.toString() ?? '';
});
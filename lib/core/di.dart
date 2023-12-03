import 'package:get_it/get_it.dart';

import 'package:qtec_task/local_storage/local_cache/cache.dart';

/// Service Locator
final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<CacheHandler>(CacheHandlerI.new);
}

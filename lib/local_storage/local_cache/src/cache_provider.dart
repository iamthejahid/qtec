import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qtec_task/local_storage/local_cache/cache.dart';

final hiveProvider = Provider<CacheHandler>((_) => CacheHandlerI());

final hiveEventStreamProvider = StreamProvider<BoxEvent>((ref) {
  return ref.watch(hiveProvider).getCacheBox().watch();
});

import 'package:app_ui/app_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qtec_task/local_storage/local_cache/cache.dart';

class ThemeNotifier extends StateNotifier<String> {
  ThemeNotifier({required Ref ref})
      : _ref = ref,
        super('light') {
    _cache = _ref.watch(hiveProvider);
  }

  final Ref _ref;
  late final CacheHandler _cache;

  void updateState() => Future.microtask(() => state = _cache.themeData);

  void toggle() {
    if (state == 'dark') {
      _cache.setThemeData(isWhite: true);
      updateState();
    } else {
      _cache.setThemeData(isWhite: false);
      updateState();
    }
  }
}

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, String>((ref) {
  return ThemeNotifier(ref: ref);
});

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  MaterialStateProperty<Icon?> thumbIcon({required bool isLight}) =>
      MaterialStateProperty.all<Icon?>(
        Icon(
          !isLight ? Icons.sunny : Icons.mode_night,
          color: Colors.white,
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeNotifierProvider);
    final themeDataController = ref.read(themeNotifierProvider.notifier);

    return Switch(
      thumbIcon: thumbIcon(isLight: themeData == 'dark'),
      value: themeData == 'dark',
      onChanged: (bool value) => themeDataController.toggle(),
    );
  }
}

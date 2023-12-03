import 'package:app_ui/app_ui.dart';
import 'package:app_utils/app_utils.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qtec_task/core/const_variables/const_strings.dart';
import 'package:qtec_task/core/flavor/flavor.dart';
import 'package:qtec_task/core/locale/locale_switch.dart';
import 'package:qtec_task/core/router/router.dart';
import 'package:qtec_task/core/theme/theme_widget.dart';
import 'package:qtec_task/l10n/l10n.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeProvider = ref.watch(localeNotifierProvider);
    final themeProvider = ref.watch(themeNotifierProvider);
    final router = ref.watch(routerProvider);

    // final networkHandler = NetworkHandler.instance;

    // networkHandler.setRef(ref);

    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (_, c) => DismissKeyboard(
        child: MaterialApp.router(
          title: APP_NAME,
          routerConfig: router,

          /// For preventing system dark.
          themeMode: ThemeMode.light,

          /// There will be a flex theme soon!
          theme: themeProvider == 'dark'
              ? const AppDarkTheme().themeData
              : const AppTheme().themeData,

          debugShowCheckedModeBanner:
              BuildConfig.instance.environment != Environment.PRODUCTION,

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: context.allSupportedLocale,
          locale: Locale(localeProvider),
        ),
      ),
      designSize: const Size(376, 766),
    );
  }
}

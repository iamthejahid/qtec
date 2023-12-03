import 'dart:async';
import 'dart:developer';

import 'package:app_ui/app_ui.dart';
import 'package:app_utils/app_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qtec_task/core/di.dart' as di;
import 'package:qtec_task/core/flavor/flavor.dart';
import 'package:qtec_task/local_storage/local_cache/cache.dart';

class ProviderLog extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Logger.i('''
{
  "PROVIDER": "${provider.name}; ${provider.runtimeType}"

}''');
    log('$newValue');
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // FlutterError.onError = (details) {
  //   log(details.exceptionAsString(), stackTrace: details.stack);
  // };

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final container = ProviderContainer(
    observers: [ProviderLog()],
  );

  Logger.init(
    true, // isEnable ，if production ，please false
    isShowFile: false, // In the IDE, whether the file name is displayed
    isShowTime: false, // In the IDE, whether the time is displayed
    levelDebug: 15,
    levelInfo: 10,
    levelWarn: 5,
    phoneVerbose: Colors.white,
    phoneDebug: const Color(0xff27AE60),
    phoneInfo: const Color(0xff2F80ED),
    phoneWarn: const Color(0xffE2B93B),
    phoneError: const Color(0xffEB5757),
  );

  final box = container.read(hiveProvider);

  // Add cross-flavor Hive BoxName
  final boxName = BuildConfig.instance.config.hiveBoxName;

  await box.init(boxName);

  // Add cross-flavor API BASE URL
  // You can use any of bellowed API handler.

  // API HANDLER :: 01

  // NetworkHandler.instance.setup(
  //   baseUrl: BuildConfig.instance.config.baseUrl,
  // );

  // const username = 'mobile';
  // const password = 'secret';

  // // API HANDLER :: 02
  // ApiHandler.instance.setUp(
  //   setupConfiguration: BaseOptions(
  //     baseUrl: BuildConfig.instance.config.baseUrl,
  //   ),
  //   basicHeaderPart: {
  //     HttpHeaders.authorizationHeader:
  //         "Basic ${base64Encode(utf8.encode("$username:$password"))}",
  //   },
  //   token: '',
  //   interceptor: CustomInterceptors(),
  // );

  await di.init();

  runApp(
    ProviderScope(
      parent: container,
      observers: [ProviderLog()],
      child: await builder(),
    ),
  );
}

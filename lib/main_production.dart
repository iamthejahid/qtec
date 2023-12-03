import 'package:app_ui/app_ui.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:qtec_task/app/app.dart';
import 'package:qtec_task/bootstrap.dart';
import 'package:qtec_task/core/flavor/flavor.dart';

void main() async {
  await dotenv.load();
  final devConfig = EnvConfig(
    // appName: 'KStrings.appname',
    appName: 'Qtec',
    shouldCollectCrashLog: true,
    baseUrl: dotenv.env['BASEURL_PRODUCTION']!,
    hiveBoxName: dotenv.env['HIVE_PRODUCTION']!,
  );

  BuildConfig.instantiate(
    envType: Environment.STAGING,
    envConfig: devConfig,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap(() => const App());
}

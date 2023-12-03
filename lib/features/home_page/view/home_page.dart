import 'package:app_ui/app_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String get path => '/homePage';
  static String get name => '/homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWithBackButton(title: 'Home Page'),
      backgroundColor: AppColors.background,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
      ),
    );
  }
}

import 'package:app_ui/app_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qtec_task/features/home_page/home_page.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  static String get path => '/homePage';
  static String get name => '/homePage';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //

    final controller = ref.read(homePageNotiferProvider.notifier);
    final homePageState = ref.watch(homePageNotiferProvider);
    final pageNumber = useState(1);

    useEffect(() {
      Future.microtask(
          () => controller.getData(pageNumber: pageNumber.value.toString()));
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trending Videos',
          style: ContentTextStyle.qtecAppbar,
        ),
      ),
      backgroundColor: AppColors.background,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          children: [
            gap16,
            // Expanded(child: )
          ],
        ),
      ),
    );
  }
}

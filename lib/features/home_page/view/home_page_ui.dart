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
      backgroundColor: AppColors.bg,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: ListView.builder(
          itemCount: homePageState.results.length,
          itemBuilder: (_, index) => Container(
            decoration: BoxDecoration(
              color: AppColors.background,
            ),
            margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 18.w),
            child: Column(
              children: [
                Image.network(
                  homePageState.results[index].thumbnail!,
                  height: 192.h,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40.w,
                          width: 40.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                homePageState.results[index].channelImage!,
                              ),
                            ),
                          ),
                        ),
                        gap12,
                        SizedBox(
                          width: 235.w,
                          height: 40.w,
                          child: Flexible(
                            child: Text(
                              homePageState.results[index].title!,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

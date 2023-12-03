import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qtec_task/core/di.dart';
import 'package:qtec_task/features/home_page/data/home_page_repo.dart';
import 'package:qtec_task/features/home_page/view/providers/home_page_notifier_state.dart';

final homePageNotiferProvider =
    StateNotifierProvider<HomePageNotifier, PageNotifierState>((ref) {
  return HomePageNotifier(repo: sl());
});

class HomePageNotifier extends StateNotifier<PageNotifierState> {
  final GetHomePageDataRepo _repo;
  HomePageNotifier({required GetHomePageDataRepo repo})
      : _repo = repo,
        super(PageNotifierState.init());

  void _stateMaker(PageNotifierState newState) => state = newState;

  getData({required String pageNumber}) async {
    _stateMaker(state.copyWith(isLoading: true));

    await _repo.getHomePageData(pageNumber: pageNumber).then((v) {
      if (v?.results != null) {
        _stateMaker(state.copyWith(results: state.results + v!.results!));
      }
    });
    _stateMaker(state.copyWith(isLoading: false));
  }
}

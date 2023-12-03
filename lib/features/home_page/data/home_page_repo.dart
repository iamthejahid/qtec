import 'package:api_client/network_handler/network.dart';
import 'package:app_utils/app_utils.dart';
import 'package:qtec_task/features/home_page/domain/home_page_api_response.dart';

abstract class GetHomePageDataRepo {
  Future<HomePageApiResponse?> getHomePageData({required String pageNumber});
}

class GetHomePageDataI implements GetHomePageDataRepo {
  final networkHandler = NetworkHandler.instance;

  @override
  Future<HomePageApiResponse?> getHomePageData(
      {required String pageNumber}) async {
    final resPonse = await networkHandler.get(
        endPoint: 'trending-video/1?page=$pageNumber',
        fromData: (v) => HomePageApiResponse.fromJson(v));

    return resPonse.fold((l) {
      Toaster.errorToast(warningMessage: l.error);
      return null;
    }, (r) => r);
  }
}

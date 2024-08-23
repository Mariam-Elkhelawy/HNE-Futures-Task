import 'package:hne_futures_task/core/api/api_manager.dart';
import 'package:hne_futures_task/core/api/end_points.dart';
import 'package:hne_futures_task/core/utils/app_strings.dart';
import 'package:hne_futures_task/core/utils/constants.dart';
import 'package:hne_futures_task/features/gold/data/data_sources/remote/gold_remote_ds.dart';
import 'package:hne_futures_task/features/gold/data/models/GoldModel.dart';

class GoldRemoteDSImplementation implements GoldRemoteDS {
  ApiManager apiManager = ApiManager();

  @override
  Future<GoldModel> getGoldPrices() async {
    var response = await apiManager.getData(
        baseURL: Constants.GOLD_BASE_URL,
        endPoint: EndPoints.gold,
        headers: {AppStrings.token: Constants.GOLD_ACCESS_TOKEN});
    GoldModel goldModel = GoldModel.fromJson(response.data);

    if (response.statusCode == 200) {
      return goldModel;
    } else {
      throw Exception('Failed to load prices');
    }
  }
}

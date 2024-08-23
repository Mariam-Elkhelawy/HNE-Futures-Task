import 'package:hne_futures_task/core/api/api_manager.dart';
import 'package:hne_futures_task/core/api/end_points.dart';
import 'package:hne_futures_task/core/utils/app_strings.dart';
import 'package:hne_futures_task/core/utils/constants.dart';
import 'package:hne_futures_task/features/currency/data/data_sources/currency_remote_ds.dart';
import 'package:hne_futures_task/features/currency/data/models/CurrencyModel.dart';

class CurrencyRemoteDsImplementation implements CurrencyRemoteDs {
  ApiManager apiManager = ApiManager();

  @override
  Future<CurrencyModel> getCurrency() async {
    var response = await apiManager.getData(
        baseURL: Constants.CURRENCY_BASE_URL,
        endPoint: EndPoints.currency,
        queryParameters: {
          AppStrings.accessKey: Constants.CURRENCY_ACCESS_TOKEN,
          AppStrings.symbols: AppStrings.eg
        }
    );

    if (response.statusCode == 200) {
      CurrencyModel currencyModel = CurrencyModel.fromJson(response.data);
      return currencyModel;
    } else {
      throw Exception('Failed to load prices');
    }
  }
}

import 'package:hne_futures_task/features/currency/data/models/CurrencyModel.dart';

abstract class CurrencyRemoteDs {
  Future<CurrencyModel> getCurrency();
}

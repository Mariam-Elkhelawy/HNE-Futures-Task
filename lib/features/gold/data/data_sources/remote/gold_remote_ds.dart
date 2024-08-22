import 'package:hne_futures_task/features/gold/data/models/GoldModel.dart';

abstract class GoldRemoteDS{
  Future<GoldModel> getGoldPrices();
}
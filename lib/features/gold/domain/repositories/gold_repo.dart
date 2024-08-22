import 'package:dartz/dartz.dart';
import 'package:hne_futures_task/core/errors/failures.dart';
import 'package:hne_futures_task/features/gold/data/models/GoldModel.dart';

abstract class GoldRepo{
  Future<Either<Failures,GoldModel>> getGoldPrices();
}
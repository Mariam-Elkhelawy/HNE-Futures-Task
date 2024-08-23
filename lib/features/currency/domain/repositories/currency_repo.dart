import 'package:dartz/dartz.dart';
import 'package:hne_futures_task/core/errors/failures.dart';
import 'package:hne_futures_task/features/currency/data/models/CurrencyModel.dart';

abstract class CurrencyRepo{
  Future<Either<Failures,CurrencyModel>> getCurrency();

}
import 'package:dartz/dartz.dart';
import 'package:hne_futures_task/core/errors/failures.dart';
import 'package:hne_futures_task/features/currency/data/models/CurrencyModel.dart';
import 'package:hne_futures_task/features/currency/domain/repositories/currency_repo.dart';

class CurrencyUseCase {
  CurrencyRepo currencyRepo;

  CurrencyUseCase(this.currencyRepo);
  Future<Either<Failures, CurrencyModel>> getCurrency() async {
    return await currencyRepo.getCurrency();
  }
}

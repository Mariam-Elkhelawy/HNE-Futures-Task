import 'package:dartz/dartz.dart';
import 'package:hne_futures_task/core/errors/failures.dart';
import 'package:hne_futures_task/features/currency/data/data_sources/currency_remote_ds.dart';
import 'package:hne_futures_task/features/currency/data/models/CurrencyModel.dart';
import 'package:hne_futures_task/features/currency/domain/repositories/currency_repo.dart';

class CurrencyRepoImplement implements CurrencyRepo {
  CurrencyRemoteDs currencyRemoteDs;

  CurrencyRepoImplement(this.currencyRemoteDs);

  @override
  Future<Either<Failures, CurrencyModel>> getCurrency() async {
    try {
      var result = await currencyRemoteDs.getCurrency();
      return Right(result);
    } catch (e) {
      return Left(
        RemoteFailures(
          e.toString(),
        ),
      );
    }
  }
}

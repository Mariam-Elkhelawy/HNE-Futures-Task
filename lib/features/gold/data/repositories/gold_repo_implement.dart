import 'package:dartz/dartz.dart';
import 'package:hne_futures_task/core/errors/failures.dart';
import 'package:hne_futures_task/features/gold/data/data_sources/remote/gold_remote_ds.dart';
import 'package:hne_futures_task/features/gold/data/models/GoldModel.dart';
import 'package:hne_futures_task/features/gold/domain/repositories/gold_repo.dart';

class GoldRepoImplementation implements GoldRepo {
  GoldRemoteDS goldRemoteDS;

  GoldRepoImplementation(this.goldRemoteDS);

  @override
  Future<Either<Failures, GoldModel>> getGoldPrices() async {
    try {
      var result = await goldRemoteDS.getGoldPrices();
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

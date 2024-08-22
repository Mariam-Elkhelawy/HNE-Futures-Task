import 'package:dartz/dartz.dart';
import 'package:hne_futures_task/core/errors/failures.dart';
import 'package:hne_futures_task/features/gold/data/models/GoldModel.dart';
import 'package:hne_futures_task/features/gold/domain/repositories/gold_repo.dart';

class GoldUseCase {
  GoldRepo goldRepo;

  GoldUseCase(this.goldRepo);
  Future<Either<Failures, GoldModel>> getGoldPrices() async {
    return await goldRepo.getGoldPrices();
  }
}

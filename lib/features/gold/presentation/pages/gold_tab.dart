import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hne_futures_task/core/enums/enums.dart';
import 'package:hne_futures_task/core/utils/app_colors.dart';
import 'package:hne_futures_task/core/utils/app_strings.dart';
import 'package:hne_futures_task/features/gold/data/data_sources/remote/gold_remote_ds_implement.dart';
import 'package:hne_futures_task/features/gold/data/repositories/gold_repo_implement.dart';
import 'package:hne_futures_task/features/gold/domain/use_cases/gold_usecase.dart';
import 'package:hne_futures_task/features/gold/presentation/bloc/gold_bloc.dart';

class GoldTab extends StatelessWidget {
  const GoldTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldBloc(
        GoldUseCase(
          GoldRepoImplementation(
            GoldRemoteDSImplementation(),
          ),
        ),
      )..add(GoldEvent()),
      child: BlocBuilder<GoldBloc, GoldState>(
        builder: (context, state) {
          if (state.status == ScreenStatus.success && state.goldModel != null) {
            List<Map<String, Object?>> goldPrices = [
              {
                AppStrings.type: AppStrings.k24,
                AppStrings.price: state.goldModel!.priceGram24k
              },
              {
                AppStrings.type: AppStrings.k22,
                AppStrings.price: state.goldModel!.priceGram22k
              },
              {
                AppStrings.type: AppStrings.k21,
                AppStrings.price: state.goldModel!.priceGram21k
              },
              {
                AppStrings.type: AppStrings.k20,
                AppStrings.price: state.goldModel!.priceGram20k
              },
              {
                AppStrings.type: AppStrings.k18,
                AppStrings.price: state.goldModel!.priceGram18k
              },
              {
                AppStrings.type: AppStrings.k16,
                AppStrings.price: state.goldModel!.priceGram16k
              },
              {
                AppStrings.type: AppStrings.k14,
                AppStrings.price: state.goldModel!.priceGram14k
              },
              {
                AppStrings.type: AppStrings.k10,
                AppStrings.price: state.goldModel!.priceGram10k
              },
            ];

            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<GoldBloc>(context).add(GoldEvent());
              },
              child: ListView.builder(
                itemCount: goldPrices.length,
                itemBuilder: (context, index) {
                  final goldType = goldPrices[index][AppStrings.type] as String;
                  final price = goldPrices[index][AppStrings.price] as double?;
                  return ListTile(
                    title: Text('$goldType ${AppStrings.gold}'),
                    subtitle: Text(
                        '${AppStrings.priceCapital} ${price?.toStringAsFixed(2)} ${AppStrings.eg}'),
                  );
                },
              ),
            );
          } else if (state.status == ScreenStatus.failure) {
            return Text(state.failures?.message ?? AppStrings.wrong);
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hne_futures_task/core/enums/enums.dart';
import 'package:hne_futures_task/core/utils/app_colors.dart';
import 'package:hne_futures_task/core/utils/app_images.dart';
import 'package:hne_futures_task/core/utils/app_strings.dart';
import 'package:hne_futures_task/core/utils/app_styles.dart';
import 'package:hne_futures_task/features/currency/data/data_sources/currency_remote_ds_implement.dart';
import 'package:hne_futures_task/features/currency/data/repositories/currency_repo_implement.dart';
import 'package:hne_futures_task/features/currency/domain/use_cases/currency_usecase.dart';
import 'package:hne_futures_task/features/currency/presentation/bloc/currency_bloc.dart';

class CurrencyTab extends StatefulWidget {
  const CurrencyTab({super.key});

  @override
  CurrencyTabState createState() => CurrencyTabState();
}

class CurrencyTabState extends State<CurrencyTab> {
  final amountController = TextEditingController();
  double conversionRate = 0.0;
  String convertedAmount = '';
  String selectedConversion = AppStrings.urToEg;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrencyBloc(
        CurrencyUseCase(
          CurrencyRepoImplement(
            CurrencyRemoteDsImplementation(),
          ),
        ),
      )..add(CurrencyEvent()),
      child: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          if (state.status == ScreenStatus.success &&
              state.currencyModel != null) {
            final double euroToEgpRate = state.currencyModel!.rates!.egp ?? 0.0;
            final double egpToEuroRate = 1 / euroToEgpRate;

            conversionRate = selectedConversion == AppStrings.urToEg
                ? euroToEgpRate
                : egpToEuroRate;

            return RefreshIndicator(
              backgroundColor: AppColor.secondaryColor,
              color: AppColor.primaryColor,
              onRefresh: () async {
                BlocProvider.of<CurrencyBloc>(context).add(CurrencyEvent());
              },
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: ListView(
                  children: [
                    Image.asset(
                      AppImages.currency,
                      height: 320.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                      child: Text(
                        '1 ${AppStrings.ur} = ${euroToEgpRate.toStringAsFixed(2)} ${AppStrings.eg}',
                        textAlign: TextAlign.center,
                        style: AppStyles.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0.h),
                      child: DropdownButtonFormField<String>(
                        value: selectedConversion,
                        decoration: const InputDecoration(
                          labelText: AppStrings.select,
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              selectedConversion = newValue!;
                              amountController.clear();
                              convertedAmount = '';
                            },
                          );
                        },
                        dropdownColor: AppColor.whiteColor,
                        items: <String>[AppStrings.urToEg, AppStrings.egToUr]
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: TextField(
                        controller: amountController,
                        decoration: InputDecoration(
                          labelText:
                              '${AppStrings.enterAmount} ${selectedConversion.startsWith(AppStrings.ur) ? AppStrings.ur : AppStrings.eg}',
                          border: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColor.primaryColor),
                          ),
                          focusColor: AppColor.primaryColor,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          final amount = double.tryParse(value) ?? 0.0;
                          final converted =
                              (amount * conversionRate).toStringAsFixed(2);
                          setState(
                            () {
                              convertedAmount = converted;
                            },
                          );
                        },
                      ),
                    ),
                    // Display the converted amount
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Text(
                        '${AppStrings.amount} ${selectedConversion.startsWith(AppStrings.ur) ? AppStrings.eg : AppStrings.ur} $convertedAmount',
                        textAlign: TextAlign.center,
                        style: AppStyles.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state.status == ScreenStatus.failure) {
            return Center(
              child: Text(
                state.failures?.message ?? AppStrings.wrong,
              ),
            );
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

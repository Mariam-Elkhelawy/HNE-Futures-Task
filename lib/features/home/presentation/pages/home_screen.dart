import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hne_futures_task/core/utils/app_colors.dart';
import 'package:hne_futures_task/core/utils/app_strings.dart';
import 'package:hne_futures_task/core/utils/app_styles.dart';
import 'package:hne_futures_task/features/gold/presentation/pages/gold_tab.dart';
import 'package:hne_futures_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:hne_futures_task/features/home/presentation/widgets/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppStrings.hne,
                style: AppStyles.titleAppBar,
              ),
              backgroundColor: AppColor.primaryColor,
              centerTitle: true,
            ),
            body: GoldTab(),
            bottomNavigationBar: NavBar(
              index: state.navIndex,
              onTabChange: (index) {
                context.read<HomeBloc>().add(HomeIndexChanged(index));
              },
            ),
          );
        },
      ),
    );
  }
}

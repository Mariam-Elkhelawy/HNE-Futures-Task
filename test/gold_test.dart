import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hne_futures_task/core/enums/enums.dart';
import 'package:hne_futures_task/core/utils/app_strings.dart';
import 'package:hne_futures_task/features/gold/data/models/GoldModel.dart';
import 'package:hne_futures_task/features/gold/presentation/bloc/gold_bloc.dart';
import 'package:hne_futures_task/features/gold/presentation/pages/gold_tab.dart';
import 'package:mocktail/mocktail.dart';

class MockGoldBloc extends Mock implements GoldBloc {}

void main() {
  late MockGoldBloc mockGoldBloc;

  setUp(() {
    mockGoldBloc = MockGoldBloc();
  });

  testWidgets('GoldTab displays gold prices when state is success', (WidgetTester tester) async {
    when(() => mockGoldBloc.state).thenReturn(
      GoldState(
        status: ScreenStatus.success,
        goldModel: GoldModel(
          priceGram24k: 3936.654,
          priceGram22k: 3608.5995,
          priceGram21k: 3444.5723,
          priceGram20k: 3280.545,
          priceGram18k: 2952.4905,
          priceGram16k: 2624.436,
          priceGram14k: 2296.3815,
          priceGram10k: 1640.2725,
        ),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<GoldBloc>(
          create: (context) => mockGoldBloc,
          child: const GoldTab(),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('24K ${AppStrings.gold} ${AppStrings.priceCapital} 3936.65 ${AppStrings.eg}'), findsOneWidget);
    expect(find.text('22K ${AppStrings.gold} ${AppStrings.priceCapital} 3608.60 ${AppStrings.eg}'), findsOneWidget);
    expect(find.text('21K ${AppStrings.gold} ${AppStrings.priceCapital} 3444.57 ${AppStrings.eg}'), findsOneWidget);
    expect(find.text('20K ${AppStrings.gold} ${AppStrings.priceCapital} 3280.55 ${AppStrings.eg}'), findsOneWidget);
    expect(find.text('18K ${AppStrings.gold} ${AppStrings.priceCapital} 2952.49 ${AppStrings.eg}'), findsOneWidget);
    expect(find.text('16K ${AppStrings.gold} ${AppStrings.priceCapital} 2624.44 ${AppStrings.eg}'), findsOneWidget);
    expect(find.text('14K ${AppStrings.gold} ${AppStrings.priceCapital} 2296.38 ${AppStrings.eg}'), findsOneWidget);
    expect(find.text('10K ${AppStrings.gold} ${AppStrings.priceCapital} 1640.27 ${AppStrings.eg}'), findsOneWidget);
  });


}

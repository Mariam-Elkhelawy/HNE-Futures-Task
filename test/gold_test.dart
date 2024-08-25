import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hne_futures_task/core/errors/failures.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hne_futures_task/features/gold/presentation/bloc/gold_bloc.dart';
import 'package:hne_futures_task/features/gold/presentation/pages/gold_tab.dart';
import 'package:hne_futures_task/features/gold/data/models/GoldModel.dart';
import 'package:hne_futures_task/core/enums/enums.dart';

class MockGoldBloc extends Mock implements GoldBloc {}

void main() {
  late MockGoldBloc mockGoldBloc;

  setUp(() {
    mockGoldBloc = MockGoldBloc();
  });

  testWidgets('GoldTab displays gold prices when state is success',
      (WidgetTester tester) async {
    final goldModel = GoldModel(
      priceGram24k: 3000,
      priceGram22k: 2700,
      priceGram21k: 2600,
      priceGram20k: 2500,
      priceGram18k: 2300,
      priceGram16k: 2100,
      priceGram14k: 1900,
      priceGram10k: 1500,
    );

    when(mockGoldBloc.state).thenReturn(
        GoldState(status: ScreenStatus.success, goldModel: goldModel));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<GoldBloc>.value(
          value: mockGoldBloc,
          child: const GoldTab(),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('24k'), findsOneWidget);
    expect(find.text('3000'), findsOneWidget);
    expect(find.text('18k'), findsOneWidget);
    expect(find.text('2300'), findsOneWidget);
  });

  testWidgets('GoldTab shows error message when state is failure',
      (WidgetTester tester) async {
    when(mockGoldBloc.state).thenReturn(GoldState(
        status: ScreenStatus.failure,
        failures: RemoteFailures('Failed to fetch data')));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<GoldBloc>.value(
          value: mockGoldBloc,
          child: const GoldTab(),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('Failed to fetch data'), findsOneWidget);
  });

  testWidgets('GoldTab shows loading indicator when state is loading',
      (WidgetTester tester) async {
    when(mockGoldBloc.state)
        .thenReturn(const GoldState(status: ScreenStatus.loading));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<GoldBloc>.value(
          value: mockGoldBloc,
          child: const GoldTab(),
        ),
      ),
    );

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}

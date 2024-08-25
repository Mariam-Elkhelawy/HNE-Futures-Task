import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hne_futures_task/core/errors/failures.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hne_futures_task/features/currency/presentation/bloc/currency_bloc.dart';
import 'package:hne_futures_task/features/currency/presentation/pages/currency_tab.dart';
import 'package:hne_futures_task/features/currency/data/models/CurrencyModel.dart';
import 'package:hne_futures_task/core/enums/enums.dart';

class MockCurrencyBloc extends Mock implements CurrencyBloc {}

void main() {
  late MockCurrencyBloc mockCurrencyBloc;

  setUp(() {
    mockCurrencyBloc = MockCurrencyBloc();
  });

  testWidgets(
      'CurrencyTab displays currency rate for EGP when state is success',
      (WidgetTester tester) async {
    final currencyModel = CurrencyModel(
      base: 'EUR',
      rates: Rates(egp: 19.05),
    );

    when(mockCurrencyBloc.state).thenReturn(
      CurrencyState(
        status: ScreenStatus.success,
        currencyModel: currencyModel,
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CurrencyBloc>.value(
          value: mockCurrencyBloc,
          child: const CurrencyTab(),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('EGP'), findsOneWidget);
    expect(find.text('19.05'), findsOneWidget);
  });

  testWidgets('CurrencyTab shows error message when state is failure',
      (WidgetTester tester) async {
    when(mockCurrencyBloc.state).thenReturn(
      CurrencyState(
        status: ScreenStatus.failure,
        failures: RemoteFailures('Failed to fetch data'),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CurrencyBloc>.value(
          value: mockCurrencyBloc,
          child: const CurrencyTab(),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('Failed to fetch data'), findsOneWidget);
  });

  testWidgets('CurrencyTab shows loading indicator when state is loading',
      (WidgetTester tester) async {
    when(mockCurrencyBloc.state).thenReturn(
      const CurrencyState(status: ScreenStatus.loading),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CurrencyBloc>.value(
          value: mockCurrencyBloc,
          child: const CurrencyTab(),
        ),
      ),
    );

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hne_futures_task/core/enums/enums.dart';
import 'package:hne_futures_task/features/currency/presentation/pages/currency_tab.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hne_futures_task/features/currency/presentation/bloc/currency_bloc.dart';
import 'package:hne_futures_task/features/currency/data/models/CurrencyModel.dart';

class MockCurrencyBloc extends Mock implements CurrencyBloc {}

void main() {
  late CurrencyBloc mockCurrencyBloc;

  setUp(() {
    mockCurrencyBloc = MockCurrencyBloc();
  });

  testWidgets('displays exchange rate between EUR and EGP', (WidgetTester tester) async {
    when(() => mockCurrencyBloc.state).thenReturn(
      CurrencyState(
        status: ScreenStatus.success,
        currencyModel: CurrencyModel(
          rates: Rates(egp: 54.60),
        ),
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

    await tester.pumpAndSettle();

    expect(find.text('1 EUR = 54.60 EGP'), findsOneWidget);
  });

}

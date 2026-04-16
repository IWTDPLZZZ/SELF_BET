import 'package:flutter_test/flutter_test.dart';

import 'package:self_bet/main.dart';

void main() {
  testWidgets('Home screen renders key sections', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(find.textContaining('Добрый день'), findsOneWidget);
    expect(find.text('Mindful Sanctuary'), findsOneWidget);
    expect(find.text('Начать день'), findsOneWidget);
    expect(find.text('Цифровой баланс'), findsOneWidget);
    expect(find.text('Задачи на день'), findsOneWidget);
  });
}

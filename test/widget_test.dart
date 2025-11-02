import 'package:flutter_test/flutter_test.dart';
import 'package:my_m3_tp2/main.dart';

void main() {
  testWidgets('Test de démarrage de MyApp', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
   // expect(find.text('Bienvenue dans ton application Flutter ! 🎉'), findsOneWidget);
  });
}

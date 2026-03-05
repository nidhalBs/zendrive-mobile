import 'package:flutter_test/flutter_test.dart';

import 'package:zendrive_mobile/main.dart';

void main() {
  testWidgets('App renders smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ZenDriveApp());
    expect(find.text('ZenDrive'), findsWidgets);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_extensions/my_extensions.dart';

void main() {
  testWidgets('BuildContext utilities', (tester) async {
    late BuildContext capturedContext;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(),
        home: Builder(
          builder: (context) {
            capturedContext = context;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(capturedContext.mediaQuery, isA<MediaQueryData>());
    expect(capturedContext.theme, isA<ThemeData>());
    expect(capturedContext.textTheme, capturedContext.theme.textTheme);
    expect(capturedContext.colorScheme, capturedContext.theme.colorScheme);
    expect(capturedContext.isDarkMode, isTrue);
    expect(capturedContext.screenWidth, greaterThan(0));
    expect(capturedContext.screenHeight, greaterThan(0));
    expect(capturedContext.orientation, isA<Orientation>());

    await capturedContext.pushPage(
      const Scaffold(
        body: Center(child: Text('Next page')), 
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Next page'), findsOneWidget);

    capturedContext.pop();
    await tester.pumpAndSettle();
    expect(find.text('Next page'), findsNothing);
  });
}

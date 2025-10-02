import 'package:flutter/material.dart';
import 'package:my_extensions/my_extensions.dart';

void main() {
  runApp(const ExtensionsExampleApp());
}

class ExtensionsExampleApp extends StatelessWidget {
  const ExtensionsExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_extensions demo',
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const ExtensionsHomePage(),
    );
  }
}

class ExtensionsHomePage extends StatelessWidget {
  const ExtensionsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleString = 'hello world';
    final numbers = [1, 2, 3, 4, 5];
    final nested = [
      [1, 2],
      [3],
      [4, 5],
    ];
    final infoMap = {'name': 'Flutter', 'type': 'SDK', 'year': 2017};
    final languages = {'en': 'English', 'es': 'Spanish'};
    final now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('my_extensions in action'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Section(
            title: 'String',
            description: [
              "Original: '$sampleString'",
              "Capitalized: ${sampleString.capitalize()}",
              "Words: ${sampleString.capitalizeWords()}",
              "Digits only: 12a34b56.onlyDigits() -> ${'12a34b56'.onlyDigits()}",
              "Mask: 1234567890.mask() -> ${'1234567890'.mask()}",
            ].join('\n'),
          ),
          _Section(
            title: 'int',
            description: [
              '42 factorial = ${42.factorial()}',
              '10.toCurrency() = ${10.toCurrency()}',
              '5.isPrime = ${5.isPrime}',
              '90 minutes as duration = ${90.toDuration(unit: DurationUnit.minutes)}',
            ].join('\n'),
          ),
          _Section(
            title: 'double',
            description: [
              '3.14159 roundTo(2) = ${3.14159.roundTo(2)}',
              '45.0 percentageOf(180) = ${45.0.percentageOf(180)}%',
              '1234.5 formatAsCurrency() = ${1234.5.formatAsCurrency()}',
            ].join('\n'),
          ),
          _Section(
            title: 'DateTime',
            description: [
              'Today? ${now.isToday}',
              'Start of day: ${now.startOfDay}',
              'End of day: ${now.endOfDay}',
              'Long format: ${now.toLongDateString()}',
            ].join('\n'),
          ),
          _Section(
            title: 'List',
            description: [
              'Numbers: $numbers',
              'Sum: ${numbers.sum()} Average: ${numbers.average()}',
              'Distinct: ${[1, 1, 2, 3].distinct()}',
              'Flatten: ${nested.flatten()}',
            ].join('\n'),
          ),
          _Section(
            title: 'Map',
            description: [
              'Original: $infoMap',
              'Pick name/year: ${infoMap.pick(['name', 'year'])}',
              'Invert example: ${languages.invert()}',
            ].join('\n'),
          ),
          _Section(
            title: 'bool',
            description: [
              'true.toYesNo() => ${true.toYesNo()}',
              'false.toggle() => ${false.toggle()}',
            ].join('\n'),
          ),
          _Section(
            title: 'BuildContext',
            description: [
              'Screen size: ${context.screenWidth.toStringAsFixed(0)} x '
                  '${context.screenHeight.toStringAsFixed(0)}',
              'Orientation: ${context.orientation}',
              'Dark mode: ${context.isDarkMode}',
            ].join('\n'),
            trailing: ElevatedButton(
              onPressed: () => context.pushPage(const _DetailsPage()),
              child: const Text('Navigate'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.title,
    required this.description,
    this.trailing,
  });

  final String title;
  final String description;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(description),
                ],
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 16),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}

class _DetailsPage extends StatelessWidget {
  const _DetailsPage();

  @override
  Widget build(BuildContext context) {
    final boolValue = true;
    final toggled = boolValue.toggle();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation demo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Random chunked list: ${[1, 2, 3, 4, 5, 6].chunked(3)}'),
            const SizedBox(height: 8),
            Text('Toggled bool: $toggled (${toggled.toOnOff()})'),
          ],
        ),
      ),
    );
  }
}

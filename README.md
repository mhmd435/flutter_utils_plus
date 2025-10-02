# my_extensions

A curated collection of extension methods for common Dart and Flutter types. The package covers strings, numbers, collections, dates, `BuildContext`, and booleans—providing the same ergonomic sugar you expect from toolkits such as Dartx but tailored for modern Flutter apps.

## Features

- 🔤 **String helpers** – parsing, casing, validation, masking, and formatting utilities.
- 🔢 **Numeric helpers** – prime checks, factorials, currency formatting, rounding, percentage math, and more for `int` and `double`.
- 📅 **Date helpers** – human-friendly date checks, formatting, and range math.
- 🟩 **Collection helpers** – chunking, grouping, distinct filtering, flattening, and aggregation for lists and maps.
- ⚙️ **BuildContext helpers** – quick access to theming, media query data, and typed navigation helpers.
- 🎯 **Bool helpers** – consistent conversions to integers and localized strings.
- ✅ **Null-safe** – extensions on nullable types where it makes sense (`String?`, `int?`, `double?`).

## Getting started

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  my_extensions: ^1.0.0
```

Import the barrel file to gain access to the full extension surface:

```dart
import 'package:my_extensions/my_extensions.dart';
```

## Usage

Below is a quick sampler covering each category. See the [`example/`](example/lib/main.dart) app for a full interactive walkthrough.

```dart
final email = 'hello@example.com';
if (!email.isEmail) {
  throw ArgumentError('Invalid email: ${email.mask()}');
}

final total = [10, 20, 30].sum();        // 60
final average = [10, 20, 30].average();  // 20.0
final chunks = [1, 2, 3, 4, 5].chunked(2); // [[1, 2], [3, 4], [5]]

final now = DateTime.now();
final friendly = now.toLongDateString(); // 11 September 2025
final tomorrow = now.addDays(1);

final price = 1999.toCurrency(locale: 'en_US'); // $1,999.00
final hex = 255.toHex(); // FF

final contextInfo = {
  'isDark': context.isDarkMode,
  'size': '${context.screenWidth}x${context.screenHeight}',
};

final toggled = true.toggle(); // false
```

## Testing & quality

The repository ships with exhaustive unit tests covering each extension and a small Flutter example application. Run the checks locally with:

```bash
flutter pub get
flutter test
flutter analyze
```

## Roadmap

- Additional locale-aware helpers for strings and dates.
- More collection utilities for iterables and sets.
- Community-driven recipes and best practices. Contributions are welcome!

## License

MIT © [Your Name]

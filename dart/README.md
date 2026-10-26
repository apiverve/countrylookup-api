# Country Lookup API - Dart/Flutter Client

Country Lookup matches any country name or ISO code to its official names, ISO 3166 codes, capitals, region, languages, and flag emoji. Paid plans add coordinates and major cities.

[![pub package](https://img.shields.io/pub/v/apiverve_countrylookup.svg)](https://pub.dev/packages/apiverve_countrylookup)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Country Lookup API](https://apiverve.com/marketplace/countrylookup?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_countrylookup: ^1.2.3
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_countrylookup/apiverve_countrylookup.dart';

void main() async {
  final client = CountrylookupClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'country': 'USA',
      'majorcities': true
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "search": "USA",
    "countries": [
      {
        "name": {
          "common": "United States",
          "official": "United States of America",
          "native": {
            "eng": {
              "official": "United States of America",
              "common": "United States"
            }
          }
        },
        "tld": [
          ".us"
        ],
        "cca2": "US",
        "ccn3": "840",
        "cca3": "USA",
        "cioc": "USA",
        "independent": true,
        "status": "officially-assigned",
        "unRegionalGroup": "Western European and Others Group",
        "capital": [
          "Washington D.C."
        ],
        "altSpellings": [
          "US",
          "USA",
          "United States of America"
        ],
        "region": "Americas",
        "subregion": "North America",
        "languages": {
          "eng": "English"
        },
        "latlng": [
          38,
          -97
        ],
        "landlocked": false,
        "flag": "🇺🇸"
      }
    ]
  }
}
```

## API Reference

- **API Home:** [Country Lookup API](https://apiverve.com/marketplace/countrylookup?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/countrylookup](https://docs.apiverve.com/ref/countrylookup?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)

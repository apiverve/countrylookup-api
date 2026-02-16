# Country Lookup API - Dart/Flutter Client

Country Lookup is a simple tool for looking up country data. It returns the country name, capital, and more.

[![pub package](https://img.shields.io/pub/v/apiverve_countrylookup.svg)](https://pub.dev/packages/apiverve_countrylookup)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Country Lookup API](https://apiverve.com/marketplace/countrylookup?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_countrylookup: ^1.1.14
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
        "currencies": {
          "USD": {
            "name": "United States dollar",
            "symbol": "$"
          }
        },
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
        "borders": [
          "CAN",
          "MEX"
        ],
        "area": 9372610,
        "flag": "🇺🇸",
        "majorCities": [
          "Akron",
          "Albany",
          "Albuquerque",
          "Alexandria",
          "Allentown",
          "Alpharetta",
          "Anaheim",
          "Anchorage",
          "Ann Arbor",
          "Arlington",
          "Arlington",
          "Asheville",
          "Astoria",
          "Atlanta",
          "Aurora",
          "Austin",
          "Bakersfield",
          "Baltimore",
          "Baton Rouge",
          "Beaverton",
          "Bellevue",
          "Berkeley",
          "Beverly Hills",
          "Birmingham",
          "Boca Raton",
          "Boise",
          "Boston",
          "Boulder",
          "Bronx",
          "Brooklyn",
          "Buffalo",
          "Cambridge",
          "Carlsbad",
          "Cary",
          "Chandler",
          "Charleston",
          "Charlotte",
          "Charlottesville",
          "Chattanooga",
          "Cherry Hill",
          "Chicago",
          "Cincinnati",
          "Clearwater",
          "Cleveland",
          "Colorado Springs",
          "Columbia",
          "Columbia",
          "Columbus",
          "Costa Mesa",
          "Dallas"
        ]
      }
    ]
  }
}
```

## API Reference

- **API Home:** [Country Lookup API](https://apiverve.com/marketplace/countrylookup?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/countrylookup](https://docs.apiverve.com/ref/countrylookup?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)

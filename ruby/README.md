# Country Lookup API - Ruby Gem

Country Lookup matches any country name or ISO code to its official names, ISO 3166 codes, capitals, region, languages, and flag emoji. Paid plans add coordinates and major cities.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_countrylookup'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_countrylookup
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_countrylookup'

# Initialize the client
client = APIVerve::Countrylookup::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  country: "USA",
  majorcities: true
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ country: "USA", majorcities: true })
  puts response["data"]
rescue APIVerve::Countrylookup::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Countrylookup::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Countrylookup::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
```

## Example Response

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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/countrylookup?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/countrylookup?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/countrylookup?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).

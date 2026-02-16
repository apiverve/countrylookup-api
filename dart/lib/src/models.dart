/// Response models for the Country Lookup API.

/// API Response wrapper.
class CountrylookupResponse {
  final String status;
  final dynamic error;
  final CountrylookupData? data;

  CountrylookupResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory CountrylookupResponse.fromJson(Map<String, dynamic> json) => CountrylookupResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CountrylookupData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Country Lookup API.

class CountrylookupData {
  String? search;
  List<CountrylookupDataCountriesItem>? countries;

  CountrylookupData({
    this.search,
    this.countries,
  });

  factory CountrylookupData.fromJson(Map<String, dynamic> json) => CountrylookupData(
      search: json['search'],
      countries: (json['countries'] as List?)?.map((e) => CountrylookupDataCountriesItem.fromJson(e)).toList(),
    );
}

class CountrylookupDataCountriesItem {
  CountrylookupDataCountriesItemName? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  CountrylookupDataCountriesItemCurrencies? currencies;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  CountrylookupDataCountriesItemLanguages? languages;
  List<int>? latlng;
  bool? landlocked;
  List<String>? borders;
  int? area;
  String? flag;
  List<String>? majorCities;

  CountrylookupDataCountriesItem({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.currencies,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.latlng,
    this.landlocked,
    this.borders,
    this.area,
    this.flag,
    this.majorCities,
  });

  factory CountrylookupDataCountriesItem.fromJson(Map<String, dynamic> json) => CountrylookupDataCountriesItem(
      name: json['name'] != null ? CountrylookupDataCountriesItemName.fromJson(json['name']) : null,
      tld: (json['tld'] as List?)?.cast<String>(),
      cca2: json['cca2'],
      ccn3: json['ccn3'],
      cca3: json['cca3'],
      cioc: json['cioc'],
      independent: json['independent'],
      status: json['status'],
      currencies: json['currencies'] != null ? CountrylookupDataCountriesItemCurrencies.fromJson(json['currencies']) : null,
      capital: (json['capital'] as List?)?.cast<String>(),
      altSpellings: (json['altSpellings'] as List?)?.cast<String>(),
      region: json['region'],
      subregion: json['subregion'],
      languages: json['languages'] != null ? CountrylookupDataCountriesItemLanguages.fromJson(json['languages']) : null,
      latlng: (json['latlng'] as List?)?.cast<int>(),
      landlocked: json['landlocked'],
      borders: (json['borders'] as List?)?.cast<String>(),
      area: json['area'],
      flag: json['flag'],
      majorCities: (json['majorCities'] as List?)?.cast<String>(),
    );
}

class CountrylookupDataCountriesItemName {
  String? common;
  String? official;
  CountrylookupDataCountriesItemNameNative? native;

  CountrylookupDataCountriesItemName({
    this.common,
    this.official,
    this.native,
  });

  factory CountrylookupDataCountriesItemName.fromJson(Map<String, dynamic> json) => CountrylookupDataCountriesItemName(
      common: json['common'],
      official: json['official'],
      native: json['native'] != null ? CountrylookupDataCountriesItemNameNative.fromJson(json['native']) : null,
    );
}

class CountrylookupDataCountriesItemNameNative {
  CountrylookupDataCountriesItemNameNativeEng? eng;

  CountrylookupDataCountriesItemNameNative({
    this.eng,
  });

  factory CountrylookupDataCountriesItemNameNative.fromJson(Map<String, dynamic> json) => CountrylookupDataCountriesItemNameNative(
      eng: json['eng'] != null ? CountrylookupDataCountriesItemNameNativeEng.fromJson(json['eng']) : null,
    );
}

class CountrylookupDataCountriesItemNameNativeEng {
  String? official;
  String? common;

  CountrylookupDataCountriesItemNameNativeEng({
    this.official,
    this.common,
  });

  factory CountrylookupDataCountriesItemNameNativeEng.fromJson(Map<String, dynamic> json) => CountrylookupDataCountriesItemNameNativeEng(
      official: json['official'],
      common: json['common'],
    );
}

class CountrylookupDataCountriesItemCurrencies {
  CountrylookupDataCountriesItemCurrenciesUsd? USD;

  CountrylookupDataCountriesItemCurrencies({
    this.USD,
  });

  factory CountrylookupDataCountriesItemCurrencies.fromJson(Map<String, dynamic> json) => CountrylookupDataCountriesItemCurrencies(
      USD: json['USD'] != null ? CountrylookupDataCountriesItemCurrenciesUsd.fromJson(json['USD']) : null,
    );
}

class CountrylookupDataCountriesItemCurrenciesUsd {
  String? name;
  String? symbol;

  CountrylookupDataCountriesItemCurrenciesUsd({
    this.name,
    this.symbol,
  });

  factory CountrylookupDataCountriesItemCurrenciesUsd.fromJson(Map<String, dynamic> json) => CountrylookupDataCountriesItemCurrenciesUsd(
      name: json['name'],
      symbol: json['symbol'],
    );
}

class CountrylookupDataCountriesItemLanguages {
  String? eng;

  CountrylookupDataCountriesItemLanguages({
    this.eng,
  });

  factory CountrylookupDataCountriesItemLanguages.fromJson(Map<String, dynamic> json) => CountrylookupDataCountriesItemLanguages(
      eng: json['eng'],
    );
}

class CountrylookupRequest {
  String country;
  bool? majorcities;

  CountrylookupRequest({
    required this.country,
    this.majorcities,
  });

  Map<String, dynamic> toJson() => {
      'country': country,
      if (majorcities != null) 'majorcities': majorcities,
    };
}

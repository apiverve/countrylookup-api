/// Response models for the Country Lookup API.

/// API Response wrapper.
class CountrylookupResponse {
  final String status;
  final dynamic error;
  final CountrylookupData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  CountrylookupResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory CountrylookupResponse.fromJson(Map<String, dynamic> json) => CountrylookupResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CountrylookupData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
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
  String? unRegionalGroup;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  CountrylookupDataCountriesItemLanguages? languages;
  List<num>? latlng;
  bool? landlocked;
  String? flag;

  CountrylookupDataCountriesItem({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.unRegionalGroup,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.latlng,
    this.landlocked,
    this.flag,
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
      unRegionalGroup: json['unRegionalGroup'],
      capital: (json['capital'] as List?)?.cast<String>(),
      altSpellings: (json['altSpellings'] as List?)?.cast<String>(),
      region: json['region'],
      subregion: json['subregion'],
      languages: json['languages'] != null ? CountrylookupDataCountriesItemLanguages.fromJson(json['languages']) : null,
      latlng: (json['latlng'] as List?)?.cast<num>(),
      landlocked: json['landlocked'],
      flag: json['flag'],
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

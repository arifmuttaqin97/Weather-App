// To parse this JSON data, do
//
//     final locationName = locationNameFromJson(jsonString);

// import 'dart:convert';

// List<LocationName> locationNameFromJson(String str) => List<LocationName>.from(json.decode(str).map((x) => LocationName.fromJson(x)));

// String locationNameToJson(List<LocationName> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationName {
  String? name;
  Map<String, String>? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  LocationName({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
    this.state,
  });

  factory LocationName.fromJson(Map<String, dynamic> json) => LocationName(
    name: json["name"],
    localNames: Map.from(
      json["local_names"]!,
    ).map((k, v) => MapEntry<String, String>(k, v)),
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    country: json["country"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "local_names": Map.from(
      localNames!,
    ).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "lat": lat,
    "lon": lon,
    "country": country,
    "state": state,
  };
}

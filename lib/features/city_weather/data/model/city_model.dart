class CityModel {
  final String name;
  final double lat;
  final double lon;
  CityModel({
    required this.name,
    required this.lat,
    required this.lon,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'] ?? '',
      lat: map['lat'],
      lon: map['lon'],
    );
  }
}

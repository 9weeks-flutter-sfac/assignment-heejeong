class Geo {
  String lat;
  String lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(lat: map['lat'], lng: map['lng']);
  }
}

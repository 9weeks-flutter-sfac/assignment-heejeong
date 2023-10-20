import 'package:train/profileApp/model/geo.dart';

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
        street: map['street'],
        suite: map['suite'],
        city: map['city'],
        zipcode: map['zipcode'],
        //geo map 가져오기
        geo: Geo.fromMap(map['geo']));
  }
}

import 'package:train/profileApp/model/address.dart';
import 'package:train/profileApp/model/company.dart';

class Profile {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  Profile(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      address: Address.fromMap(map['address']),
      phone: map['phone'],
      website: map['website'],
      company: Company.fromMap(map['company']),
    );
  }
}

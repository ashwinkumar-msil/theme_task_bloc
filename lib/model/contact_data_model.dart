import 'dart:convert';

List<Contact> contactFromJson(String str) =>
    List<Contact>.from(json.decode(str).map((x) => Contact.fromJson(x)));

String contactToJson(List<Contact> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contact {
  Contact({
    required this.id,
    required this.name,
    required this.contacts,
    required this.url,
  });

  String id;
  String name;
  String contacts;
  String url;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        contacts: json["Contacts"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "Contacts": contacts,
        "url": url,
      };
}

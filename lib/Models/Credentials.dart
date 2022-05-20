import 'dart:convert';
class Credentials {
  // final bool Exist;
  late final String? value_name;
  final String? value_email;
  final String? value_pass;

  Credentials(
      { this.value_name, this.value_email, this.value_pass});

  static Map<String, dynamic> toMap(Credentials model) => {
    'name': model.value_name,
    'email': model.value_email,
    'pass': model.value_pass,
  };

  factory Credentials.fromJson(Map<String, dynamic> jsonData) {
    return Credentials(
      value_name: jsonData['name'],
      value_email: jsonData['email'],
      value_pass: jsonData['pass'],
    );
  }

  static String encode(List<Credentials> musics) => json.encode(
    musics
        .map<Map<String, dynamic>>((music) => Credentials.toMap(music))
        .toList(),
  );

  static List<Credentials> decode(String musics) =>
      (json.decode(musics) as List<dynamic>)
          .map<Credentials>((item) => Credentials.fromJson(item))
          .toList();
}

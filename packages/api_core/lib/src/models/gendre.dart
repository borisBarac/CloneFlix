// ignore_for_file: public_member_api_docs

class Genre {
  Genre({
    required this.id,
    required this.name,
  });
  factory Genre.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null || json['name'] == null) {
      throw ArgumentError('Wrong JSON format');
    }
    return Genre(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  int id;
  String name;
}

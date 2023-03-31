class CatFactModel {
  final String id;
  final String text;
  final DateTime updatedAt;

  CatFactModel({
    required this.id,
    required this.text,
    required this.updatedAt,
  });

  factory CatFactModel.fromJson(Map<String, dynamic> json) {
    return CatFactModel(
      id: json['_id'],
      text: json['text'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'updatedAt': updatedAt,
      };
}

class CatFactModel {
  String id;
  String text;
  DateTime? updatedAt;

  CatFactModel({
    required this.id,
    required this.text,
    this.updatedAt,
  });

  factory CatFactModel.fromJson(Map<dynamic, dynamic> json) {
    return CatFactModel(
      id: json['_id'],
      text: json['text'],
      updatedAt: DateTime.tryParse(json['updatedAt']),
    );
  }

  factory CatFactModel.fromHiveDB(Map<String, dynamic> json) {
    return CatFactModel(
      id: json['_id'],
      text: json['text'],
      updatedAt:
          DateTime.tryParse(json['updatedAt'].toString().substring(0, 19)),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'text': text,
        'updatedAt': updatedAt,
      };
}

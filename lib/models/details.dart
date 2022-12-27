import 'dart:convert';

Detail detailFromJson(String str) => Detail.fromJson(json.decode(str));

String detailToJson(Detail data) => json.encode(data.toJson());

class Detail {
  Detail({
    required this.drinks,
  });

  List<Map<String, String>> drinks;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        drinks: List<Map<String, String>>.from(json["drinks"].map((x) =>
            Map.from(x).map((k, v) => MapEntry<String, String>(k, v ?? "")))),
      );

  Map<String, dynamic> toJson() => {
        "drinks": List<dynamic>.from(drinks.map((x) =>
            Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v ?? "")))),
      };
}

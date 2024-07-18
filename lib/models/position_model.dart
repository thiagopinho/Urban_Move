import 'dart:convert';

class PositionModel {
  final String prefixo; // p
  final bool acessivel; // a
  final String horarioCaptura; // ta
  final double latitude; // py
  final double longitude; // px

  PositionModel({
    required this.prefixo,
    required this.acessivel,
    required this.horarioCaptura,
    required this.latitude,
    required this.longitude,
  });

  PositionModel copyWith({
    String? prefixo,
    bool? acessivel,
    String? horarioCaptura,
    double? latitude,
    double? longitude,
  }) {
    return PositionModel(
      prefixo: prefixo ?? this.prefixo,
      acessivel: acessivel ?? this.acessivel,
      horarioCaptura: horarioCaptura ?? this.horarioCaptura,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prefixo': prefixo,
      'acessivel': acessivel,
      'horarioCaptura': horarioCaptura,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory PositionModel.fromMap(Map<String, dynamic> map) {
    return PositionModel(
      prefixo: map['p'] as String,
      acessivel: map['a'] as bool,
      horarioCaptura: map['ta'] as String,
      latitude: map['py'] as double,
      longitude: map['px'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory PositionModel.fromJson(Map<String, dynamic> source) =>
      PositionModel.fromMap(source);
  @override
  String toString() {
    return 'PositionModel(prefixo: $prefixo, acessivel: $acessivel, horarioCaptura: $horarioCaptura, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant PositionModel other) {
    if (identical(this, other)) return true;

    return other.prefixo == prefixo &&
        other.acessivel == acessivel &&
        other.horarioCaptura == horarioCaptura &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return prefixo.hashCode ^
        acessivel.hashCode ^
        horarioCaptura.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}

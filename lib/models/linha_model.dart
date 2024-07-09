import 'dart:convert';

class Linha {
  final String linha;

  Linha({
    required this.linha,
  });

  @override
  String toString() => 'X(linha: $linha)';

  Linha copyWith({
    String? linha,
  }) {
    return Linha(
      linha: linha ?? this.linha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'linha': linha,
    };
  }

  factory Linha.fromMap(Map<String, dynamic> map) {
    return Linha(
      linha: map['cl'] != null ? map['cl'].toString() : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Linha.fromJson(String source) =>
      Linha.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Linha other) {
    if (identical(this, other)) return true;

    return other.linha == linha;
  }

  @override
  int get hashCode => linha.hashCode;
}

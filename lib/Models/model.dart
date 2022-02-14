class Modelfinance {
  String id;
  String name;
  String code;

  Modelfinance({
    this.id,
    this.name,
    this.code,
  });
  factory Modelfinance.fromJson(Map<String, dynamic> json) {
    return Modelfinance(
      id: json["id"] as String,
      name: json['data']["full_name"] as String,
      code: json["kode"] as String,
    );
  }
}

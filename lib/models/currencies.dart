class CurrenciesModel {
  final String name;
  final double buy;
  final double sell;
  final double variation;

  const CurrenciesModel({this.name, this.buy, this.sell, this.variation});

  factory CurrenciesModel.fromJson(Map<String, dynamic> json) {
    return CurrenciesModel(
      name: json['name'],
      buy: json['buy'],
      sell: json['sell'],
      variation: json['variation'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['buy'] = this.buy;
    data['sell'] = this.sell;
    data['variation'] = this.variation;
    return data;
  }
}

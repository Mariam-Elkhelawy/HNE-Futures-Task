class CurrencyModel {
  CurrencyModel({
      this.success, 
      this.timestamp, 
      this.base, 
      this.date, 
      this.rates,});

  CurrencyModel.fromJson(dynamic json) {
    success = json['success'];
    timestamp = json['timestamp'];
    base = json['base'];
    date = json['date'];
    rates = json['rates'] != null ? Rates.fromJson(json['rates']) : null;
  }
  bool? success;
  int? timestamp;
  String? base;
  String? date;
  Rates? rates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['timestamp'] = timestamp;
    map['base'] = base;
    map['date'] = date;
    if (rates != null) {
      map['rates'] = rates?.toJson();
    }
    return map;
  }

}

class Rates {
  Rates({
      this.egp,});

  Rates.fromJson(dynamic json) {
    egp = json['EGP'];
  }
  double? egp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['EGP'] = egp;
    return map;
  }

}
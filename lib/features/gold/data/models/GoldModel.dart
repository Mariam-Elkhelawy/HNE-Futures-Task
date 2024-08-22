class GoldModel {
  GoldModel({
      this.timestamp, 
      this.metal, 
      this.currency, 
      this.exchange, 
      this.symbol, 
      this.openTime, 
      this.price, 
      this.ch, 
      this.ask, 
      this.bid, 
      this.priceGram24k, 
      this.priceGram22k, 
      this.priceGram21k, 
      this.priceGram20k, 
      this.priceGram18k, 
      this.priceGram16k, 
      this.priceGram14k, 
      this.priceGram10k,});

  GoldModel.fromJson(dynamic json) {
    timestamp = json['timestamp'];
    metal = json['metal'];
    currency = json['currency'];
    exchange = json['exchange'];
    symbol = json['symbol'];
    openTime = json['open_time'];
    price = json['price'];
    ch = json['ch'];
    ask = json['ask'];
    bid = json['bid'];
    priceGram24k = json['price_gram_24k'];
    priceGram22k = json['price_gram_22k'];
    priceGram21k = json['price_gram_21k'];
    priceGram20k = json['price_gram_20k'];
    priceGram18k = json['price_gram_18k'];
    priceGram16k = json['price_gram_16k'];
    priceGram14k = json['price_gram_14k'];
    priceGram10k = json['price_gram_10k'];
  }
  int? timestamp;
  String? metal;
  String? currency;
  String? exchange;
  String? symbol;
  int? openTime;
  double? price;
  double? ch;
  double? ask;
  double? bid;
  double? priceGram24k;
  double? priceGram22k;
  double? priceGram21k;
  double? priceGram20k;
  double? priceGram18k;
  double? priceGram16k;
  double? priceGram14k;
  double? priceGram10k;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = timestamp;
    map['metal'] = metal;
    map['currency'] = currency;
    map['exchange'] = exchange;
    map['symbol'] = symbol;
    map['open_time'] = openTime;
    map['price'] = price;
    map['ch'] = ch;
    map['ask'] = ask;
    map['bid'] = bid;
    map['price_gram_24k'] = priceGram24k;
    map['price_gram_22k'] = priceGram22k;
    map['price_gram_21k'] = priceGram21k;
    map['price_gram_20k'] = priceGram20k;
    map['price_gram_18k'] = priceGram18k;
    map['price_gram_16k'] = priceGram16k;
    map['price_gram_14k'] = priceGram14k;
    map['price_gram_10k'] = priceGram10k;
    return map;
  }

}
class Coin {
  final String id;
  final String name;
  final String symbol;
  final String image;
  int currentPrice;
  double priceVariationPercent;

  Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.priceVariationPercent,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      image: json['image'],
      currentPrice: json['currentPrice'],
      priceVariationPercent: json['priceVariationPercent'],
    );
  }
}

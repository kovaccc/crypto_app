import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String id;
  final String image;
  final String name;
  final String symbol;
  final double currentPrice;
  final double priceChangePercentage24h;
  final int marketCapRank;
  final String? description;
  final List<double>? prices;

  const Token({
    required this.id,
    required this.image,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.priceChangePercentage24h,
    required this.marketCapRank,
    this.description,
    this.prices,
  });

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        symbol,
        currentPrice,
        priceChangePercentage24h,
        marketCapRank,
        description,
        prices,
      ];
}

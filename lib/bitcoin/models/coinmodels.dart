class CoinModel {
  String time;
  String asset;
  String rate;

  CoinModel({required this.time, required this.asset, required this.rate});

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    return CoinModel(
      time: map["time"].toString(),
      asset: map["asset"].toString(),
      rate: map["rate"].toString(),
    );
  }
}

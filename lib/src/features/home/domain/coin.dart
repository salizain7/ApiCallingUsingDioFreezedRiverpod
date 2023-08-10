import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin.freezed.dart';
part 'coin.g.dart';

@freezed
class Coin with _$Coin{
  const factory Coin({

    @Default("") String id,
    @Default("") String name,
    @Default("") String symbol,
    @Default("") String type,

  })= _Coin;

  factory Coin.fromJson(Map<String, dynamic> json) =>_$CoinFromJson(json);
}

@Freezed()
class CoinModel  with _$CoinModel{


  const factory CoinModel({
    List<Coin>? team,
  }) = _CoinModel;

  factory CoinModel.fromJson(Map<String,dynamic> json) => _$CoinModelFromJson(json);
}

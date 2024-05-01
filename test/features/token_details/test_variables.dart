import 'package:crypto_app/core/domain/failures/failure.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:crypto_app/features/token_details/data/models/token_current_price_response.dart';
import 'package:crypto_app/features/token_details/data/models/token_description_response.dart';
import 'package:crypto_app/features/token_details/data/models/token_details_response.dart';
import 'package:crypto_app/features/token_details/data/models/token_image_response.dart';
import 'package:crypto_app/features/token_details/data/models/token_market_data_response.dart';
import 'package:crypto_app/features/token_details/data/models/token_sparkline_response.dart';

const testTokenId = "tether";
const testGenericFailure = Failure(title: "Error occurred");

const testTokenWithDetails = Token(
    id: 'tether',
    symbol: 'usdt',
    name: 'Tether',
    image:
        'https://assets.coingecko.com/coins/images/325/small/Tether.png?1696501661',
    currentPrice: 0.999152,
    priceChangePercentage24h: -0.04947,
    prices: [
      1.0002517780853786,
      1.0000663864656067,
      1.0005456738265688,
      1.0006171268428694,
      0.9997953867241891,
      1.0000987163726585,
      1.0004433181859054,
      1.0003080798979165,
      0.9995298180703459,
      1.0004834199158152,
      1.0005303739079994,
      1.0007439197334873,
      1.0005331105361341,
      1.0002706668618433,
      1.0000972495330498,
      1.0002416276513553,
      1.0004283501085696,
      1.0006610805447078,
      1.000863683490918,
      1.0011294714407353,
      1.000628249329069,
      1.0006966506999093,
      1.0008455258208038,
      1.0003389654678085,
      1.0005837394114427,
      1.0004186798216372,
      1.0001505542655171,
      1.0007511174642771,
      1.0003804419481488,
      1.0003786147612872,
      1.0003599004336565,
      0.9999898392649079,
      0.9998553065828648,
      0.9999942722272038,
      1.0003134492583496,
      1.0002131095260507,
      0.999956970452015,
      0.9998019694475176,
      0.9996201643934085,
      0.9999697838015607,
      0.9998121729236951,
      1.0005939400356594,
      1.000010894375211,
      0.9998210219489538,
      1.0006482403628525,
      0.9998685433850341,
      1.0003663656821604,
      0.9992856786736224,
      0.9988318203567363,
      0.9980536623119333,
      0.9990384273834466,
      0.9992965454470208,
      0.9998258464860761,
      0.9998493917856899,
      0.9992797514606423,
      1.000311691162327,
      0.9998146411867562,
      0.9997392831992755,
      0.999699340850405,
      0.9999557477869127,
      0.9998019014521367,
      1.000180573530509,
      1.0007663829648712,
      0.9997595903238627,
      0.9999236664510307,
      0.9993976153711529,
      0.9989732206247034,
      0.9994691186457654,
      0.999328141838111,
      1.0003522425995048,
      0.9997211443844929,
      0.9994919270562928,
      1.0002407145876022,
      0.9996681085965403,
      0.9997763181237532,
      1.0000053285477277,
      0.9999909483733233,
      0.9998275628717788,
      0.9997139936730317,
      0.9995195923614799,
      1.0004758172531283,
      1.0000759142887623,
      0.9996640557065303,
      1.0007912433089958,
      0.9997323452846186,
      1.0000603758928976,
      1.000107713027889,
      1.0009381301302953,
      0.9990520411508356,
      1.000001566462588,
      0.9990649562677948,
      1.001415124315665,
      0.9996753802029512,
      0.9995342669409605,
      1.0000178259636794,
      0.9992498571190759,
      0.9997344281589605,
      0.9996211640943335,
      0.9997581244265294,
      0.9999913958946628,
      0.9998382931244769,
      0.9996449459450202,
      0.9998965366154972,
      1.0001985421230655,
      0.9996747626238605,
      1.0001331069125472,
      0.9997706436969849,
      0.9998207564736272,
      1.0001308355720597,
      0.9994645279222463,
      0.9991887636623761,
      0.9992327386729275,
      0.9998651899178648,
      0.9994158494463746,
      0.9992686648081804,
      0.9992356509517111,
      0.9998460998878987,
      0.9997114630486297,
      0.9989797491331235,
      0.9992448433803479,
      0.9989734025398359,
      0.9989130612941265,
      0.9991318020760993,
      0.9993166696642966,
      0.9995532599034964,
      0.9996294507668242,
      0.9991130764504942,
      0.9992109467194603,
      0.9988571997688094,
      0.9990694951963702,
      0.9994564459505407,
      0.9994454878458314,
      0.9995457811100884,
      0.9992773635499329,
      0.9994182514428022,
      0.9993792585851072,
      0.9993004884214666,
      0.9996592938716623,
      0.9992665374489587,
      0.9996317369931681,
      0.9999208102063403,
      0.99979162779232,
      0.9997323426040926,
      0.9995351712812344,
      0.9995972016801626,
      0.9999189569668347,
      0.9998395286073817,
      0.9995929751068225,
      0.9998146800224746,
      1.0003601091209942,
      0.999414397349188,
      1.0001859481768836,
      0.9993828537035457,
      0.9994900139170174,
      1.000099752410064,
      0.9998113561837543,
      1.0011537045736034,
      1.0001382690053826,
      0.9994154772660313,
      0.999390415380602,
      0.9998447034759368,
      1.000339547218214,
      0.9998978779323683,
      1.0002241657774262,
      1.0007961507380536,
      0.9996536654091135,
      0.9995400278420805
    ],
    marketCapRank: 3,
    description:
        'Tether (USDT) is a cryptocurrency with a value meant to mirror the value of the U.S. dollar. The idea was to create a stable cryptocurrency that can be used like digital dollars. Coins that serve this purpose of being a stable dollar substitute are called “stable coins.” Tether is the most popular stable coin and even acts as a dollar replacement on many popular exchanges! According to their site, Tether converts cash into digital currency, to anchor or “tether” the value of the coin to the price of national currencies like the US dollar, the Euro, and the Yen. Like other cryptos it uses blockchain. Unlike other cryptos, it is [according to the official Tether site] “100% backed by USD” (USD is held in reserve). The primary use of Tether is that it offers some stability to the otherwise volatile crypto space and offers liquidity to exchanges who can’t deal in dollars and with banks (for example to the sometimes controversial but leading exchange \u003ca href=\"https://www.coingecko.com/en/exchanges/bitfinex\"\u003eBitfinex\u003c/a\u003e).\r\n\r\nThe digital coins are issued by a company called Tether Limited that is governed by the laws of the British Virgin Islands, according to the legal part of its website. It is incorporated in Hong Kong. It has emerged that Jan Ludovicus van der Velde is the CEO of cryptocurrency exchange Bitfinex, which has been accused of being involved in the price manipulation of bitcoin, as well as tether. Many people trading on exchanges, including Bitfinex, will use tether to buy other cryptocurrencies like bitcoin. Tether Limited argues that using this method to buy virtual currencies allows users to move fiat in and out of an exchange more quickly and cheaply. Also, exchanges typically have rocky relationships with banks, and using Tether is a way to circumvent that.\r\n\r\nUSDT is fairly simple to use. Once on exchanges like \u003ca href=\"https://www.coingecko.com/en/exchanges/poloniex\"\u003ePoloniex\u003c/a\u003e or Bittrex, it can be used to purchase Bitcoin and other cryptocurrencies. It can be easily transferred from an exchange to any Omni Layer enabled wallet. Tether has no transaction fees, although external wallets and exchanges may charge one. In order to convert USDT to USD and vise versa through the Tether.to Platform, users must pay a small fee. Buying and selling Tether for Bitcoin can be done through a variety of exchanges like the ones mentioned previously or through the Tether.to platform, which also allows the conversion between USD to and from your bank account.');

final testTokenDetailsResponse = TokenDetailsResponse(
  id: 'tether',
  symbol: 'usdt',
  name: 'Tether',
  image: TokenImageResponse(
      thumb:
          'https://assets.coingecko.com/coins/images/325/large/Tether.png?1696501661',
      small:
          'https://assets.coingecko.com/coins/images/325/large/Tether.png?1696501661',
      large:
          'https://assets.coingecko.com/coins/images/325/large/Tether.png?1696501661'),
  marketCapRank: 3,
  marketData: TokenMarketDataResponse(
    currentPrice: TokenCurrentPriceResponse(usd: 0.999152),
    priceChangePercentage24h: -0.04947,
    sparkline7d: TokenSparklineResponse(prices: [
      1.0002517780853786,
      1.0000663864656067,
      1.0005456738265688,
      1.0006171268428694,
      0.9997953867241891,
      1.0000987163726585,
      1.0004433181859054,
      1.0003080798979165,
      0.9995298180703459,
      1.0004834199158152,
      1.0005303739079994,
      1.0007439197334873,
      1.0005331105361341,
      1.0002706668618433,
      1.0000972495330498,
      1.0002416276513553,
      1.0004283501085696,
      1.0006610805447078,
      1.000863683490918,
      1.0011294714407353,
      1.000628249329069,
      1.0006966506999093,
      1.0008455258208038,
      1.0003389654678085,
      1.0005837394114427,
      1.0004186798216372,
      1.0001505542655171,
      1.0007511174642771,
      1.0003804419481488,
      1.0003786147612872,
      1.0003599004336565,
      0.9999898392649079,
      0.9998553065828648,
      0.9999942722272038,
      1.0003134492583496,
      1.0002131095260507,
      0.999956970452015,
      0.9998019694475176,
      0.9996201643934085,
      0.9999697838015607,
      0.9998121729236951,
      1.0005939400356594,
      1.000010894375211,
      0.9998210219489538,
      1.0006482403628525,
      0.9998685433850341,
      1.0003663656821604,
      0.9992856786736224,
      0.9988318203567363,
      0.9980536623119333,
      0.9990384273834466,
      0.9992965454470208,
      0.9998258464860761,
      0.9998493917856899,
      0.9992797514606423,
      1.000311691162327,
      0.9998146411867562,
      0.9997392831992755,
      0.999699340850405,
      0.9999557477869127,
      0.9998019014521367,
      1.000180573530509,
      1.0007663829648712,
      0.9997595903238627,
      0.9999236664510307,
      0.9993976153711529,
      0.9989732206247034,
      0.9994691186457654,
      0.999328141838111,
      1.0003522425995048,
      0.9997211443844929,
      0.9994919270562928,
      1.0002407145876022,
      0.9996681085965403,
      0.9997763181237532,
      1.0000053285477277,
      0.9999909483733233,
      0.9998275628717788,
      0.9997139936730317,
      0.9995195923614799,
      1.0004758172531283,
      1.0000759142887623,
      0.9996640557065303,
      1.0007912433089958,
      0.9997323452846186,
      1.0000603758928976,
      1.000107713027889,
      1.0009381301302953,
      0.9990520411508356,
      1.000001566462588,
      0.9990649562677948,
      1.001415124315665,
      0.9996753802029512,
      0.9995342669409605,
      1.0000178259636794,
      0.9992498571190759,
      0.9997344281589605,
      0.9996211640943335,
      0.9997581244265294,
      0.9999913958946628,
      0.9998382931244769,
      0.9996449459450202,
      0.9998965366154972,
      1.0001985421230655,
      0.9996747626238605,
      1.0001331069125472,
      0.9997706436969849,
      0.9998207564736272,
      1.0001308355720597,
      0.9994645279222463,
      0.9991887636623761,
      0.9992327386729275,
      0.9998651899178648,
      0.9994158494463746,
      0.9992686648081804,
      0.9992356509517111,
      0.9998460998878987,
      0.9997114630486297,
      0.9989797491331235,
      0.9992448433803479,
      0.9989734025398359,
      0.9989130612941265,
      0.9991318020760993,
      0.9993166696642966,
      0.9995532599034964,
      0.9996294507668242,
      0.9991130764504942,
      0.9992109467194603,
      0.9988571997688094,
      0.9990694951963702,
      0.9994564459505407,
      0.9994454878458314,
      0.9995457811100884,
      0.9992773635499329,
      0.9994182514428022,
      0.9993792585851072,
      0.9993004884214666,
      0.9996592938716623,
      0.9992665374489587,
      0.9996317369931681,
      0.9999208102063403,
      0.99979162779232,
      0.9997323426040926,
      0.9995351712812344,
      0.9995972016801626,
      0.9999189569668347,
      0.9998395286073817,
      0.9995929751068225,
      0.9998146800224746,
      1.0003601091209942,
      0.999414397349188,
      1.0001859481768836,
      0.9993828537035457,
      0.9994900139170174,
      1.000099752410064,
      0.9998113561837543,
      1.0011537045736034,
      1.0001382690053826,
      0.9994154772660313,
      0.999390415380602,
      0.9998447034759368,
      1.000339547218214,
      0.9998978779323683,
      1.0002241657774262,
      1.0007961507380536,
      0.9996536654091135,
      0.9995400278420805
    ]),
  ),
  description: TokenDescriptionResponse(
      enText:
          'Tether (USDT) is a cryptocurrency with a value meant to mirror the value of the U.S. dollar. The idea was to create a stable cryptocurrency that can be used like digital dollars. Coins that serve this purpose of being a stable dollar substitute are called “stable coins.” Tether is the most popular stable coin and even acts as a dollar replacement on many popular exchanges! According to their site, Tether converts cash into digital currency, to anchor or “tether” the value of the coin to the price of national currencies like the US dollar, the Euro, and the Yen. Like other cryptos it uses blockchain. Unlike other cryptos, it is [according to the official Tether site] “100% backed by USD” (USD is held in reserve). The primary use of Tether is that it offers some stability to the otherwise volatile crypto space and offers liquidity to exchanges who can’t deal in dollars and with banks (for example to the sometimes controversial but leading exchange \u003ca href=\"https://www.coingecko.com/en/exchanges/bitfinex\"\u003eBitfinex\u003c/a\u003e).\r\n\r\nThe digital coins are issued by a company called Tether Limited that is governed by the laws of the British Virgin Islands, according to the legal part of its website. It is incorporated in Hong Kong. It has emerged that Jan Ludovicus van der Velde is the CEO of cryptocurrency exchange Bitfinex, which has been accused of being involved in the price manipulation of bitcoin, as well as tether. Many people trading on exchanges, including Bitfinex, will use tether to buy other cryptocurrencies like bitcoin. Tether Limited argues that using this method to buy virtual currencies allows users to move fiat in and out of an exchange more quickly and cheaply. Also, exchanges typically have rocky relationships with banks, and using Tether is a way to circumvent that.\r\n\r\nUSDT is fairly simple to use. Once on exchanges like \u003ca href=\"https://www.coingecko.com/en/exchanges/poloniex\"\u003ePoloniex\u003c/a\u003e or Bittrex, it can be used to purchase Bitcoin and other cryptocurrencies. It can be easily transferred from an exchange to any Omni Layer enabled wallet. Tether has no transaction fees, although external wallets and exchanges may charge one. In order to convert USDT to USD and vise versa through the Tether.to Platform, users must pay a small fee. Buying and selling Tether for Bitcoin can be done through a variety of exchanges like the ones mentioned previously or through the Tether.to platform, which also allows the conversion between USD to and from your bank account.'),
);
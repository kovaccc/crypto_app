# crypto_app
An example Flutter crypto app using the [Coingecko API](https://docs.coingecko.com/v3.0.1/reference/coins-list).

<img src="https://github.com/kovaccc/FlutterCompareAppAndroid/assets/75457058/9f53421b-2afd-4fe9-b982-ad31a0110212" width="400" height="900">

<img src="https://github.com/kovaccc/FlutterCompareAppAndroid/assets/75457058/61b95eb5-6556-4d2e-8d00-7fb3469107d1" width="400" height="900">

<img src="https://github.com/kovaccc/FlutterCompareAppAndroid/assets/75457058/979d5399-6fa3-4aa0-93c8-b7bc54fd371b" width="400" height="900">

Flutter crypto app with token search, price graphs, and a USD-quantity converter using 

# Supported Features
- Browse a paginated list of cryptocurrency tokens.
- Search for tokens using a dynamic search bar.
- View detailed information about each token including descriptions and historical data.
- Interactive price graphs show token price fluctuations over time.
- Convert token quantities to and from USD with a real-time currency converter.

# App Architecture
The app is composed by three main layers.

## Data Layer
The data layer includes repositories, mappers, models and datasources. In this application, data is fetched from the [Coingecko API]([https://repozitorij.unios.hr/islandora/object/etfos%3A4067](https://docs.coingecko.com/v3.0.1/reference/coins-list). The data is then parsed (using json_serializable) and returned the type-safe using entity class `Token`.

## Domain Layer
The domain layer contains interfaces for repositories (e.g. `TokensRepoository`) implemented in the data layer and defines entities (e.g. `Token`) central to the application's business logic. It also includes use cases (`GetTokensUseCase`) that encapsulate business rules, making them reusable across the application for improved modularity and maintainability.

```
class GetTokensUseCase {
  final TokensRepository _tokensRepository;

  GetTokensUseCase(this._tokensRepository);

  PaginatedEitherFailureOr<Token> call(String tokenIds, int page) =>
      _tokensRepository.getTokens(
          targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
          tokenIds: tokenIds,
          page: page);
}
```

## UI Layer
This layer holds all the widgets, which fetch the data from the Notifiers and map the resulting AsyncValue objects to the appropriate UI states (data, loading, error).

# Packages in use

- [riverpod](https://pub.dev/packages/hooks_riverpod) for state management
- [json_serializable](https://pub.dev/packages/json_serializable) for code generation
- [retrofit](https://pub.dev/packages/retrofit) and [dio](https://pub.dev/packages/dio) for talking to the REST API
- [mocktail](https://pub.dev/packages/mocktail) for testing
- [flutter_hooks](https://pub.dev/packages/flutter_hooks): Provides a new approach to managing state in Flutter widgets with HookWidget, enhancing code reuse and composition.
- [loggy](https://pub.dev/packages/loggy) is used to enhance logging capabilities, making debugging and development easier by providing clear, customizable log outputs.
- [gap](https://pub.dev/packages/gap): Used to create gaps between widgets, simplifying layout construction without needing to use padding or margins directly.
- [fl_chart](https://pub.dev/packages/fl_chart): A library for creating charts and graphs, enhancing the data visualization capabilities of the app.
- [intl](https://pub.dev/packages/intl): Provides internationalization and localization capabilities, allowing the app to support multiple languages.
- [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger): An extension of Dio that makes it easier to log network requests and responses in a readable format.

#About the Coingecko API
The app shows data from the following endpoints:

 - [Coins List with Market Data](https://api.coingecko.com/api/v3/coins/markets)
 - [Coin Data by ID](https://api.coingecko.com/api/v3/coins/{id})

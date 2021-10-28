import 'package:json_annotation/json_annotation.dart';
//import 'package:retrofit/retrofit.dart';
part 'statistics_response.g.dart';

//here we just focus on response, other 4 ignore
@JsonSerializable()
class StatisticResponse {
  @JsonKey(name: 'get')
  String get_;
  dynamic parameters;
  dynamic errors;
  int results;
  List<Statistic> response;

  StatisticResponse({
    required this.get_,
    this.parameters,
    this.errors,
    required this.results,
    required this.response,
  });

  //shortcut used to generate code
  factory StatisticResponse.fromJson(Map<String, dynamic> json) =>
      _$StatisticResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StatisticResponseToJson(this);
}

@JsonSerializable()
class Statistic {
  String continent;
  String country;
  int population;
  CaseStatistics cases;
  DeathStatistics deaths;
  TestStatistics tests;
  DateTime day;
  DateTime time;

  Statistic(
      {required this.continent,
      required this.country,
      required this.population,
      required this.cases,
      required this.deaths,
      required this.tests,
      required this.day,
      required this.time});

  //shortcut used to generate code
  factory Statistic.fromJson(Map<String, dynamic> json) =>
      _$StatisticFromJson(json);
  Map<String, dynamic> toJson() => _$StatisticToJson(this);
}

@JsonSerializable()
class CaseStatistics {
  @JsonKey(name: "new")
  String? newCase;
  int active;
  int? critical;
  int recovered;
  @JsonKey(name: "1M_pop")
  String? oneMPop;
  int total;

  CaseStatistics(
      {this.newCase,
      required this.active,
      this.critical,
      required this.recovered,
      this.oneMPop,
      required this.total});

  //shortcut used to generate code
  factory CaseStatistics.fromJson(Map<String, dynamic> json) =>
      _$CaseStatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$CaseStatisticsToJson(this);
}

@JsonSerializable()
class DeathStatistics {
  @JsonKey (name: "new")
  String? newCase;
  @JsonKey(name: "1M_pop")
  String? oneMPopulation;
  int total;

  DeathStatistics(
      {this.newCase,
      this.oneMPopulation,
      required this.total});

  //shortcut used to generate code
  factory DeathStatistics.fromJson(Map<String, dynamic> json) =>
      _$DeathStatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$DeathStatisticsToJson(this);
}

@JsonSerializable()
class TestStatistics {
  @JsonKey(name: "1M_pop")
  
  String? oneMPopulation;
  int total;

  TestStatistics(
      {this.oneMPopulation,
      required this.total});

  //shortcut used to generate code
  factory TestStatistics.fromJson(Map<String, dynamic> json) =>
      _$TestStatisticsFromJson(json);
  Map<String, dynamic> toJson() => _$TestStatisticsToJson(this);

}


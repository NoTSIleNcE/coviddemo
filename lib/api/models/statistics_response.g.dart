// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticResponse _$StatisticResponseFromJson(Map<String, dynamic> json) =>
    StatisticResponse(
      get_: json['get'] as String,
      parameters: json['parameters'],
      errors: json['errors'],
      results: json['results'] as int,
      response: (json['response'] as List<dynamic>)
          .map((e) => Statistic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatisticResponseToJson(StatisticResponse instance) =>
    <String, dynamic>{
      'get': instance.get_,
      'parameters': instance.parameters,
      'errors': instance.errors,
      'results': instance.results,
      'response': instance.response,
    };

Statistic _$StatisticFromJson(Map<String, dynamic> json) => Statistic(
      continent: json['continent'] as String,
      country: json['country'] as String,
      population: json['population'] as int,
      cases: CaseStatistics.fromJson(json['cases'] as Map<String, dynamic>),
      deaths: DeathStatistics.fromJson(json['deaths'] as Map<String, dynamic>),
      tests: TestStatistics.fromJson(json['tests'] as Map<String, dynamic>),
      day: DateTime.parse(json['day'] as String),
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$StatisticToJson(Statistic instance) => <String, dynamic>{
      'continent': instance.continent,
      'country': instance.country,
      'population': instance.population,
      'cases': instance.cases,
      'deaths': instance.deaths,
      'tests': instance.tests,
      'day': instance.day.toIso8601String(),
      'time': instance.time.toIso8601String(),
    };

CaseStatistics _$CaseStatisticsFromJson(Map<String, dynamic> json) =>
    CaseStatistics(
      newCase: json['new'] as String?,
      active: json['active'] as int,
      critical: json['critical'] as int?,
      recovered: json['recovered'] as int,
      oneMPop: json['1M_pop'] as String?,
      total: json['total'] as int,
    );

Map<String, dynamic> _$CaseStatisticsToJson(CaseStatistics instance) =>
    <String, dynamic>{
      'new': instance.newCase,
      'active': instance.active,
      'critical': instance.critical,
      'recovered': instance.recovered,
      '1M_pop': instance.oneMPop,
      'total': instance.total,
    };

DeathStatistics _$DeathStatisticsFromJson(Map<String, dynamic> json) =>
    DeathStatistics(
      newCase: json['new'] as String?,
      oneMPopulation: json['1M_pop'] as String?,
      total: json['total'] as int,
    );

Map<String, dynamic> _$DeathStatisticsToJson(DeathStatistics instance) =>
    <String, dynamic>{
      'new': instance.newCase,
      '1M_pop': instance.oneMPopulation,
      'total': instance.total,
    };

TestStatistics _$TestStatisticsFromJson(Map<String, dynamic> json) =>
    TestStatistics(
      oneMPopulation: json['1M_pop'] as String?,
      total: json['total'] as int,
    );

Map<String, dynamic> _$TestStatisticsToJson(TestStatistics instance) =>
    <String, dynamic>{
      '1M_pop': instance.oneMPopulation,
      'total': instance.total,
    };

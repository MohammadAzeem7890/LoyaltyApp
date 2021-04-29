// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'dart:convert';

CurrencyModel currencyModelFromJson(String str) => CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel {
  CurrencyModel({
    this.apiUrl,
    this.apiDocs,
    this.apiTerms,
    this.base,
    this.date,
    this.timeLastUpdated,
    this.rates,
  });

  String apiUrl;
  String apiDocs;
  String apiTerms;
  String base;
  DateTime date;
  int timeLastUpdated;
  Map<String, double> rates;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
    apiUrl: json["api_url"],
    apiDocs: json["api_docs"],
    apiTerms: json["api_terms"],
    base: json["base"],
    date: DateTime.parse(json["date"]),
    timeLastUpdated: json["time_last_updated"],
    rates: Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "api_url": apiUrl,
    "api_docs": apiDocs,
    "api_terms": apiTerms,
    "base": base,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time_last_updated": timeLastUpdated,
    "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

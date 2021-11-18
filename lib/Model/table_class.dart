// To parse this JSON data, do
//
//     final tableDataApi = tableDataApiFromJson(jsonString);

import 'dart:convert';

TableDataApi tableDataApiFromJson(String str) => TableDataApi.fromJson(json.decode(str));

String tableDataApiToJson(TableDataApi data) => json.encode(data.toJson());

class TableDataApi {
  TableDataApi({
    this.data,
  });

  List<Datum>? data;

  factory TableDataApi.fromJson(Map<String, dynamic> json) => TableDataApi(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.orderid,
    this.securitykey,
    this.orderdate,
    this.amount,
    this.status,
  });

  String? orderid;
  String? securitykey;
  DateTime? orderdate;
  String? amount;
  String? status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    orderid: json["orderid"] == null ? null : json["orderid"],
    securitykey: json["securitykey"] == null ? null : json["securitykey"],
    orderdate: json["orderdate"] == null ? null : DateTime.parse(json["orderdate"]),
    amount: json["amount"] == null ? null : json["amount"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "orderid": orderid == null ? null : orderid,
    "securitykey": securitykey == null ? null : securitykey,
    "orderdate": orderdate == null ? null : "${orderdate!.year.toString().padLeft(4, '0')}-${orderdate!.month.toString().padLeft(2, '0')}-${orderdate!.day.toString().padLeft(2, '0')}",
    "amount": amount == null ? null : amount,
    "status": status == null ? null : status,
  };
}

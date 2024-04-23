import 'dart:convert';

List<TrainModel> trainModelFromJson(String str) =>
    List<TrainModel>.from(json.decode(str).map((x) => TrainModel.fromJson(x)));

String trainModelToJson(List<TrainModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrainModel {
  int trainNum;
  String name;
  String trainFrom;
  String trainTo;
  Data data;

  TrainModel({
    required this.trainNum,
    required this.name,
    required this.trainFrom,
    required this.trainTo,
    required this.data,
  });

  factory TrainModel.fromJson(Map<String, dynamic> json) => TrainModel(
        trainNum: json["train_num"],
        name: json["name"],
        trainFrom: json["train_from"],
        trainTo: json["train_to"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "train_num": trainNum,
        "name": name,
        "train_from": trainFrom,
        "train_to": trainTo,
        "data": data.toJson(),
      };
}

class Data {
  String id;
  Days days;
  String toId;
  List<Class> classes;
  String fromId;
  String arriveTime;
  String departTime;

  Data({
    required this.id,
    required this.days,
    required this.toId,
    required this.classes,
    required this.fromId,
    required this.arriveTime,
    required this.departTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        days: Days.fromJson(json["days"]),
        toId: json["to_id"],
        classes:
            List<Class>.from(json["classes"].map((x) => classValues.map[x]!)),
        fromId: json["from_id"],
        arriveTime: json["arriveTime"],
        departTime: json["departTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "days": days.toJson(),
        "to_id": toId,
        "classes":
            List<dynamic>.from(classes.map((x) => classValues.reverse[x])),
        "from_id": fromId,
        "arriveTime": arriveTime,
        "departTime": departTime,
      };
}

enum Class { THE_3_A, THE_2_A, THE_1_A }

final classValues =
    EnumValues({"1A": Class.THE_1_A, "2A": Class.THE_2_A, "3A": Class.THE_3_A});

class Days {
  dynamic fri;
  dynamic mon;
  dynamic sat;
  dynamic sun;
  dynamic thu;
  dynamic tue;
  dynamic wed;

  Days({
    required this.fri,
    required this.mon,
    required this.sat,
    required this.sun,
    required this.thu,
    required this.tue,
    required this.wed,
  });

  factory Days.fromJson(Map<String, dynamic> json) => Days(
        fri: json["Fri"],
        mon: json["Mon"],
        sat: json["Sat"],
        sun: json["Sun"],
        thu: json["Thu"],
        tue: json["Tue"],
        wed: json["Wed"],
      );

  Map<String, dynamic> toJson() => {
        "Fri": fri,
        "Mon": mon,
        "Sat": sat,
        "Sun": sun,
        "Thu": thu,
        "Tue": tue,
        "Wed": wed,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

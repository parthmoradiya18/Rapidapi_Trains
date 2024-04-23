import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trains_rapidapi/Model.dart';


class Api {
  Future<List> TrainApicall() async {
    String apilink = "https://trains.p.rapidapi.com";
    Uri url = Uri.parse(apilink);

    Map m1 = {"search": "Rajdhani"};
    var json = jsonEncode(m1);

    var response = await http.post(
      url,
      headers: {
        'content-type': 'application/json',
        'X-RapidAPI-Key': 'e1ce1db1b6mshd5301ab816f5ff7p133682jsnd4862ef0f16d',
        'X-RapidAPI-Host': 'trains.p.rapidapi.com'
      },
      body: json,
    );
    var json1 = jsonDecode(response.body);

    List trainjsonList = json1.map((e) => TrainModel.fromJson(e)).toList();
    return trainjsonList;
  }
}
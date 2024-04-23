import 'package:flutter/cupertino.dart';
import 'package:trains_rapidapi/Api.dart';


class Train_Provider with ChangeNotifier {
  Future<List> get_Train() async {
    Api api = Api();

    List l1 = await api.TrainApicall();
    return l1;
  }
}
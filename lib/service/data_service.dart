import 'dart:convert';

import 'package:flutter_node/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  String url = "https://apies.herokuapp.com";
  List<Data> data;
  List insideData = [];

  Future<List<Data>> getData() async {
    var resp = await http.get(url);
    insideData = jsonDecode(resp.body);
    data = dataFromJson(resp.body);
    return data;
  }
}

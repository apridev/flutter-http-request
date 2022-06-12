import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpGetProvider with ChangeNotifier{
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  Uri url;

  void connectAPI(String id, BuildContext context) async {
    url = Uri.parse("https://reqres.in/api/users/" + id);

     var hasilResponse = await http.get(url);

     _data = (json.decode(hasilResponse.body))['data'];
     notifyListeners();
     messageGetData(context, "Get data berhasil");
  }

  // Provider delete data 
  // !bagusnya dipisah filenya
  void deleteData(BuildContext context) async {
    var hasilResponse = await http.delete(url);

    _data = {};
    notifyListeners();
    messageGetData(context, "Data berhasil dihapus");
  }

  // function message
  messageGetData(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),
        duration: Duration(milliseconds: 400),
      )
    );
  }
}
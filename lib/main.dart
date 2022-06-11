import 'package:flutter/material.dart';
import 'package:http_request/models/get-delete-provider.dart';
import 'package:http_request/get-put-patch/home-provider.dart';
import 'package:http_request/get-put-patch/home-stateful.dart';
import 'package:http_request/models/http_post_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  // Ganti home childnya
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => HttpGetProvider(),
        child: HomeGetProviderPage()),
    );
  }
}
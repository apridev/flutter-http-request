import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http_request/get-put-patch-provider/get-stateful.dart';

class HomeGetStatefulPage extends StatefulWidget {

  @override
  State<HomeGetStatefulPage> createState() => _HomeGetStatefulPageState();
}

class _HomeGetStatefulPageState extends State<HomeGetStatefulPage> {
    HttpGetStateful dataResponse = HttpGetStateful();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Get Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 100,
                height: 100,
                child: Image.network((dataResponse.avatar == null)
                ? 'https://via.placeholder.com/100'
                : dataResponse.avatar
                , fit: BoxFit.cover,),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FittedBox(
              child: Text((dataResponse.id == null)
                ? 'ID: Belum ada data'
                : dataResponse.id
                , style: TextStyle(fontSize: 14),),
            ),
            SizedBox(
              height: 16,
            ),
            FittedBox(
              child: Text('Name:', style: TextStyle(fontSize: 14),),
            ),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Text((dataResponse.fullname == null)
                ? 'Belum ada Data'
                : dataResponse.fullname, style: TextStyle(fontSize: 14),),
            ),
            SizedBox(
              height: 16,
            ),
            FittedBox(
              child: Text('Email:', style: TextStyle(fontSize: 14),),
            ),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Text((dataResponse.email == null)
                ? 'Belum ada Data'
                : dataResponse.email, style: TextStyle(fontSize: 14),),
            ),
            SizedBox(
              height: 16,
            ),
            OutlinedButton(
              onPressed: (){
                HttpGetStateful.connectAPI((1 + Random().nextInt(10)).toString()).then((value){
                  setState(() {
                    dataResponse = value;
                  });
                });
              }, 
              child: Text('Get Data')
              )
          ],
        ),
      ),
    );
  }
}
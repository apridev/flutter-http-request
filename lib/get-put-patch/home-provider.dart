import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http_request/models/get-delete-provider.dart';
import 'package:provider/provider.dart';

class HomeGetProviderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    final httpGetProvider = Provider.of<HttpGetProvider>(context, listen: false);
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
            Consumer<HttpGetProvider>(
              builder: (context, value, child) => ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.network((value.data["avatar"] == null)
                    ? 'https://via.placeholder.com/150'
                    : '${value.data["avatar"]}'
                    , fit: BoxFit.cover,),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Consumer<HttpGetProvider>(
              builder: (context, value, child) => FittedBox(
                child: Text((value.data["id"] == null)
                  ? 'ID: Belum ada data'
                  : 'ID: ${value.data["id"]}', style: TextStyle(fontSize: 14),),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FittedBox(
              child: Text(
                'Name:', style: TextStyle(fontSize: 14),),
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<HttpGetProvider>(
              builder: (context, value, child) => FittedBox(
                child: Text((value.data["first_name"] == null && value.data["last_name"] == null)
                  ? 'Belum ada Data'
                  : '${value.data["first_name"]} ${value.data["last_name"]}', style: TextStyle(fontSize: 14),),
              ),
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
              child: Consumer<HttpGetProvider>(
                builder: (context, value, child) => Text((value.data['email'] == null)
                  ? 'Belum ada Data'
                  : '${value.data['email']}', style: TextStyle(fontSize: 14),),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: (){
                      httpGetProvider.connectAPI((1 + Random().nextInt(10)).toString(), context);
                    }, 
                    child: Text('Get Data')
                    ),
                    TextButton(
                      onPressed: (){
                        httpGetProvider.deleteData(context);
                      },
                      child: Icon(Icons.delete, color: Colors.red,)
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
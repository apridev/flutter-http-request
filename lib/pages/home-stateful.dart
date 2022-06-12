// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http_request/models/http_post_stateful.dart';

class HomeStateful extends StatefulWidget {
  const HomeStateful({Key key}) : super(key: key);

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateful dataResponse = HttpStateful();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('POST - STATEFUL'),
      ),
      body: Container(
        width: double.infinity,
        margin:  const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          FittedBox(
              child: Text(
                (dataResponse.id == null) 
                ? "ID : Data tidak ada" 
                : "ID: ${dataResponse.id}", style: TextStyle(
                fontSize: 14
              ),),
            ),
           const SizedBox(
              height: 20,
            ),
           const FittedBox(
              child:Text('Nama: ', style: TextStyle(
                fontSize: 14
              ),),
            ),
           const SizedBox(
              height: 12,
            ),
           FittedBox(
              child: Text((dataResponse.name == null)  
              ? 'Data tidak ada'
              : "${dataResponse.name}", style: TextStyle(
                fontSize: 14
              ),),
            ),
           const SizedBox(
              height: 12,
            ),
           const FittedBox(
              child: Text('Job: ', style: TextStyle(
                fontSize: 14
              ),),
            ),
           const SizedBox(
              height: 12,
            ),
           FittedBox(
              child: Text((dataResponse.job == null)
                ? 'Belum ada data'
                : '${dataResponse.job}', style: TextStyle(
                fontSize: 14
              ),),
            ),
           const SizedBox(
              height: 12,
            ),
           const FittedBox(
              child: Text('Create At:', style: TextStyle(
                fontSize: 14
              ),),
            ),
           const SizedBox(
              height: 12,
            ),
           FittedBox(
              child: Text((dataResponse.createdAt == null)
                ? 'Belum ada data'
                : '${dataResponse.createdAt}', style: TextStyle(
                fontSize: 14
              ),),
            ),
           const SizedBox(
              height: 50,
            ),
            OutlinedButton(
              onPressed: (){
                HttpStateful.connectAPI("Boypras", "Developer").then((value) {
                  setState(() {
                    dataResponse = value;
                  });
                });
              }, 
              child: const Text('POST DATA', style: TextStyle(
                fontSize: 14
              ),)
            )
          ],
        ),
      ),
    );
  }
}
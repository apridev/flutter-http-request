
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpGetStateful{
  String id, fullname, email, avatar;

  HttpGetStateful({
    this.id,
    this.fullname,
    this.email,
    this.avatar
  });

  static Future<HttpGetStateful> connectAPI(String id) async{
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponseGet = await http.get(url);

    var data = (json.decode(hasilResponseGet.body))['data'];

    print(data);

    return HttpGetStateful(
      id: data['id'].toString(),
      fullname: data['first_name'] + " " + data['last_name'],
      avatar: data['avatar'],
      email: data['email']
    );
  }
}
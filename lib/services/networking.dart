import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  late final Uri url;

  NetworkHelper(this.url);

  Future getData() async {
    //Uri url = await Uri.parse();
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class NetworkHelpler {
  String url = "https://swapi.dev/api/planets";

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // print(response.body);
      String data = response.body;

      return jsonDecode(data);
    } else {
      debugPrint('${response.statusCode}');
    }
  }
}

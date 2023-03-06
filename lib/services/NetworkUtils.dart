import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkUtils {
  static final BASE_URL = "http://51.83.42.44:8080/";

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url) {
    Uri uri = Uri.parse(NetworkUtils.BASE_URL + url);
    return http.get(uri).then((http.Response response) {
      String res = response.body;
      int statusCode = response.statusCode;
      // print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(statusCode);
      }
      return _decoder.convert(res);
    }).timeout(const Duration(seconds: 30));
  }

  Future<dynamic> post(String url, {body}) {
    Uri uri = Uri.parse(NetworkUtils.BASE_URL + url);
    // Loader().showIndicator(Get.context!);
    return http.post(uri, body: body).then((http.Response response) {
      // Loader().hideIndicator(Get.context!);
      String res = response.body;
      int statusCode = response.statusCode;
      print("API Response: " + res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        res = "{\"status\":" +
            statusCode.toString() +
            ",\"message\":\"error\",\"response\":" +
            res +
            "}";
        throw new Exception(statusCode);
      }
      return _decoder.convert(res);
    }).timeout(const Duration(seconds: 30));
  }
}

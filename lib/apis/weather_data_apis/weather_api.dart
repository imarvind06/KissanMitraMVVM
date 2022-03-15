import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kissanmitra/utils/constants.dart';

Future<Response> getResponseFromApis() async {
  var response = await http.get(Uri.parse(url));
  return response;
}

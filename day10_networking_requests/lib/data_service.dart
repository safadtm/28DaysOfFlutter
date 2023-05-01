import 'package:http/http.dart' as http;

class DataService {
  Future<String> makeReqToApi() async {
    final uri = Uri.https("randomuser.me", "api");
    final response = await http.get(uri);
    return response.body;
  }
}

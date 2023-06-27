import 'package:lookapp/export.dart';
import 'dart:convert';

class ChatService extends BaseService {
  static const String API_KEY =
      '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';
  static const String MODEL = 'text-davinci-002';

  Future<Map<String, dynamic>> sendRequest(String prompt) async {
    print('ddd');
    var url = 'https://api.openai.com/v1/engines/$MODEL/completions';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $API_KEY',
    };
    var body = {
      'prompt': prompt,
      'max_tokens': 60,
      'n': 1,
      'stop': null,
      'temperature': 0.7,
    };
    Response res = await post(
      url,
      body,
      token: API_KEY,
    );
    var data = res.data;
    return data;
  }

//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
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:tech_teacher/features/chat/data/datasources/chat_datasource.dart';
import 'package:tech_teacher/features/chat/data/models/chat_message_model.dart';

class ChatDatasourceImpl implements ChatDatasource {
  final String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

  @override
  Future<ChatMessageModel> sendMessage(String userInput) async {
    final apiKey = dotenv.env['GOOGLE_API_KEY'];

    if (apiKey == null) {
      throw Exception('API Key not found');
    }

    final response = await http.post(
      Uri.parse('$_baseUrl?key=$apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": userInput},
            ],
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      //instalar o googleai e continuar daqui
      final text = response.text ?? 'Sem resposta';
      return ChatMessageModel(message: text, isUser: false);
    } else {
      print("aqui: ${response.body}");
      throw Exception('API Gemini error: ${response.body}');
    }
  }
}

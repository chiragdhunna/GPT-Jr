import 'dart:convert';

import 'package:gpt_jr/secrets.dart';
import 'package:http/http.dart' as http;

class OpenAIService{

  final List<Map<String,String>> messages = [];

  Future<String> isArtPromptAPI(String prompt) async{
    try{
      // print('Try Block Executed');
      final res = await http.post(Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer $openAIAPIKEY'},
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages" : [
          {
            'role' : 'user',
            'content' : 
              'Does this message want to generate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no.',
          }
        ],
      }),
        );
        // print(res.body);
        if(res.statusCode ==200){
          // print('res status is 200');
          String content = jsonDecode(res.body)['choices'][0]['message']['content'];
          content = content.trim();

          switch(content){
            case 'Yes':
            case 'Yes.':
            case 'yes':
            case 'yes.':
              // print('res assigned value to dallEAPI');
              final res = await dallEAPI(prompt);
              return res;
            default:
              final res = await chatGPTAPI(prompt);
              // print('res assigned value to CHAT GPT');

              return res;
          }
        }else{
          print('The Status Code of API : ${res.statusCode.toString()}');
        }
        return 'An internal error surely occured this time!';
    }catch(e){
      return 'Server Error';
    }
  }


  Future<String> chatGPTAPI(String prompt) async{

    messages.add({
      'role' : 'user',
      'content' : prompt,
    });

    try{
      final res = await http.post(Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer $openAIAPIKEY'},
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages" : messages,
      }),
        );

        // print(res.body);
        if(res.statusCode ==200){
          // print('Worked Successfully');
          String content = jsonDecode(res.body)['choices'][0]['message']['content'];
          content = content.trim();

          messages.add({
            'role' : 'assistant',
            'content' : content,
          });

          return content;
        }
        return 'An internal error surely occured this time!';
    }catch(e){
      return e.toString();
    }
  }


  Future<String> dallEAPI(String prompt) async{
    messages.add({
      'role' : 'user',
      'content' : prompt,
    });

    try{
      final res = await http.post(Uri.parse('https://api.openai.com/v1/images/generations'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer $openAIAPIKEY'},
      body: jsonEncode({
        "prompt" : prompt,
        'n' : 1,
      }),
        );

        // print(res.body);
        if(res.statusCode ==200){
          // print('Worked Successfully');
          String imageUrl = jsonDecode(res.body)['data'][0]['url'];
          imageUrl = imageUrl.trim();

          messages.add({
            'role' : 'assistant',
            'content' : imageUrl,
          });

          return imageUrl;
        }
        return 'An internal error surely occured this time!';
    }catch(e){
      return e.toString();
    }
  }

}
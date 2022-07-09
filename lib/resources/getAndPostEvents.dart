import 'dart:convert';

import 'package:daily_task_creator/constants/constants.dart';
import 'package:daily_task_creator/model/events.dart';
import 'package:http/http.dart' as http;

class GetAndPostEventsProvider{
  var getUrl=Uri.parse(Constants.apiUrlGet);
  var postUrl=Uri.parse(Constants.apiUrlPost);

  Future<DataModel> fetchEvents() async{
    final response = await http.get(getUrl);
    if(response.statusCode==200){
      return DataModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to load data');
    }
}
Future<DataModel> postEvents(body)async{
    final response=await http.post(postUrl,
    body: jsonEncode(body)
    );
    if(response.statusCode==200){
      return DataModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to load data');
    }
}
}
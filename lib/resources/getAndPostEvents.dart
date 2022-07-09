import 'dart:convert';

import 'package:daily_task_creator/constants/constants.dart';
import 'package:daily_task_creator/model/events.dart';
import 'package:http/http.dart' as http;

class GetAndPostEventsProvider{
  var url=Uri.parse(Constants.apiUrlGet);

  Future<DataModel> fetchEvents() async{
    final response = await http.get(url);
    if(response.statusCode==200){
      return DataModel.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to load data');
    }
}
}
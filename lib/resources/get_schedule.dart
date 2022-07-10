// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:daily_task_creator/model/events.dart';
import 'package:daily_task_creator/model/postResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'getAndPostEvents.dart';

class GetScheduledEventsBloc extends ChangeNotifier{
  DateTime dateTime=DateTime.now();
   Future<DataModel> eventData;
   List scheduledName=[];
   List scheduledStartTime=[];
   List scheduledEndTime=[];
   Future<DataResponse> responseFromPost;
   bool  successes=true;

  updateFocusedDate(context,dateAndTime){
    dateTime=dateAndTime;
    notifyListeners();
  }
  retrieveEvents(context,date){
    eventData=GetAndPostEventsProvider().fetchEvents();
    eventData.then((value) {
      scheduledName.clear();
      scheduledEndTime.clear();
      scheduledStartTime.clear();
      for(int i=0;i<value.data.length;i++){
        if(DateFormat('dd/MM/yyyy').format(date)==value.data[i].date) {
          final dateFormat = DateFormat('h:mm a');
          scheduledName.add(value.data[i].name);
          String dateTimeStart=dateFormat.format(DateFormat('h:mm').parse(value.data[i].startTime));
          String dateTimeEnd=dateFormat.format(DateFormat('h:mm').parse(value.data[i].endTime));
         // String dateTime=DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(value.data[i].startTime));
          scheduledStartTime.add(dateTimeStart.toString());
          scheduledEndTime.add(dateTimeEnd.toString());


        }
      }
      notifyListeners();
    });



  }
  setResponse(context,response){
    successes=response;
    notifyListeners();

  }
}
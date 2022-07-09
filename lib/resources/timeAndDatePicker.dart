import 'package:daily_task_creator/resources/getAndPostEvents.dart';
import 'package:flutter/material.dart';

class GetScheduledTimeAndDatePicker extends ChangeNotifier{
  TimeOfDay startingTime=TimeOfDay.now();
  TimeOfDay endingTime=TimeOfDay.now();
  DateTime dateTime=DateTime.now();

   var response;
  updateStartTimeAndDate(context,timeAndDate){
    startingTime=timeAndDate;
    notifyListeners();

  }
  updateEndTimeAndDate(context,timeAndDate){
    endingTime=timeAndDate;
    notifyListeners();

  }
  updateDate(context,date){
    dateTime=date;
    notifyListeners();
  }
  postingData(context,data){

    response=GetAndPostEventsProvider().postEvents(data);
    notifyListeners();
  }


}
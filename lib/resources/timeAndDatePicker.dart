import 'package:daily_task_creator/model/events.dart';
import 'package:daily_task_creator/model/postResponse.dart';
import 'package:daily_task_creator/resources/getAndPostEvents.dart';
import 'package:daily_task_creator/view/widget/alertdialog.dart';
import 'package:flutter/material.dart';

class GetScheduledTimeAndDatePicker extends ChangeNotifier {
  TimeOfDay startingTime = TimeOfDay.now();
  TimeOfDay endingTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  String sample = "";
  bool successes = true;
  FocusNode focusNode=FocusNode();

  Future<DataResponse> response;
  updateStartTimeAndDate(context, timeAndDate) {
    startingTime = timeAndDate;
    notifyListeners();
  }

  updateEndTimeAndDate(context, timeAndDate) {
    endingTime = timeAndDate;
    notifyListeners();
  }

  updateDate(context, date) {
    dateTime = date;
    notifyListeners();
  }
setSuccess(context){
    successes=true;
    notifyListeners();
}
  postingData(context, data) {
    response = GetAndPostEventsProvider().postEvents(data);
    response.then((value) {
      successes=value.success;
      notifyListeners();
    });
    // print(response.);
    focusNode.requestFocus();
    notifyListeners();
    return response;
  }
}

import 'package:daily_task_creator/resources/timeAndDatePicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

showAlertDialog(BuildContext context,success) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      // Navigator.push(context, MaterialPageRoute(builder: ));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {


          return FutureBuilder<bool>(
              future: success,
              builder:( BuildContext context,snapshot){

              if(snapshot.data){
                return null;
              }
              else{
                return alert;
              }
          } );
        }
      );


}
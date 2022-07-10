import 'package:daily_task_creator/model/events.dart';
import 'package:daily_task_creator/model/postEventsModel.dart';
import 'package:daily_task_creator/model/postResponse.dart';
import 'package:daily_task_creator/resources/get_schedule.dart';
import 'package:daily_task_creator/resources/timeAndDatePicker.dart';
import 'package:daily_task_creator/view/widget/alertdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

TextEditingController textEditingControllers= TextEditingController();
FocusNode focusNode1=FocusNode();
// GetScheduledDateAndPicker dataProvider = Provider.of<DataProvider>(context);


 modelBottomSheetForEventsCreation(context,getSchedule){
  // GetScheduledTimeAndDatePicker getScheduledEventsBlocs=Provider.of(context,listen: false);
   return showModalBottomSheet(
       isScrollControlled: true,
      context: context,
      builder: (context) {
        return Consumer<GetScheduledTimeAndDatePicker>(

            builder: (context,getScheduledDateAndPicker,_) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20),
                child:getScheduledDateAndPicker.successes?Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Add Schedule",
                          style:  TextStyle(color: Color.fromRGBO(5, 77, 185, 1,),fontSize: 16,
                            fontWeight: FontWeight.w500

                      ),
                          ),
                          IconButton(onPressed:()=> Navigator.pop(context),
                            icon: const Icon(Icons.clear, color: Colors.black,size: 25),)
                        ],
                      ),

                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    const Text("Name",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                    Padding(
                      padding: const EdgeInsets.only(top: 15,

                      ),
                      child: TextField(
                        focusNode: getScheduledDateAndPicker.focusNode,
                      controller: textEditingControllers,
                    decoration:  InputDecoration(
                      // focusColor: Colors.black,
                      filled: true,
                      fillColor: const Color.fromRGBO(229, 239, 255, 1),


                      // focusedBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                // ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color:  Color.fromRGBO(229, 239, 255, 1), width: .4),
                ),
                //
                ),
                    ),),
                    const Padding(
                      padding:  EdgeInsets.only(top:20.0,bottom: 15),
                      child: Text("Date And Time",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                    ),
              Container(
                margin:  const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  color:  Color.fromRGBO(229, 239, 255, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Padding(
                       padding:  EdgeInsets.only(left: 8.0),
                       child: Text("Start Time",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                     ),
                    TextButton(onPressed: ()async{
                      final TimeOfDay timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.dial,
                      );
                      if( timeOfDay!=null)getScheduledDateAndPicker.updateStartTimeAndDate(context, timeOfDay);
                    }, child: Row(
                      children: [
                        Text(getScheduledDateAndPicker.startingTime.format(context),style: TextStyle(fontSize: 16),),
                        const Icon(Icons.arrow_forward_ios,color: Color.fromRGBO(39, 58, 107, 1),size: 16,)

                      ],
                    ))
                   ],
                 ),
                   const Padding(
                      padding:  EdgeInsets.only(left: 8.0),
                      child: Divider(height: 1.2,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const  Padding(
                          padding:  EdgeInsets.only(left: 8.0),
                          child: Text("End Time",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                        ),
                        TextButton(onPressed: () async {

                          final TimeOfDay timeOfDay = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            initialEntryMode: TimePickerEntryMode.dial,
                          );
                        if( timeOfDay!=null) getScheduledDateAndPicker.updateEndTimeAndDate(context, timeOfDay);

                            // getScheduledEventsBloc.


                        }, child: Row(
                          children: [
                            Text(getScheduledDateAndPicker.endingTime.format(context),style: TextStyle(fontSize: 16),),
                            const Icon(Icons.arrow_forward_ios,color: Color.fromRGBO(39, 58, 107, 1),size: 16,)

                          ],
                        ))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Divider(height: 1.2,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding:  EdgeInsets.only(left: 8.0),
                          child: Text("Date",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                        ),
                        TextButton(onPressed: ()async{
                    DateTime picked = await showDatePicker(
                       context: context,
                       initialDate: DateTime.now(),
                       firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
                       if(picked!=null)getScheduledDateAndPicker.updateDate(context, picked);

                        }, child: Row(
                          children: [
                            Text(DateFormat('dd/MM/yyyy').format(getScheduledDateAndPicker.dateTime).toString(),style: TextStyle(fontSize: 16),),
                            Icon(Icons.arrow_forward_ios,color: Color.fromRGBO(39, 58, 107, 1),size: 16,)

                          ],
                        ))
                      ],
                    ),

                    const SizedBox(height: 10,)
                ],),
              ),
                    Center(
                      child: TextButton(
                        child: Text('Add Schedule',style: TextStyle(fontSize: 16),),
                        style: TextButton.styleFrom(
                          minimumSize:Size(MediaQuery.of(context).size.width-40, 56) ,
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(47, 128, 237, 1)
                        ,
                          onSurface: Colors.grey,
                        ),
                        onPressed: () {
                          PostModel postModel=PostModel(
                              name:textEditingControllers.text,
                              phoneNumber: "6282920065",
                              startTime: getScheduledDateAndPicker.startingTime.format(context),
                              endTime: getScheduledDateAndPicker.endingTime.format(context),
                              date:DateFormat('dd/MM/yyyy').format(getScheduledDateAndPicker.dateTime).toString()
                          );
                        // Provider.of<GetScheduledTimeAndDatePicker>(context).postingData(context, postModel.toJson());
                          Future<DataResponse> response= getScheduledDateAndPicker.postingData(context,postModel.toJson());
                          response.then((value) {
                            if(value.success){
                              Navigator.pop(context);
                            }
                          });

                       


                          // showAlertDialog(context, getScheduledDateAndPicker.successes);
                          //   response.whenComplete(() {
                          //     response.then((value) {
                          //       if(value.success){
                          //         Navigator.pop(context);
                          //       }
                          //       else{
                          //         context.read<GetScheduledEventsBloc>().setResponse(context, false);
                          //       }
                          //     });
                          //   });




                          // showAlertDialog(context);



                        },
                      ),
                    ),
                   const SizedBox(
                     height: 20,
                   )
                  ],
                ):Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 20),
                      child: SizedBox(
                        width:MediaQuery.of(context).size.width-100,
                        child: const Text("This overlaps with another schedule and can't be saved",
                          style: TextStyle(color: Colors.red,fontSize: 20,
                              fontWeight: FontWeight.w500

                          ),
                        ),
                      ),

                    ),
                   const SizedBox(
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom:8.0),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width-100,
                          child:const Text("Please modify and try again",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),)),
                    ),



                    Center(
                      child: TextButton(
                        child: const Text('OK',style: TextStyle(fontSize: 16),),
                        style: TextButton.styleFrom(
                          minimumSize:Size(MediaQuery.of(context).size.width-40, 56) ,
                          primary: Colors.white,
                          backgroundColor:const Color.fromRGBO(47, 128, 237, 1)
                          ,
                          onSurface: Colors.grey,
                        ),
                        onPressed: () {



                          // showAlertDialog(context, getScheduledDateAndPicker.successes);
                          Navigator.pop(context);

                          // showAlertDialog(context);



                        },
                      ),
                    ),
                  const  SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            );
          }
        );
      });

}
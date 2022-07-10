import 'dart:ffi';
import 'dart:math';

import 'package:daily_task_creator/resources/get_schedule.dart';
import 'package:daily_task_creator/resources/timeAndDatePicker.dart';
import 'package:daily_task_creator/view/widget/alertdialog.dart';
import 'package:daily_task_creator/view/widget/bottomsheet.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../model/events.dart';
// import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:provider/provider.dart';


TextStyle style = TextStyle(color: Colors.white);

class MyApp extends StatelessWidget {

  // final CalendarWeekController _controller = CalendarWeekController();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timeline',
      theme: ThemeData(
        primaryColor: Constants.kPurpleColor,
      ),
      home: TimelineComponent(title: 'Timeline'),
    );
  }
}

class TimelineComponent extends StatelessWidget {
  TextEditingController textEditingController=TextEditingController();
  TimelineComponent({Key key, this.title}) : super(key: key);

  final String title;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusday = DateTime.now();


  final List<Color> listOfColors = [
    Constants.kPurpleColor,
    Constants.kGreenColor,
    Constants.kRedColor
  ];

  @override
  Widget build(BuildContext context) {
    context.read<GetScheduledEventsBloc>().retrieveEvents(context,DateTime.now());
    GetScheduledEventsBloc getScheduledEventsBloc=Provider.of<GetScheduledEventsBloc>(context);
    Size size = MediaQuery.of(context).size;
    Random random = new Random();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<GetScheduledEventsBloc>(

          builder: (context,getScheduledEventsBloc,_) {
            return Container(
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: size.height * 0.2,
                        width: double.infinity,
                        //color: Colors.red,
                        child: TableCalendar(
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              getScheduledEventsBloc.updateFocusedDate(context, focusedDay);
                              getScheduledEventsBloc.retrieveEvents(context,focusedDay);
                                // context.read<GetScheduledEventsBloc>().updateFocusedDate(context,focusedDay);
                                //
                                  _selectedDay =  selectedDay;
                                  // _focusday = focusedDay;

                                // print(selectedDay.toString());
                                // update `_focusedDay` here as well


                            },
                            onPageChanged: (focusedDay) {
                              _focusday=getScheduledEventsBloc.dateTime;
                              _focusday =  focusedDay;
                            },

                            daysOfWeekStyle: const DaysOfWeekStyle(
                                weekdayStyle: TextStyle(color: Colors.black,fontSize: 12),
                                weekendStyle: TextStyle(color: Colors.black,fontSize: 12)),
                            headerStyle: const HeaderStyle(
                                titleTextStyle: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                                headerMargin:
                                    EdgeInsets.only(top: 20, left: 20, bottom: 20),
                                titleCentered: false,
                                formatButtonVisible: false,
                                formatButtonShowsNext: false,
                                leftChevronVisible: false,
                                rightChevronVisible: false),
                            firstDay: DateTime.utc(1997, 3, 14),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: getScheduledEventsBloc.dateTime,
                            calendarFormat: CalendarFormat.week,
                            calendarStyle: const CalendarStyle(
                              weekendTextStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                              defaultTextStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                              selectedTextStyle: TextStyle(color: Colors.amber),
                              isTodayHighlighted: true,
                            ),
                            calendarBuilders: CalendarBuilders(
                                selectedBuilder: (context, date, events) => Container(
                                  height: 100,
                                    margin: const EdgeInsets.all(3.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        shape: BoxShape.circle,

                                    ),
                                    child: Text(
                                      date.day.toString(),
                                      style: TextStyle(color: Colors.white),
                                    )))),
                        //table calender widgetl will show the week calender
                      ),

                    ],
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(top: 5,bottom: 70),
                      decoration: BoxDecoration(
                        color:const Color.fromRGBO(245, 245, 245, 1),

                        borderRadius: BorderRadius.circular(20),
                      ),


                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: getScheduledEventsBloc.scheduledName.length,
                            itemBuilder: (context, i) {
                              return Stack(
                                children: [

                                  Row(
                                    children: [
                                      SizedBox(width: size.width*0.3),
                                      SizedBox(
                                          width: size.width * 0.4,

                                          child: Padding(
                                            padding: const EdgeInsets.only(top:18.0),
                                            child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getScheduledEventsBloc.scheduledStartTime[i]+" - "+getScheduledEventsBloc.scheduledEndTime[i],
                                                style: TextStyle(
                                                    color: Colors.black, fontSize: 14),
                                              ),
                                            Text(getScheduledEventsBloc.scheduledName[i],
                                            style: TextStyle(color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                              fontSize: 20
                                            ),
                                            ),

                                      ]),
                                          )),
                                    ],
                                  ),

                                 if(i!=getScheduledEventsBloc.scheduledName.length-1) const Positioned(
                                    left: 68,
                                    child:DottedLine(
                                      dashColor: Colors.black,
                                      direction: Axis.vertical,
                                      lineLength:150,
                                      lineThickness: 1.6,
                                      dashLength: 6,
                                    ),

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:40.0,top: 0,bottom: 40,right: 40),
                                    child: Container(
                                      height: 74.0,
                                      width: 55.0,
                                      child:Icon(Icons.calendar_today_rounded,color: Color.fromRGBO(47, 128, 237, 1),) ,
                                      decoration: BoxDecoration(
                                        color:const Color.fromRGBO(187, 222, 251, 1),

                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),


                                ],
                              );
                            }),
                      ),
                    ),
                  ),



                ],
              ),
            );
          }
        ),

      ),
      floatingActionButton: Stack(
        children: [
           Positioned(
            right: 26.8,
            bottom:35,
            child:  FloatingActionButton(
              backgroundColor:Color.fromRGBO(47, 128, 237, 1),
            onPressed: (){
                context.read<GetScheduledTimeAndDatePicker>().setSuccess(context);
              modelBottomSheetForEventsCreation(context,getScheduledEventsBloc);

            },
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.white,size: 25),

              iconSize: 40.0, onPressed:null,
            ),
            // backgroundColor: Colors.red,
    ),
          ),
        ],
      )  ,
    );
  }

}

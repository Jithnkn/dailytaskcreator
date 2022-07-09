import 'package:daily_task_creator/resources/get_schedule.dart';
import 'package:daily_task_creator/resources/post_schedule.dart';
import 'package:daily_task_creator/resources/timeAndDatePicker.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => GetScheduledEventsBloc()),
  ChangeNotifierProvider(create: (_) => GetScheduledTimeAndDatePicker()),
  ChangeNotifierProvider(create: (_) => PostSchedule()),

];
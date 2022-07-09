import 'dart:developer';

import 'package:daily_task_creator/resources/provider_creation.dart';
import 'package:daily_task_creator/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {

   runApp(

   MultiProvider(providers: providers,
       child:MyApp()));
}


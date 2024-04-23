import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trains_rapidapi/Provider.dart';
import 'package:trains_rapidapi/Train_page.dart';


void main()
{
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Train_Provider(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) =>Train_Screen(),
      },
    ),
  ));
}
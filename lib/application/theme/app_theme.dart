



import 'package:flutter/material.dart';

class  AppThemeData{

  static  ThemeData  lightTheme=ThemeData(
             brightness: Brightness.light,
             useMaterial3: true,
             scaffoldBackgroundColor:  const Color(0xFFF4F7FD),
             cardColor: Colors.white,
             
             appBarTheme: AppBarTheme(
              
             ),
            
            textTheme: const  TextTheme(bodyLarge: TextStyle(color: Colors.black)),
             
             
             
             );
             

             
  static  ThemeData  darkTheme=ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xFF2B2C37),
            cardColor:Color(0xFF2B2C37),
          
             appBarTheme: AppBarTheme(
              
             ),
           
            textTheme: const  TextTheme(bodyLarge: TextStyle(color: Colors.white)),
  );
}
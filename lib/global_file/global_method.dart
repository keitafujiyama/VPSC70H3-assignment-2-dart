// PACKAGE
import 'package:flutter/material.dart';



// GLOBAL METHOD
double gSetSize (BuildContext context) {
  final size = MediaQuery.of (context).size;

  if (size.height > size.width * 1.5) {
    return size.shortestSide * 0.035;
  } else if (size.height > size.width) {
    return size.shortestSide * 0.03;
  } else {
    return size.shortestSide * 0.025;
  }
}

String addZero (int length, String number1) {
  var number2 = number1;

  while (number2.length < length) {
    number2 = '0$number2';
  }

  return number2;
}

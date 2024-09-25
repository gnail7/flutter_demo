import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle getTextStyle(type) {
  switch (type) {
    case 'primary':
      return const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    case 'warning':
      return const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    case 'info':
      return const TextStyle(color: Colors.black, fontWeight: FontWeight.normal);
    case 'cancel':
      return const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    case 'success':
      return const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    default:
      return const TextStyle(color: Colors.black, fontWeight: FontWeight.normal);
  }
}


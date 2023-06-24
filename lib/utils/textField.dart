import 'package:flutter/material.dart';

InputDecoration modifiedInputDecor=InputDecoration(
  labelStyle: TextStyle(color: Colors.red),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.red)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.red)),
  disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.red)),
);
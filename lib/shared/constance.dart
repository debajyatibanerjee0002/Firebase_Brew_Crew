import 'package:flutter/material.dart';

const textInputDecoretion = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(30),
      topLeft: Radius.circular(30),
    ),
    borderSide: BorderSide(
      color: Colors.white,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.green,
      width: 3.0,
    ),
  ),
);

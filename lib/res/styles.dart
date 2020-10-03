import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration styleTextInputDecoration = InputDecoration(
  fillColor: Colors.grey[200],
  filled: true,
  hintStyle: GoogleFonts.poppins(
    color: Colors.grey,
    fontSize: 18,
  ),
  contentPadding: EdgeInsets.all(10),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Colors.white,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Colors.white,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: Colors.white,
    ),
  ),
);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textstyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.poppins(fontSize: size, color: color, fontWeight: fw);
}

TextStyle textstyle_ht(double size, Color color, FontWeight fw, double ht) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fw, height: ht);
}

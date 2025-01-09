import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeSyncTextStyles {
  static final homeSyncTitle = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.normal,
      // letterSpacing: 2,
    ),
  );
  static final homeSyncSubTitle = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
  );

  static final homeSyncName = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 32,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  static final homeSyncTextFieldContent = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
  );
  static final homeSyncTextFieldLabel = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 14,
      // color: Color.fromARGB(255, 58, 58, 58),
      color: Colors.grey[600],
      fontWeight: FontWeight.w600,
    ),
  );
  static final homeSyncButton = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
  );
  static final homeSyncCopyrights = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
  );
  static final homeSyncBody = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
  );
}

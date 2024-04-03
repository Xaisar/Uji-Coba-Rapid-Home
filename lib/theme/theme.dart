import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/pallet_color.dart';

ThemeData theme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: C3,
    displayColor: C3
  )
);
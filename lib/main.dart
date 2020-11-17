import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/home_page.dart';

void main() => runApp(CotacaoApp());

class CotacaoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cotação Hoje',
      theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.robotoMonoTextTheme(Theme.of(context).textTheme),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

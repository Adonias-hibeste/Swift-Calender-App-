import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/pages/calendar_home_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: SwiftCalendarApp(),
    ),
  );
}

class SwiftCalendarApp extends StatelessWidget {
  const SwiftCalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Swift Calendar',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: CalendarHomePage(),
    );
  }
}

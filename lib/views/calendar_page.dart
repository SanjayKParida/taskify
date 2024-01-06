import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Calendar',
                style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0),
              )),
          body: Center(
            child: SfCalendar(
              view: CalendarView.day,
              todayHighlightColor: Colors.blue,
              showNavigationArrow: true,
            ),
          )),
    );
  }
}

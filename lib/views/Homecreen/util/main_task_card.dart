import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:taskify/views/task_overview_page.dart';

class TaskCard extends StatelessWidget {
  double percentage;
  String taskTag;
  String taskTitle;
  String taskDescription;
  String dueDate, startTime;

  TaskCard(
      {super.key,
      required this.taskTag,
      required this.taskTitle,
      required this.taskDescription,
      required this.percentage,
      required this.dueDate,
      required this.startTime});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (() => Get.to(const TaskOverviewPage(), arguments: {
            "tag": taskTag,
            "title": taskTitle,
            "desc": taskDescription,
            "sDate": dueDate,
            "sTime": startTime
          })),
      child: Container(
        height: h * 0.3,
        width: w * 0.9,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),

        //BOX CONTENTS
        child: Padding(
          padding: const EdgeInsets.only(left: 18, top: 20, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 254, 216, 213),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  taskTag,
                  style: GoogleFonts.ubuntu(
                    fontSize: 12,
                    color: const Color.fromARGB(255, 196, 48, 38),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                taskTitle,
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 14),
              Text(
                taskDescription,
                style: GoogleFonts.ubuntu(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 18,
              ),
              LinearPercentIndicator(
                percent: percentage * 0.01,
                progressColor: const Color.fromARGB(255, 42, 97, 238),
                lineHeight: 8,
                barRadius: const Radius.circular(15),
                trailing: Text(
                  '$percentage %',
                  style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  children: [
                    const Icon(Icons.calendar_month_rounded, size: 16),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(dueDate)
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 16),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(startTime)
                  ],
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}

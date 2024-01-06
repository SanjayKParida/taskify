import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final DateTime endTime;
  final DateTime currentTime = DateTime.now();

  TaskTile({super.key, required this.taskName, required this.endTime});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 25.0, right: 25.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300)),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //TASK NAME
                Text(
                  taskName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                //ICON - MORE HORIZONTAL
                const Icon(Icons.more_horiz)
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //DEADLINE TIME
                      Row(
                        children: [
                          const Icon(Icons.schedule, size: 16),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(DateFormat.jm().format(endTime))
                        ],
                      ),
                      //COMPLETED OR NOT
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 4.0),
                          child: currentTime.isAfter(endTime)
                              ? const TaskCompleted()
                              : const TaskInProgress(),
                        ),
                      )
                    ],
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}

class TaskCompleted extends StatelessWidget {
  const TaskCompleted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Completed',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 15,
        )
      ],
    );
  }
}

class TaskInProgress extends StatelessWidget {
  const TaskInProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'On Processing',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.run_circle,
          color: Colors.orange,
          size: 15,
        )
      ],
    );
  }
}

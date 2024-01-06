import 'package:flutter/material.dart';

import '../task_pages/all_tasks.dart';
import '../task_pages/completed_tasks.dart';
import '../task_pages/on_going_tasks.dart';

class TaskTabs extends StatefulWidget {
  const TaskTabs({super.key});

  @override
  State<TaskTabs> createState() => _TaskTabsState();
}

class _TaskTabsState extends State<TaskTabs> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Expanded(
        child: Column(
      children: [
        TabBar(
          controller: tabController,
          indicatorColor: Colors.white, 
          tabs: const [
          Tab(
            text: 'All Tasks',
          ),
          Tab(
            text: 'On Going',
          ),
          Tab(
            text: 'Completed',
          )
        ]),
        Expanded(
            child: TabBarView(
                controller: tabController,
                children: const [AllTasks(), OnGoingTasks(), CompletedTasks()]))
      ],
    ));
  }
}

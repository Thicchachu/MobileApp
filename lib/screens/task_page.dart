import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Task model class
class Task {
  final String title;
  final String description;
  final String timestamp;

  Task({required this.title, required this.description, required this.timestamp});
}

class TaskBoardPage extends StatefulWidget {
  @override
  _TaskBoardPageState createState() => _TaskBoardPageState();
}

class _TaskBoardPageState extends State<TaskBoardPage> {
  int taskCount = 2;
  List<Task> tasks = [
    Task(
      title: 'Task 1',
      description: 'Your Personal task management and planning solution for planning your day, week & months',
      timestamp: '12:55 pm 25th May, 2023',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Board'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskListItem(task: tasks[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Create a new task and add it to the list
          Task newTask = Task(
            title: 'Task $taskCount', //Set the title
            description: 'Your Personal task management and planning solution for planning your day, week & months',
            timestamp: '12:55 pm 25th May, 2023', // Set the description
          );

          // Add the new task to the list
          setState(() {
            tasks.add(newTask);
            taskCount++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskListItem extends StatelessWidget {
  final Task task;

  const TaskListItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                task.description,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                task.timestamp,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskBoardPage(),
    );
  }
}

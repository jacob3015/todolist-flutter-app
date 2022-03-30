import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/list_page.dart';
import 'package:todoapp/task.dart';
import 'package:todoapp/task_list.dart';
import 'package:todoapp/file_handler.dart';
import 'dart:convert';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  @override
  void initState() {
    super.initState();

    titleController.addListener(() { });
    detailsController.addListener(() { });
  }

  @override
  void dispose() {
    titleController.dispose();
    detailsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        automaticallyImplyLeading: false,
        title: const Text(
            'Create Task'
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: titleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: detailsController,
              ),
            ),
            TextButton(
              onPressed: () {
                Task task = Task(titleController.text, detailsController.text);
                Provider.of<TaskList>(context, listen: false).addTask(task);
                String jsonString = jsonEncode(
                    Provider.of<TaskList>(context, listen: false).toJson()
                );
                Provider.of<FileHandler>(context, listen: false).writeJson(jsonString);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListPage()));
              },
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}

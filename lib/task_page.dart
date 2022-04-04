import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/list_page.dart';
import 'package:todoapp/task.dart';
import 'package:todoapp/task_list.dart';

// TaskPage for create new task
class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  // TextControllers for TextFields
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

            // TextField for input task title
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Task title',
                ),
                controller: titleController,
              ),
            ),

            // TextField for input task details
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Task details',
                ),
                controller: detailsController,
              ),
            ),

            // Button for save the task
            Consumer<TaskList>(
              builder: (context, tasks, child) {
                return TextButton(
                  onPressed: () {
                    tasks.addTask(Task(titleController.text, detailsController.text));
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ListPage()));
                  },
                  child: const Text('Save'),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

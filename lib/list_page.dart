import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/task_list.dart';
import 'package:todoapp/task_page.dart';

// List page for show task list with list view, List page needs to be consumer of task list provider
class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NeumorphicAppBar(
          automaticallyImplyLeading: false,
          title: const Text(
              'Tasks',
          ),
          actions: <Widget>[

            // Button for move to task page
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TaskPage()));
                },
                icon: const Icon(Icons.add),
            )
          ],
        ),

        // ListView for show task list
        body: Consumer<TaskList>(
          builder: (context, tasks, child) {
            return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: tasks.getTaskList.length,
                itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Neumorphic(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(tasks.getTaskList[index].getTitle),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(tasks.getTaskList[index].getDetails),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
          },
        ),
    );
  }
}
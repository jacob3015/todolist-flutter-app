import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/task_list.dart';
import 'package:todoapp/task_page.dart';

// List page for show task list with list view, List view needs to be consumer of task list provider
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

        body: Consumer<TaskList>(
          builder: (context, tasks, child) {
            return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: tasks.getTaskList.length,
                itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: NeumorphicButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(tasks.getTaskList[index].getTitle),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(tasks.getTaskList[index].getDetails),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color(0xFFDDDDDD),
                        constraints: const BoxConstraints(
                          minHeight: 90,
                          maxHeight: 100,
                        ),
                        builder: (BuildContext context) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text('Delete the task?'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextButton(
                                    child: const Text('YES'),
                                    onPressed: () {
                                      tasks.deleteTask(tasks.getTaskList[index]);
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                          ],
                        ),
                          );
                    });
                  },
                ),
              );
            });
          },
        ),
    );
  }
}
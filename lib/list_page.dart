import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/task_list.dart';
import 'package:todoapp/task_page.dart';

// list page
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
      body: ListView.builder(
          itemCount: Provider.of<TaskList>(context, listen: false).getTaskList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Text(Provider.of<TaskList>(context, listen: false).getTaskList[index].getTitle),
            );
          }),
    );
  }
}
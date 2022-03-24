import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import './widgets.dart';

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
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CustomBottomSheet();
                    }
                );
              },
              icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

// start page

// splash screen
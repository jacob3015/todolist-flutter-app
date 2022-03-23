import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {

  String _taskName = '';
  String _taskDetails = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Task',
                  hintText: 'Title',
                ),
                onChanged: (text) {
                  _taskName = text;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Details',
                  hintText: '...',
                ),
                onChanged: (text) {
                  _taskDetails = text;
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Close Bottom Sheet'),
            )
          ],
        )
      )
    );
  }
}

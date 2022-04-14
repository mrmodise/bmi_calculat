import 'package:bmi_calculator/data/sp_helper.dart';
import 'package:flutter/material.dart';

import 'data/session.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  TextEditingController txtDescriptionCtrl = TextEditingController();
  TextEditingController txtDurationCtrl = TextEditingController();
  final SPHelper spHelper = SPHelper();
  List<Session> sessions = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Training Session'),
      ),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSessionsDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> showSessionsDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Insert Training Session'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: txtDescriptionCtrl,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  TextField(
                    controller: txtDurationCtrl,
                    decoration: const InputDecoration(hintText: 'Duration'),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    txtDescriptionCtrl.text = '';
                    txtDurationCtrl.text = '';
                  },
                  child: const Text('Cancel')),
              ElevatedButton(onPressed: saveSession, child: const Text('Save'))
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';

    Session newSession = Session(1, today, txtDescriptionCtrl.text,
        int.tryParse(txtDurationCtrl.text) ?? 0);

    await spHelper.writeSession(newSession);
    txtDescriptionCtrl.text = '';
    txtDurationCtrl.text = '';
    await updateScreen();
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    for (var session in sessions) {
      tiles.add(ListTile(
        title: Text(session.description),
        subtitle: Text('${session.date} - duration: ${session.duration} min'),
      ));
    }
    return tiles;
  }

  Future updateScreen() async {
     sessions = await spHelper.getSessions();
     setState(() {});
  }
}

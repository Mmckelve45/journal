import 'package:flutter/material.dart';
import 'package:journal/export.dart';
import 'package:journal/src/widgets/journal_entry_form.dart';

class NewEntry extends StatefulWidget {
  const NewEntry({Key? key}) : super(key: key);

  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final formDefinition = JournalForm();

  void changeMode() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(75),
      child: journalAppBar("New Entry!")),
      endDrawer: JournalDrawer(),
      body: addJournalForm(context, _formKey, formDefinition),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('new entry'),//Scaffold.of(context).widget,    //createEntry(),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

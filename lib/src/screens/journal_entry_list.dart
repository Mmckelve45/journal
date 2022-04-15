import 'package:flutter/material.dart';
import 'package:journal/export.dart';

class JournalEntryList extends StatefulWidget {
  const JournalEntryList({Key? key}) : super(key: key);

  @override
  _JournalEntryListState createState() => _JournalEntryListState();
}

class _JournalEntryListState extends State<JournalEntryList> {
  final journalEntryFields = JournalForm();
  var journalEntries;
  final journal = Journal();

  // JournalEntry journal = JournalEntry(journalList: []);

  @override
  void initState() {
    super.initState();
    //from database_manager file
    // loadJournal();
    loadJournal();
  }

  void loadJournal() async {
    String sqlCreate = await rootBundle.loadString(SQL_DATABASE_CREATION);
    String sqlSelect = await rootBundle.loadString(SQL_SELECT);
    // await deleteDatabase('journal.db');

    final Database database = await openDatabase('journal.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(sqlCreate);
    });

    List<Map> journalRecords = await database.rawQuery(sqlSelect);
    journalEntries = journalRecords.map((record) {
      return journal.journalData(record['title'], record['body'],
          record['rating'], record['dateTime']);
    }).toList();

    setState(() {
      build(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return checkEmptyDB(context);
  }

  Widget checkEmptyDB(BuildContext context) {
    if (journalEntries == null) {
      return Center(child: CircularProgressIndicator());
      // Navigator.of(context).pushNamed('welcome screen');
      // return const WelcomePage();
      // return SingleChildScrollView(child: Text("No Entries"));
    } else {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: journalAppBar("My Journal Entries")),
        endDrawer: JournalDrawer(),
        body: ListView(children: [
          for (int i = 0; i < journalEntries.length; i++)
            ListTile(
              title: Text(journalEntries[i][0]),
              subtitle: Text(journalEntries[i][3]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DisplayEntry(
                          title: journalEntries[i][0],
                          subtitle: journalEntries[i][1],
                          dateTime: journalEntries[i][3],
                          rating: journalEntries[i][2].toString())),
                );
              },
            )
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('new entry'),
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
  }
}

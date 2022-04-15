import 'package:flutter/material.dart';
import 'package:journal/export.dart';

void dbSave(context, key, field) async {
  if (key.currentState!.validate()) {
    key.currentState!.save();
    loadAddJournal(context, key, field);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => JournalEntryList()),
      (route) => false,
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('New Entry Added')));
  }
}

void loadAddJournal(context, key, field) async {
  String sqlCreate = await rootBundle.loadString(SQL_DATABASE_CREATION);
  String sqlInsert = await rootBundle.loadString(SQL_INSERT);
  // await deleteDatabase('journal.db');
  final Database database = await openDatabase('journal.db', version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(sqlCreate);
  });
  await database.transaction((txn) async {
    await txn.rawInsert(
        sqlInsert, [field.title, field.body, field.rating, field.dateTime]);
  });
}

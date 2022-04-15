import 'package:journal/export.dart';

class JournalEntry {
  List<JournalForm> journalList = [];

  JournalEntry({required this.journalList});

  void newJournalEntry(entry) {
    if (entry != null) {
      journalList.add(entry);
    }
  }
}

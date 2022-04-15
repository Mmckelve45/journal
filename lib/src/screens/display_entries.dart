import 'package:journal/export.dart';
import 'package:flutter/material.dart';

class DisplayEntry extends StatefulWidget {
  const DisplayEntry(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.dateTime,
      required this.rating})
      : super(key: key);

  final String title;
  final String subtitle;
  final String dateTime;
  final String rating;

  @override
  _DisplayEntryState createState() => _DisplayEntryState();
}

class _DisplayEntryState extends State<DisplayEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(75),
            child: journalAppBar("My Entry!")),
        endDrawer: JournalDrawer(),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(widget.title, style: TextStyle(fontSize: 30)))),
            Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(widget.subtitle))),
            Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Rating: ${widget.rating}"))
            ),
          ],
        ));
  }
}

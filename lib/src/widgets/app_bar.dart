// import 'package:flutter/cupertino.dart';
// import 'package:journal/src/widgets/journal_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journal/export.dart';

Widget journalAppBar(title) {
  return AppBar(
    leading: const BackButton(),
    centerTitle: true,
    title: Text(title),
    actions: [
      Builder(
          builder: (context) => IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ))
    ],
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journal/export.dart';

class JournalDrawer extends StatefulWidget {
  const JournalDrawer({ Key? key }) : super(key: key);

  @override
  _JournalDrawerState createState() => _JournalDrawerState();
}

class _JournalDrawerState extends State<JournalDrawer> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(5),
        children: [
          ListTile(
              contentPadding: EdgeInsets.all(2),
              leading: Text('Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500))),
          Divider(
            thickness: 1.0,
            color: Colors.teal,
          ),
          SwitchListTile(
              title: Text('Dark Mode'),
              value: darkMode,
              onChanged: (bool value) async {
                setState(() {
                  darkMode = value;
                  if (darkMode == true) {
                    MyApp.checkTheme(context)!.switchTheme(ThemeMode.dark);
                  } else {
                    MyApp.checkTheme(context)!.switchTheme(ThemeMode.light);
                  }
                  saveMode(darkMode);
                });
              })
        ],
      ),
    );
  }
}

void saveMode(mode) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('mode', mode.toString());
}

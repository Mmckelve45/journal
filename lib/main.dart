import 'package:flutter/material.dart';
import 'package:journal/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
  ]);

  // await deleteDatabase('journal.db');
  // check if we need to navigate to the welcome screen first.
  var firstScreen;
  bool welcome = await databaseFactory.databaseExists('journal.db');
  if (welcome) {
    firstScreen = true;
  } else {
    firstScreen = false;
  }
  runApp(MyApp(
      preference: await SharedPreferences.getInstance(), welcome: firstScreen));
}

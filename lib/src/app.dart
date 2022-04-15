import 'package:flutter/material.dart';
import 'package:journal/export.dart';

bool lightMode = true;

class MyApp extends StatefulWidget {
  final bool welcome;
  final SharedPreferences preference;
  const MyApp({Key? key, required this.preference, required this.welcome})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? checkTheme(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  static final routes = {
    'journal entry list': (context) => const JournalEntryList(),
    // 'journal entry': (context) => const NewEntry(), //JournalEntry(),
    'new entry': (context) => const NewEntry(), //NewEntry(),
    'welcome screen': (context) => const WelcomePage()
  };

  late String? theme;// = await SharedPreferences.getInstance();

  void initState() {
    super.initState();
    theme = 'Light';
    initThemeMode();
  }

  initThemeMode(){
    setState(() {
      theme = widget.preference.getString('mode') ?? 'false';
    });
  }

  // bool existingDB = false;
  var firstScreen;

  // This widget bring us to the welcome page.
  @override
  Widget build(BuildContext context) {
    if (widget.welcome == true) {
      firstScreen = JournalEntryList();
    } else {
      firstScreen = WelcomePage();
    }

    return MaterialApp(
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        themeMode: selectedTheme(theme),
        title: 'Journal',
        // routes: routes,
        routes: routes,
        home: firstScreen);
  }

  ThemeMode selectedTheme(String? mode) {
    if (theme == 'true') {
      return ThemeMode.dark;
    } else {
      return _themeMode;
    }
  }

  void switchTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: journalAppBar("Welcome!")),
      endDrawer: JournalDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 100,
              width: 100,
              child: FittedBox(
                child: Icon(Icons.book),
                fit: BoxFit.fill,
              ),
            ),
            Center(
                child: Text(
              'Journal your Dart Adventures!',
              style: Theme.of(context).textTheme.headline6,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('new entry'),
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phronema',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Phronema Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var greeting = "GOOD ";
    if (now.hour < 12) {
      greeting += "MORNING";
    } else if (now.hour < 18) {
      greeting += "AFTERNOON";
    } else {
      greeting += "EVENING";
    }

    greeting += "\n";

    switch (now.weekday) {
      case 0:
        greeting += "Sunday, ";
        break;
      case 1:
        greeting += "Monday, ";
        break;
      case 2:
        greeting += "Tuesday, ";
        break;
      case 3:
        greeting += "Wednesday, ";
        break;
      case 4:
        greeting += "Thursday, ";
        break;
      case 5:
        greeting += "Friday, ";
        break;
      case 6:
        greeting += "Saturday, ";
        break;
    }

    switch (now.month) {
      case 1:
        greeting += "January ";
        break;
      case 2:
        greeting += "Feburary ";
        break;
      case 3:
        greeting += "March ";
        break;
      case 4:
        greeting += "April ";
        break;
      case 5:
        greeting += "May ";
        break;
      case 6:
        greeting += "June ";
        break;
      case 7:
        greeting += "July ";
        break;
      case 8:
        greeting += "August ";
        break;
      case 9:
        greeting += "September ";
        break;
      case 10:
        greeting += "October ";
        break;
      case 11:
        greeting += "November ";
        break;
      case 12:
        greeting += "December ";
        break;
    }

    greeting += "${now.day}";

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(children: [
          HomeTab(greeting: greeting),
          const Icon(Icons.calendar_month),
          const Icon(Icons.search),
          const Icon(Icons.menu),
        ]),
        bottomNavigationBar: const TabBar(tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.calendar_month),
          ),
          Tab(
            icon: Icon(Icons.search),
          ),
          Tab(
            icon: Icon(Icons.menu),
          )
        ]),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
    required this.greeting,
  });

  final String greeting;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(greeting),
          floating: true,
          flexibleSpace: const Placeholder(),
          expandedHeight: 200,
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (context, index) => ListTile(title: Text('Item #$index')),
        //     childCount: 20,
        //   ),
        // ),
        SliverList.list(children: const <Widget>[
          //Fasting Guidelines
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.no_food),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Strict Fast. No meat, dairy, eggs, alcohol, or oil.")
                ],
              ),
            ),
          ),
          //Prayers
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.sunny),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Start Morning Prayers"),
                  Spacer(),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
          ),
          //Scripture Lectionary
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                      "Epistle\nSt.Paul's Second letter to the Corinthians 5:1-10")
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [Text("Gospel\nLuke 9:1-6")],
              ),
            ),
          ),
        ]),
      ],
    );
  }
}

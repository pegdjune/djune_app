import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UniversitySelectionPage(),
      // routes: {
      //   '/university': (context) => UniversitySelectionPage(),
      //   '/school': (context) => SchoolSelectionPage(),
      //   '/services': (context) => ServicesPage(),
      // },
    );
  }
}

class University {
  final String name;
  final String logo;
  final List<School> schools;
  final List<Service> services;

  University(this.name, this.logo, this.schools, this.services);
}

class School {
  final String name;
  final String logo;

  School(this.name, this.logo);
}

class Service {
  final String name;
  final String url;

  Service(this.name, this.url);
}

class UniversitySelectionPage extends StatelessWidget {
  final List<University> universities = [
    University(
      'University A',
      'logo_university_a.png',
      [
        School('School X', 'logo_school_x.png'),
        School('School Y', 'logo_school_y.png'),
        School('School Z', 'logo_school_z.png'),
      ],
      [
        Service('Service 1', 'https://example.com/service1'),
        Service('Service 2', 'https://example.com/service2'),
        Service('Service 3', 'https://example.com/service3'),
      ],
    ),
    University(
      'University B',
      'logo_university_b.png',
      [
        School('School P', 'logo_school_p.png'),
        School('School Q', 'logo_school_q.png'),
        School('School R', 'logo_school_r.png'),
      ],
      [
        Service('Service 4', 'https://example.com/service4'),
        Service('Service 5', 'https://example.com/service5'),
        Service('Service 6', 'https://example.com/service6'),
      ],
    ),
    University(
      'University C',
      'logo_university_c.png',
      [
        School('School M', 'logo_school_m.png'),
        School('School N', 'logo_school_n.png'),
        School('School O', 'logo_school_o.png'),
      ],
      [
        Service('Service 7', 'https://example.com/service7'),
        Service('Service 8', 'https://example.com/service8'),
        Service('Service 9', 'https://example.com/service9'),
      ],
    ),
  ];

  UniversitySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choix de l\'université'),
      ),
      body: ListView.builder(
        itemCount: universities.length,
        itemBuilder: (context, index) {
          final university = universities[index];
          return ListTile(
            title: Text(university.name),
            leading: Image.asset('assets/${university.logo}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchoolSelectionPage(university),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SchoolSelectionPage extends StatelessWidget {
  final University university;

  const SchoolSelectionPage(this.university, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Écoles de ${university.name}'),
      ),
      body: ListView.builder(
        itemCount: university.schools.length,
        itemBuilder: (context, index) {
          final school = university.schools[index];
          return ListTile(
            title: Text(school.name),
            leading: Image.asset('assets/${school.logo}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServicesPage(university, school),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  final University university;
  final School school;

  const ServicesPage(this.university, this.school, {super.key});

  @override
  Widget build(BuildContext context) {
    final services = university.services;

    return Scaffold(
      appBar: AppBar(
        title: Text('Services de ${school.name}'),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ListTile(
            title: Text(service.name),
            leading: const Icon(Icons.business),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebviewScaffold(
                    appBar: AppBar(
                      title: Text(service.name),
                    ),
                    url: service.url,
                    withZoom: true,
                    withLocalStorage: true,
                  ),
                ),
              );
            },
            trailing: IconButton(
              icon: const Icon(Icons.chat),
              onPressed: () {
                _openWhatsApp();
              },
            ),
          );
        },
      ),
    );
  }

  void _openWhatsApp() async {
    const phoneNumber =
        '22991724377'; // Remplacez par votre numéro de téléphone WhatsApp
    const url = "https://wa.me/$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}












// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:flutter/material.dart';
from app.routers import observations
from app.routers import users

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'We love Navara Hackathon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const List<String> species = <String>['Fallow deer', 'Red deer', 'Roe deer', 'Wild boar', 'Scottish Highlander', 'Wolf'];
const List<String> gender = <String>['Female', 'Male', 'Unknown'];
const List<String> age = <String>['Young', 'Adolescent', 'Adult', 'Unknown'];
const List<String> health = <String>['1', '2', '3', '4', '5', 'Unknown'];

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Username()
    );
  }
}

class Username extends StatefulWidget {
  @override
  _UsernameState createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myUsernameController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text("Username: "),
              SizedBox(
                height: 40,
                width: 200,
                child: TextField(
                  controller: myUsernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter username',
                  ),
                ),
              )
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text("Password: "),
              SizedBox(
                height: 40,
                width: 200,
                child: TextField(
                  controller: myPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter password',
                  ),
                ),
              )
            ]
          ),
          TextButton(
          onPressed: () {
            print(myPasswordController);
            print(myUsernameController);
            //TODO: if matches, then go to another page
          },
          child: const Text('Enter'),
        )
      ]
    );
  }
}

class Observations extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Animal species: "),
              DropdownButtonExample(list: species),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Number of animals: "),
              SizedBox(
                height: 40,
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter age',
                  ),
                )
              )  
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Gender: "),
              DropdownButtonExample(list: gender),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Age: "),
              DropdownButtonExample(list: age),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Age: "),
              DropdownButtonExample(list: health),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Location: "),
              SizedBox(
                height: 40,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter location if known',
                  ),
                )
              )  
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Remarks: "),
              SizedBox(
                height: 40,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '',
                  ),
                )
              )  
            ]
          ),
        ]
      );
  }
  
}

class DropdownButtonExample extends StatefulWidget {
  final List<String> list;
  const DropdownButtonExample({super.key, required this.list});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  

  @override
  Widget build(BuildContext context) {
    List<String> list = widget.list;
    String dropdownValue = list.first;
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


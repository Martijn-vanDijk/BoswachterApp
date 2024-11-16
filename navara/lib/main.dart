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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'We love Navara Hackathon'),
      routes: {
        '/observe': (context) => ObservePage(title: 'We really love Navara Hackathon',),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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

class ObservePage extends StatefulWidget {
  ObservePage({super.key, required this.title});

  final String title;

  @override
  _ObservePageState createState() => _ObservePageState();
}
class _ObservePageState extends State<ObservePage> {
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
      body: Observations()
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
            //if (myPasswordController == somepyvar && myUsernameController == somepyvar){
              Navigator.pushReplacementNamed(
                    context,
                    '/observe');
            //} else {
            //  print("Password/username incorrect");
            //}
          },
          child: const Text('Enter'),
        )
      ]
    );
  }
}

class Observations extends StatefulWidget {
  @override
  _ObservationsState createState() => _ObservationsState();
}

class _ObservationsState extends State<Observations> {
  final myNumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Animal species: "),
              DropdownButtonExample(list: species),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text("Number of animals: "),
              SizedBox(
                height: 40,
                width: 200,
                child: TextField(
                  controller: myNumController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                )
              )  
            ]
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Gender: "),
              DropdownButtonExample(list: gender),
            ]
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Age: "),
              DropdownButtonExample(list: age),
            ]
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Age: "),
              DropdownButtonExample(list: health),
            ]
          ),
          const Row(
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
          const Row(
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


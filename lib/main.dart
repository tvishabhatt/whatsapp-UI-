import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Screen1.dart';
import 'package:whatsapp/function.dart';

import 'Screen2.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => editfunction(),),
    ChangeNotifierProvider(create: (context) => fun(),),
    ChangeNotifierProvider(create: (context) => cuttent(),),
    ChangeNotifierProvider(create: (context) => tab(),),

  ],
  child: MyApp(),)
   );
}
List<Map<String, dynamic>> data = [
  {
    'name': "Person 1",
    'sub':Text("Hello",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': '14:18',
    'Ima': AssetImage('assets/img.png'),
  },
  {
    'name': "Person 2",
    'sub':Text("How are you ?",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'yesterday',
    'Ima':   AssetImage('assets/img.png'),

  }, {
    'name': "Person 3",
    'sub':Text("Hii",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'Tuseday',
    'Ima':AssetImage('assets/img.png'),
  },
  {
    'name': "Person 4",
    'sub':Text("Hii",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'Tuseday',
    'Ima':AssetImage('assets/img.png'),
  },

  {
    'name': "Person 5",
    'sub':Text("Hii",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'Tuseday',
    'Ima':AssetImage('assets/img.png'),
  },
  {
    'name': "Person 6",
    'sub':Text("Hii",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'Tuseday',
    'Ima':AssetImage('assets/img.png'),
  },

  {
    'name': "Person 7",
    'sub':Text("Hii",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'Tuseday',
    'Ima':AssetImage('assets/img.png'),
  },

  {
    'name': "Person 8",
    'sub':Text("Hii",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'Tuseday',
    'Ima':AssetImage('assets/img.png'),
  },
  {
    'name': "Person 9",
    'sub':Text("Hii",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'Tuseday',
    'Ima':AssetImage('assets/img.png'),
  },
  {
    'name': "Person 10",
    'sub':Text("Hii",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'Tuseday',
    'Ima':AssetImage('assets/img.png'),
  },
  {
    'name': "Person 11",
    'sub':Text("Hii",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'Tuseday',
    'Ima':AssetImage('assets/img.png'),
  },
  {
    'name': "Person 12",
    'sub':Text("Hii",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'Tuseday',
    'Ima':AssetImage('assets/img.png'),
  },
  {
    'name': "Person 13",
    'sub':Text("Hii",style: TextStyle(fontSize: 14,color: Colors.grey),),
    'time': 'Tuseday',
    'Ima':AssetImage('assets/img.png'),
  },
];
bool a=true;
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,

        home: Screen1(),
    );
  }
}



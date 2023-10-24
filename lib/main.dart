import 'package:flutter/material.dart';
import 'package:todo_app/login_ui/login_page.dart';
import 'package:todo_app/login_ui/welcome.dart';
import 'package:hive_flutter/hive_flutter.dart';
late Box box1;

//init hive db and open the HIVE box
void main()  async{
  await Hive.initFlutter();
  box1 = await Hive.openBox('logindata');//init hive
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //if islogged is true take user direct to WelcomePage else loginPage
      home: box1.get('isLogged',defaultValue: false)?const WelcomePage():const Login_Page()  // load login page
    );
  }
}
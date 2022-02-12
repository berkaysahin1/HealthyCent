

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:healthycent/screens/loginscreen.dart';
import 'package:healthycent/screens/main_screen.dart';
import 'package:healthycent/screens/registerscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String spKullanici;
  late String spSifre;
  late String spAd;
  late String speMail;

  Future<bool> oturumKontrol() async{
    var sp= await SharedPreferences.getInstance();
    String? spKullanici=await sp.getString("KullaniciAdi");
    String? spSifre=await sp.getString("sifre");
    String? spVeriMail=await sp.getString("VeriMail");
    String? spVeriSifre=await sp.getString("VeriSifre");
    if (spKullanici==spVeriMail && spSifre==spVeriSifre){
      if (spKullanici==null || spSifre==null){
        return false;
      }
      return true;
    }
    else{
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HealthyCent",
      home: FutureBuilder<bool>(
        future: oturumKontrol(),
        builder: (context,snapshot){
          if(snapshot.hasData==true){
            bool? gecisizni=snapshot.data;
            if (gecisizni==true) {
              return MainScreen();
            } else {
              return LoginScreen();
            }
          }
          else{return Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 169, 50, 1),));
          }
        },
      ),
    );
  }
}
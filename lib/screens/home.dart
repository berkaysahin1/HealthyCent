import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pedometer/pedometer.dart';

import 'loginscreen.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int spbakiye = 0;
  late int spadim = 0;
  late int sppuan = 0;
  late int sptthak = 0;
  late int spttkul = 0;
  late String spKullanici = "";
  late String spSifre = "";
  late String spAd = "";

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  Future<void> girisOku() async {
    var sp = await SharedPreferences.getInstance();
    setState(() {
      spKullanici = sp.getString("KullaniciAdi")!;
      spSifre = sp.getString("sifre")!;
      spAd = sp.getString("Ad")!;
      spbakiye = sp.getInt("bakiye")!;
      sppuan = sp.getInt("puan")!;
      spadim = sp.getInt("adim")!;
      sptthak = sp.getInt("tthak")!;
      spttkul = sp.getInt("ttkul")!;
    });
  }

  Future<void> cikisYap() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove("KullaniciAdi");
    sp.remove("sifre");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    super.initState();
    girisOku();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
    ++spadim;
    stepController(spadim, spbakiye);
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  Future<void> stepController(int adim, int bakiye) async {
    if (adim == 10000) {
      bakiye += 2;
      adim = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("HealthyCent"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              cikisYap();
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            color: Colors.green,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 250,
                    height: 250,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                                "https://www.pngfind.com/pngs/m/389-3898402_feet-icon-blue-foot-icon-hd-png-download.png")
                            as ImageProvider,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Adımlarınız: ${spadim}/10000',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    subtitle: Text(
                      "Her 10.000 adımda 2TL bakiye yüklenecektir.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 30, right: 30),
            child: Card(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Bakiye: ${spbakiye}TL\n Puan: ${sppuan}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            color: Colors.green,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 250,
                    height: 250,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6QOlCsUE_DneOGi8BiHBUShpm_61wF8ALOTmW7pU-Ipq3RuNPDpjgfdSQ_nIIhuWXvZ8&usqp=CAU")
                            as ImageProvider,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Toplu Taşıma Kullanımı: ${spttkul}/20\n Ücretsiz Kullanım Hakkınız: ${sptthak}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    subtitle: Text(
                      "Her 20 kullanımda 1 Toplu Taşıma kullanımı ücretsiz olacaktır",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 30, right: 30),
            child: Card(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'İpucu: Daha fazla bakiye ve puan kazanmak için işaretli yollardan ilerleyin.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

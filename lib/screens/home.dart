import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

<<<<<<< Updated upstream
class Home extends StatelessWidget {
=======
import 'loginscreen.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
late int spbakiye;
late int spadim;
late int sppuan;
late int sptthak;
late int spttkul;
late String spKullanici;
late String spSifre;
late String spAd;

  Future<void> girisOku() async{
    var sp= await SharedPreferences.getInstance();
    setState(() {
      spKullanici=sp.getString("KullaniciAdi")!;
      spSifre=sp.getString("sifre")!;
      spAd=sp.getString("Ad")!;
      spbakiye=sp.getInt("bakiye")!;
      sppuan=sp.getInt("puan")!;
      spadim=sp.getInt("adim")!;
      sptthak=sp.getInt("tthak")!;
      spttkul=sp.getInt("ttkul")!;
    });
  }

  Future<void> cikisYap() async{
    var sp= await SharedPreferences.getInstance();
    sp.remove("KullaniciAdi");
    sp.remove("sifre");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));


  }
@override
void initState(){
  super.initState();
  girisOku();
}
>>>>>>> Stashed changes
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
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("test")
                  .doc("test")
                  .set({"alan1": "deneme"});
            },
            child: Text("Test"),
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
                                "https://www.pngfind.com/pngs/m/389-3898402_feet-icon-blue-foot-icon-hd-png-download.png")
                            as ImageProvider,
                      ),
<<<<<<< Updated upstream
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Adımlarınız: 500/10000',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    subtitle: Text(
                      "Her 10.000 adımda 2TL bakiye yüklenecektir.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
=======

                      ListTile(
                        title: Text(
                          'Adımlarınız: ${spadim}/10000',textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        subtitle: Text("Her 10.000 adımda 2TL bakiye yüklenecektir.",textAlign: TextAlign.center,style: TextStyle(fontSize: 13, color: Colors.white),),
                      ),


>>>>>>> Stashed changes
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 30, right: 30),
            child: Card(
<<<<<<< Updated upstream
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
                        'Bakiye: 12TL\n Puan: 2000',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: Colors.white),
=======
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
                                  'Bakiye: ${spbakiye}TL\n Puan: ${sppuan}',textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
                      'Toplu Taşıma Kullanımı: 12/20\n Ücretsiz Kullanım Hakkınız: 0',
                      textAlign: TextAlign.center,
=======
                      'Toplu Taşıma Kullanımı: ${spttkul}/20\n Ücretsiz Kullanım Hakkınız: ${sptthak}',textAlign: TextAlign.center,
>>>>>>> Stashed changes
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

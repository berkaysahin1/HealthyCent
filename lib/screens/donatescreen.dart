import 'dart:collection';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthycent/db/Vakiflar.dart';

import 'package:healthycent/db/veritabaniyardimcisi.dart';
import 'package:healthycent/screens/vakiflardetails.dart';

import 'package:shared_preferences/shared_preferences.dart';

class donatescreen extends StatefulWidget {
  @override
  State<donatescreen> createState() => _donatescreenState();
}

class _donatescreenState extends State<donatescreen> {
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
  }

  Future<List<Vakiflar>> vakifList() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM Vakiflar");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Vakiflar(satir["vakif_Id"], satir["vakif_Foto"],
          satir["vakif_Adi"], satir["vakif_Alani"], satir["vakif_Icerik"]);
    });
  }

  // var videolar = [
  //   "Sıfırdan Komple Java Geliştirici Kursu",
  //   "Başlangıçtan İleri Seviyeye Mobil Uygulama",
  //   "Android Mobil Uygulama Kursu",
  //   "Aranan Programcı Olma Kamp Kursu| Python,Java,C#",
  //   "Angular ile Sıfırdan İleri Seviye Web Geliştirme",
  //   "Müzik Teorisi (Armoni):1",
  //   "Yeni Başlayanlar İçin Elektro Gitar",
  // ];
  late int spbakiye = 0;
  Future<void> girisOku() async {
    var sp = await SharedPreferences.getInstance();
    setState(() {
      spbakiye = sp.getInt("bakiye")!;
    });
  }

  @override
  void initState() {
    super.initState();
    girisOku();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("HealthyCent"),
          centerTitle: true,
          actions: <Widget>[
            Card(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                // side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              // margin: EdgeInsets.all(7.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 3, left: 3),
                child: Text(
                  'Bakiye: ${spbakiye}TL',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Vakiflar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            videocek(context,height),
          ],
        ));
  }

  videocek(BuildContext context,height) {
    return Container(
      height: height/1.38,
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      child: FutureBuilder<List<Vakiflar>>(
        future: vakifList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var vakiflist = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemCount: vakiflist!.length,
              itemBuilder: (context, index) {
                var vakif = vakiflist[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => vakiflarDetails(
                                  vakif: vakif,
                                )));
                    print("vakif adı: ${vakif.vakif_Adi}");
                  },
                  child: Card(
                    margin: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network("${vakif.vakif_Foto}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            vakif.vakif_Adi,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            vakif.vakif_Alani,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Color.fromRGBO(255, 169, 50, 1),
            ));
          }
        },
      ),
    );
  }
}

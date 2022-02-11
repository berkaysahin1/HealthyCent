import 'package:flutter/material.dart';
import 'package:healthycent/util/places.dart';

class Video extends StatelessWidget {
  var videolar = [
    "Sıfırdan Komple Java Geliştirici Kursu",
    "Başlangıçtan İleri Seviyeye Mobil Uygulama",
    "Android Mobil Uygulama Kursu",
    "Aranan Programcı Olma Kamp Kursu| Python,Java,C#",
    "Angular ile Sıfırdan İleri Seviye Web Geliştirme",
    "Müzik Teorisi (Armoni):1",
    "Yeni Başlayanlar İçin Elektro Gitar",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                  'Puan: 2000',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
          itemCount: videolar.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print("${videolar[index]} tıklandı");
              },
              child: Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                          "https://cdn.pixabay.com/photo/2022/01/08/19/13/animal-6924664_960_720.jpg"),
                    ),
                    Text(
                      '${videolar[index]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

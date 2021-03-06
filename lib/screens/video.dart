
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthycent/db/Videos.dart';
import 'package:healthycent/db/veritabaniyardimcisi.dart';
import 'package:healthycent/screens/videodetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Video extends StatefulWidget {
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
  }

  Future<List<Videos>> videoList() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Videos");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Videos(satir["video_Id"], satir["video_Foto"], satir["video_Adi"],
          satir["video_EgitmenAdi"], satir["video_Icerik"]);
    });
  }

  late int sppuan = 0;
  Future<void> girisOku() async {
    var sp = await SharedPreferences.getInstance();
    setState(() {
      sppuan = sp.getInt("puan")!;
    });
  }

  @override
  void initState() {
    super.initState();
    girisOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("HealthyCent"),
          centerTitle: true,
          actions: <Widget>[
            Card(
              margin: EdgeInsets.all(5.0),
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 3, left: 3),
                child: Text(
                  'Puan: ${sppuan}',
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
              padding: EdgeInsets.all(14.0),
              child: Text(
                "Videolar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            videocek(context),
          ],
        ));
  }

  videocek(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(

      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: height/1.35,
      child: FutureBuilder<List<Videos>>(
        future: videoList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var videolist = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemCount: videolist!.length,
              itemBuilder: (context, index) {
                var video = videolist[index];
                return GestureDetector(
                  onTap: () {
                    print("Video ad??: ${video.video_Adi}");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => videoDetails(
                                  video: video,
                                )));
                  },
                  child: Card(
                    margin: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network("${video.video_Foto}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            video.video_Adi,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            video.video_EgitmenAdi,
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

import 'package:flutter/material.dart';
import 'package:healthycent/util/places.dart';


class donatescreen extends StatefulWidget {
  @override
  State<donatescreen> createState() => _donatescreenState();
}

class _donatescreenState extends State<donatescreen> {
  var ulkeler=["Sağlık","Eğitim","Darüşşafaka","Lösev","Kızılay","Tema","Afad"];
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
        child:
          Padding(
            padding: const EdgeInsets.only(top: 8,right: 3,left: 3),
            child: Text(
              'Bakiye: 15TL',textAlign: TextAlign.center,
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
        itemCount: ulkeler.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              print("${ulkeler[index]} tıklandı");
            },
            child: Card(
              color: Colors.green,
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
                    child: Image.network("https://cdn.pixabay.com/photo/2022/01/08/19/13/animal-6924664_960_720.jpg"),
                  ),
                    Text(
                      '${ulkeler[index]}',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),

                ],
              ),
            ),
          );
        },
      )
    );
  }
}

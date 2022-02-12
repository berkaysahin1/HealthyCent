

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthycent/db/Vakiflar.dart';


class vakiflarDetails extends StatefulWidget {
  Vakiflar vakif;

  vakiflarDetails({required this.vakif});

  @override
  _vakiflarDetailsState createState() => _vakiflarDetailsState();
}

class _vakiflarDetailsState extends State<vakiflarDetails> {


  Color primaryColor = Color(0xFFFFA932);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("${widget.vakif.vakif_Adi}"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          // buildSlider(),
          SizedBox(height: 20),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 250,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${widget.vakif.vakif_Adi}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    onPressed: () {
                      print("fav buton");
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),
              Container(
                  alignment: Alignment.center,
                  child: Image.network(widget.vakif.vakif_Foto)
              ),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.vakif.vakif_Icerik}",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Alan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.vakif.vakif_Alani}",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    child: Text("Bağış yap"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    onPressed:(){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Bağış yapıldı.')),
                      );
                    },
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
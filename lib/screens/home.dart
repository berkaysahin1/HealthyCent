import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("HealthyCent"),
        centerTitle: true,
        actions: <Widget>[
          // IconButton(
          //   icon: IconBadge(
          //     icon: Icons.notifications_none,
          //   ),
          //   onPressed: () {},
          // ),
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
                      image:  DecorationImage(
                      fit: BoxFit.fill,
                      image:NetworkImage("https://www.pngfind.com/pngs/m/389-3898402_feet-icon-blue-foot-icon-hd-png-download.png")
                           as ImageProvider,
                      ),
                      ),
                      ),
                  ListTile(
                    title: Text(
                      'Adımlarınız: 500/10000',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    subtitle: Text("Her 10.000 adımda 2TL bakiye yüklenecektir.",textAlign: TextAlign.center,style: TextStyle(fontSize: 13, color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5,left: 30,right: 30),
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
                                  'Bakiye: 12TL\n Puan: 2000',textAlign: TextAlign.center,
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
                      image:  DecorationImage(
                        fit: BoxFit.fill,
                        image:NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6QOlCsUE_DneOGi8BiHBUShpm_61wF8ALOTmW7pU-Ipq3RuNPDpjgfdSQ_nIIhuWXvZ8&usqp=CAU")
                        as ImageProvider,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Toplu Taşıma Kullanımı: 12/20\n Ücretsiz Kullanım Hakkınız: 0',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    subtitle: Text("Her 20 kullanımda 1 Toplu Taşıma kullanımı ücretsiz olacaktır",textAlign: TextAlign.center,style: TextStyle(fontSize: 13, color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5,left: 30,right: 30),
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
                        'İpucu: Daha fazla bakiye ve puan kazanmak için işaretli yollardan ilerleyin.',textAlign: TextAlign.center,
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

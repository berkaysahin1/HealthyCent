import 'package:flutter/material.dart';
import 'package:healthycent/util/places.dart';


class donatescreen extends StatefulWidget {
  @override
  State<donatescreen> createState() => _donatescreenState();
}

class _donatescreenState extends State<donatescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Adımlarınız",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            // child: SearchBar(),
          ),

        ],
      ),
    );
  }
}

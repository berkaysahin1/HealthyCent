import 'package:flutter/material.dart';
import 'package:healthycent/screens/donatescreen.dart';
import 'package:healthycent/screens/home.dart';
import 'package:healthycent/screens/mapscreen.dart';
import 'package:healthycent/screens/video.dart';
import 'package:healthycent/screens/qrscanscreen.dart';
// import 'package:healthycent/widgets/icon_badge.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;
  var sayfalar = [Home(), QrScanScreen(), MapScreen(), Video(), donatescreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children:
            List.generate(sayfalar.length, (context) => sayfalar[context]),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7.0),
            barIcon(icon: Icons.home, page: 0),
            barIcon(icon: Icons.qr_code, page: 1),
            barIcon(icon: Icons.map, page: 2),
            barIcon(icon: Icons.video_library, page: 3),
            barIcon(icon: Icons.monetization_on, page: 4),
            SizedBox(width: 7.0),
          ],
        ),
        color: Colors.white,
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  Widget barIcon(
      {IconData icon = Icons.home, int page = 0, bool badge = false}) {
    return IconButton(
      icon: Icon(icon, size: 24.0),
      color:
          _page == page ? Theme.of(context).accentColor : Colors.blueGrey[300],
      onPressed: () => _pageController.jumpToPage(page),
    );
  }
}

import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget {
  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFED1D24),
      automaticallyImplyLeading: false,
      centerTitle: false,
      title:  Image.asset(
        'assets/images/splash.png',
        height: 100,
        width: 100,
      ),
    );
  }
}

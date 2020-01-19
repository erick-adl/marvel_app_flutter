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
      automaticallyImplyLeading: false,
      centerTitle: false,
      leading: null,
      actions:  <Widget>[        
        Image.asset(
        'assets/images/splash.png',
        height: 40,
      ),
        new Flexible(
          child: Container(
            padding: EdgeInsets.all(5),
            child: TextField(
              // onChanged: (a) async {
              // },
              autofocus: false,
              decoration: InputDecoration(
                suffixIcon: new Icon(Icons.search),
                hintText: "Find by name..",
                border: OutlineInputBorder(
                    gapPadding: 0.0,
                    borderSide: new BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                hintStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    borderSide: BorderSide(color: Colors.blue)),
                contentPadding: EdgeInsets.only(bottom: 20.0, left: 10.0),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
      elevation: 0,
    );
  }
}

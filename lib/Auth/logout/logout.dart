import 'package:flutter/material.dart';
import 'package:product/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Logout extends StatefulWidget {
  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text('LOGOUT'),
          ),
          Padding(
            padding: const EdgeInsets.only(top:15.0,left:13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child:Icon(Icons.logout,color: Colors.yellow[800],),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.remove('true');
                      Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const MyHomePage()),
                              (Route<dynamic> route) => false);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Logout'),
                           Container(
                             margin: EdgeInsets.only(top:10,right:10),
                             height: 1,
                             color: Colors.grey[300],
                           )
                           ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
           
        ],
      ),
    );

  }
}

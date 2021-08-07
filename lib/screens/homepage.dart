import 'package:easy_login/screens/sign_in.dart';
import 'package:easy_login/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({Key key, @required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "User ID",
            style: GoogleFonts.montserrat(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color(0xff002A42),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              widget.user.uid,
              style: GoogleFonts.montserrat(
                color: Color(0xff00A3FF),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 15, top: 30, right: 20, left: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff00A3FF)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))),
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 50))),
              onPressed: () async {
                bool loggedOut = await AuthService.signOut();
                if (loggedOut) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SignIn();
                    },
                  ));
                }
              },
              child: Text(
                "Logout",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

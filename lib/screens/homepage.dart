import 'package:easy_login/screens/sign_in.dart';
import 'package:easy_login/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20, top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: GoogleFonts.montserrat(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff002A42),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "I am Sunil",
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff002A42),
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.only(bottom: 8, left: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff00A3FF),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "Welcome to the homepage, you are now logged in as a new user. Click on logout button to revisit the Sign in screen and try new options.",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "Every user have a unique ID, so do you. Your ID is ${widget.user.uid}. Make sure your unique ID is confidential.",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
                    minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 50))),
                onPressed: () async {
                  launch('tel:7024989252');
                },
                child: Text(
                  "Call me",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff00A3FF)),
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
      ),
    );
  }
}

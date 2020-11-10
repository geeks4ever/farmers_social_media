import 'package:farmers_social_media/src/views/ui/home_feed_view.dart';
import 'package:farmers_social_media/src/views/ui/register_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeLogin extends StatefulWidget {
  @override
  _HomeLoginState createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeFeed()));
              },
              child: Text('Login'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New User?. '),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    text: 'Click here',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserRegister()));
                      },
                  ),
                ),
              ], // Children
            ),
          ], // Children
        ),
      ),
    );
  }
}

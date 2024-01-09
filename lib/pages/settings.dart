import 'package:demo/utils/colors_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexStringToColor("#CCEAEB"),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Logged in with your email"),
                SizedBox(
                  height: 10,
                ),
                Text("You will be able to logout too!"),
                SizedBox(
                  height: 30,
                ),
                Text("Click on the button below to logout..."),
                SizedBox(
                  height: 20,
                ),
                FloatingActionButton(
                    child: Icon(Icons.logout), onPressed: signUserOut),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

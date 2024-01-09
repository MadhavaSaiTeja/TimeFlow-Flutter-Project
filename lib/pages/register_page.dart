import 'package:demo/components/my_button.dart';
import 'package:demo/components/my_textfield.dart';
import 'package:demo/components/square_tile.dart';
import 'package:demo/services/auth_service.dart';
import 'package:demo/utils/colors_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo/components/reusable_widget.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  //sign user up method
  void signUserUp() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    // try creating the user
    try {
      // check if password is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show the error message, passwords dont match
        showErrorMessage("Passwords don't match");
      }
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      //show error message
      showErrorMessage(e.code);
    }
  }

  // wrong email message popup
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexStringToColor("#CCEAEB"),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // SizedBox(
              //   height: 50,
              // ),
              // logo
              logoWidget("assets/images/TimeFlowLogo.png"),

              SizedBox(
                height: 15,
              ),
              // let's create an account for you!
              Text(
                "Let's create an account for you!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Username',
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              //confirm password textfield
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              //forgot password?
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Text(
              //         'Forgot Password?',
              //         style: TextStyle(color: Colors.grey[600]),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 25,
              ),
              //sign in button
              MyButton(
                text: "Sign Up",
                onTap: signUserUp,
              ),
              SizedBox(
                height: 50,
              ),
              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google button
                  SquareTile(
                    onTap: () => AuthService().signInWithGoogle(),
                    imagePath: 'assets/images/google.png',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // apple button
                  // SquareTile(imagePath: 'assets/images/apple.png'),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              //not a member? register now.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login now',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

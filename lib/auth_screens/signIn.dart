import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/auth.dart';
import 'package:moviesapp/auth_screens/signUp.dart';
import 'package:moviesapp/utils/textField.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onSignup;
  const LoginPage({Key? key, required this.onSignup}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: _controllerEmail,
                decoration: modifiedInputDecor.copyWith(labelText: "Email")),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              controller: _controllerPassword,
              decoration: modifiedInputDecor.copyWith(labelText: "Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Auth().signInWithEmailAndPassword(
                      email: _controllerEmail.text,
                      password: _controllerPassword.text);
                  //navigatorKey.current
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                    fixedSize: const MaterialStatePropertyAll(Size(230, 10))),
                child: Text(
                  "Sign In",
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Don't have an account?",
              style: GoogleFonts.ubuntu(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: widget.onSignup,
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                ),
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.montserrat(
                      color: Colors.red, fontWeight: FontWeight.w600),
                )),
          ],
        ),
      ),
    );
  }
}

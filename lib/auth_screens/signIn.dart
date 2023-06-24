import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/auth.dart';
import 'package:moviesapp/auth_screens/signUp.dart';
import 'package:moviesapp/utils/textField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                controller: _controllerEmail,
                decoration: modifiedInputDecor.copyWith(labelText: "Email")),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _controllerPassword,
              decoration: modifiedInputDecor.copyWith(labelText: "Password"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Auth().signInWithEmailAndPassword(
                      email: _controllerEmail.text,
                      password: _controllerPassword.text);
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                    fixedSize: const MaterialStatePropertyAll(
                        Size(230, 10))),
                child: Text("Sign In",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),)),
            SizedBox(height: 5,),
            Text(
              "Don't have an account?",
              style: GoogleFonts.ubuntu(fontSize: 20),
            ),
            SizedBox(height: 5,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                ),

                child: Text("Sign Up",style: GoogleFonts.montserrat(color: Colors.red,fontWeight: FontWeight.w600),)),
          ],
        ),
      ),
    );
  }
}

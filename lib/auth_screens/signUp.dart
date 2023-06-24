import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/auth.dart';
import 'package:moviesapp/utils/textField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controllerEmail,
              decoration: modifiedInputDecor.copyWith(
                labelText: "Email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _controllerPassword,
              decoration: modifiedInputDecor.copyWith(labelText: "Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Auth().createUserWithEmailAndPassword(
                      email: _controllerEmail.text,
                      password: _controllerPassword.text);
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(250,10)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))),
                child: Text("Register",style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),)),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Already have an account?",
              style: GoogleFonts.ubuntu(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white)),
                child: Text(
                  "Sign In",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600, color: Colors.red),
                ),
            )
          ],
        ),
      ),
    );
  }
}

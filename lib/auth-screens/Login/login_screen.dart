import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ico_app/auth-screens/Signup/signup_screen.dart';
import 'package:ico_app/components/already_have_an_account_acheck.dart';
import 'package:ico_app/components/rounded_button.dart';
import 'package:ico_app/components/rounded_input_field.dart';
import 'package:ico_app/components/rounded_password_field.dart';
import 'package:ico_app/paginas/admin/home-admin.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_input_field.dart';
import '../../main.dart';
import 'background.dart';
import 'package:ico_app/services/auth.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              emailController: emailController,
              hintText: "Correo",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              passwordController: passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                dynamic result = await _auth.handleSignIn(emailController.text, passwordController.text);
                if(result != null){
                  if(result.uid != "e4UBwHkyyCZEadiw6T1kBKShPiu2") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeAdmin()),
                    );
                  }
                } else {
                  print('error signing in');
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


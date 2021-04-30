import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ico_app/auth-screens/Login/login_screen.dart';
import 'package:ico_app/components/already_have_an_account_acheck.dart';
import 'package:ico_app/components/rounded_button.dart';
import 'package:ico_app/components/rounded_input_field.dart';
import 'package:ico_app/components/rounded_password_field.dart';
import 'package:ico_app/services/auth.dart';
import 'background.dart';

class SignUpScreen extends StatelessWidget {
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
              "CREAR CUENTA",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              emailController: emailController,
              hintText: "Correo",
              onChanged: (value) {

              },
            ),
            RoundedPasswordField(
              passwordController: passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "CREAR CUENTA",
              press: () async {
                dynamic result = await _auth.handleSignUp(emailController.text, passwordController.text);
                if(result != null){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                } else {
                  print('error signing in');
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}


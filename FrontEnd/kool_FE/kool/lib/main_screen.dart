import 'package:flutter/material.dart';
import 'package:kool/sign/signin_screen.dart';
import 'package:kool/sign/signup_screen.dart';

import 'adder/fancy_button.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/LogoKOOL.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 5),
            FancyButton(
              label: '                    Sign Up                    ',
              onPressed: () {
                // do something
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              },
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {
                // do something
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SigninScreen()),
                );
              },
              child: const Text(
                'You have had an account ?',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

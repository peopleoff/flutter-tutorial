import 'package:flutter/material.dart';
import 'package:my_app/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const FlutterLogo(size: 150),
                Flexible(
                  child: LoginButton(
                    icon: Icons.supervised_user_circle,
                    text: 'Guest',
                    loginMethod: AuthService().anonLogin,
                    color: Colors.deepPurple,
                  ),
                ),
                Flexible(
                  child: LoginButton(
                    icon: Icons.gamepad,
                    text: 'Sign In With Google',
                    loginMethod: AuthService().googleLogin,
                    color: Colors.tealAccent,
                  ),
                )
              ],
            )));
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.color,
      required this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        label: Text(text),
        icon: Icon(icon, color: Colors.white, size: 20),
        style: TextButton.styleFrom(
            padding: const EdgeInsets.all(24), backgroundColor: color),
        onPressed: () => loginMethod(),
      ),
    );
  }
}

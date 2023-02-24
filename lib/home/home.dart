import 'package:flutter/material.dart';
import 'package:my_app/login/login.dart';
import 'package:my_app/topics/topics.dart';
import 'package:my_app/services/auth.dart';

import '../shared/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          } else if (snapshot.hasError) {
            return const Center(child: Text('error'));
          } else if (snapshot.hasData) {
            return const TopicsScreen();
          } else {
            return const LoginScreen();
          }
        }));
  }
}

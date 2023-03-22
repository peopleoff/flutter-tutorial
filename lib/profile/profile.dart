import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/services/auth.dart';
import 'package:provider/provider.dart';

import '../services/models.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;
    if (user != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Profile')),
        body: Column(
          children: [
            Text(report.total.toString()),
            ElevatedButton(
              child: Text(user.uid),
              onPressed: () async {
                await AuthService().signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
            ),
          ],
        ),
      );
    } else {
      return Text("signed out");
    }
  }
}

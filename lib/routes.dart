import 'package:my_app/about/about.dart';
import 'package:my_app/login/login.dart';
import 'package:my_app/home/home.dart';
import 'package:my_app/topics/topics.dart';
import 'package:my_app/profile/profile.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/about': (context) => const AboutScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
};
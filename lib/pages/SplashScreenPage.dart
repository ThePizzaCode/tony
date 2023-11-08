import 'dart:async';
import 'package:flutter/material.dart';
import './onboarding/LoginPage.dart';
import '../components/NavBar.dart';

import '../providers/user.dart';

import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var user = Provider.of<User>(context, listen: false);
      await user.loadUser();

      if (user.token == '' || user.user.id == '') {
        Timer(
            const Duration(milliseconds: 500),
            () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage())));
      } else {
        await user.update(user.token);

        Timer(const Duration(milliseconds: 500), () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NavBar(
                      pageIndex: 0,
                    )),
          );
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tony/components/NavBar.dart';
import 'package:tony/pages/ProductPage.dart';
import 'package:tony/pages/ProductPageTest.dart';
import 'package:tony/pages/SplashScreenPage.dart';
import 'package:flutter/services.dart';
// import 'package:tony/components/NavBar.dart';

// providers
import './providers/user.dart';
import './providers/products.dart';
import './providers/wallet.dart';
import './providers/transactions.dart';
import './providers/order.dart';

void main() {
  //Fixes system navbar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: true,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));

//Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => User()),
    ChangeNotifierProvider(create: (_) => Products()),
    ChangeNotifierProvider(create: (_) => Wallet()),
    ChangeNotifierProvider(create: (_) => Transactions()),
    ChangeNotifierProvider(create: (_) => Order()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavBar(
          pageIndex: 0,
        ));
  }
}

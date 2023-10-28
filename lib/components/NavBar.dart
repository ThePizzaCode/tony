import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tony/pages/HomePage.dart';

class NavBar extends StatefulWidget {
  final int pageIndex;
  const NavBar({
    required this.pageIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.pageIndex;
  }

  final List<Widget> _screens = [
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: GNav(
            padding: const EdgeInsets.all(15),
            backgroundColor: Colors.white.withOpacity(0),
            activeColor: Colors.white,
            textStyle: const TextStyle(
                fontFamily: 'UberMoveMedium', color: Colors.white),
            tabBackgroundColor: const Color.fromARGB(255, 81, 0, 204),
            tabs: const [
              GButton(
                icon: Icons.receipt_long,
                gap: 8,
                text: 'Acasa',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

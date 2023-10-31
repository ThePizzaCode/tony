import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tony/pages/HomePage.dart';
import 'package:tony/pages/MenuPage.dart';
import 'package:tony/pages/ProfilePage.dart';

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
    const MenuPage(),
    const ProfilePage(
      pastTransactions: ['fd', 'gd'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              offset: Offset(0, 9), // Changes the position of the shadow
              blurRadius: 8, // Changes the size of the shadow
              spreadRadius: 5,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 10,
            ),
            child: GNav(
              gap: 10,
              haptic: true,
              color: Colors.black,
              activeColor: Colors.orange[900],
              padding: const EdgeInsets.all(15),
              backgroundColor: Colors.white.withOpacity(0),
              tabBackgroundColor: Color.fromARGB(40, 230, 81, 0)!,
              textStyle: const TextStyle(
                  fontFamily: 'UberMoveMedium',
                  color: Color.fromARGB(255, 239, 108, 0),
                  fontWeight: FontWeight.w500),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  gap: 8,
                  text: 'Acasa',
                ),
                GButton(
                  icon: Icons.book,
                  gap: 8,
                  text: 'Meniu',
                ),
                GButton(
                  icon: Icons.person,
                  gap: 8,
                  text: 'Profil',
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
      ),
    );
  }
}

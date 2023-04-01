import 'package:e_books/presentation/pages/start_page.dart';
import 'package:flutter/material.dart';

import 'books_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

  static final List<Widget> _widgetOptions = <Widget>[
    StartPage(),
    BooksPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _widgetOptions.elementAt(_selectedIndex),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildBottomNavBar(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      //selectedItemColor: Theme.of(context).colorScheme.tertiary,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_outlined),
          label: 'Книги',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin_outlined),
          label: 'Профиль',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}

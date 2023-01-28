import 'package:flutter/material.dart';
import '../screens/screens.dart';

class CommonWidget extends StatefulWidget {
  const CommonWidget({super.key});

  @override
  State<CommonWidget> createState() => _CommonWidgetState();
}

class _CommonWidgetState extends State<CommonWidget> {
  int _selectedIndex = 0;
  final List<String> _pageTitles = [
    'Home',
    'Product',
    'More',
  ];
  final List<Widget> _pages = [
    const HomeScreen(),
    const ProductsScreen(),
    const MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _selectedIndex == 0
            ? const Icon(Icons.menu)
            : IconButton(
                icon: const Icon(Icons.menu),
                onPressed: _selectedIndex != 0
                    ? () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      }
                    : null,
              ),
        title: Text(_pageTitles[_selectedIndex]),
        actions: <Widget>[
          ElevatedButton(
            child: Row(
              children: const <Widget>[Text("Link"), Icon(Icons.arrow_forward)],
            ),
            onPressed: () {},
          )
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: ('Contact Us'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: ('Products'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

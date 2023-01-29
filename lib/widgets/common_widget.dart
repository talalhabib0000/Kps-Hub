import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kps_hub/widgets/widgets.dart';
import '../constants/constants.dart';
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
    MoreScreen(),
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
            ? const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: CachedImageWidget(
                  imageUrl: '$mainUrl/kpshub/logo/hub_logo.png',
                ),
              )
            : GestureDetector(
                onTap: _selectedIndex != 0
                    ? () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                      }
                    : null,
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CachedImageWidget(
                    imageUrl: '$mainUrl/kpshub/logo/hub_logo.png',
                  ),
                ),
              ),
        title: Text(_pageTitles[_selectedIndex],
            style: Theme.of(context).textTheme.displayMedium),
        actions: const [AppBarLink()],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItemWidget(
            iconUrl: '$mainUrl/kpshub/logo/home_blue.png',
            label: 'Home',
          ),
          BottomNavigationBarItemWidget(
            iconUrl: '$mainUrl/kpshub/logo/products_blue.png',
            label: 'Products',
          ),
          BottomNavigationBarItemWidget(
            iconUrl: '$mainUrl/kpshub/logo/more_blue.png',
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: kTextColor,
        showUnselectedLabels: false,
      ),
    );
  }
}

class BottomNavigationBarItemWidget extends BottomNavigationBarItem {
  BottomNavigationBarItemWidget({
    required String iconUrl,
    required String label,
  }) : super(
          icon: CachedNetworkImage(
            imageUrl: iconUrl,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          label: (label),
        );
}

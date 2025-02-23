import 'package:flutter/material.dart';
import 'package:ghiblistore/pages/cart_page.dart';
import 'package:ghiblistore/items/page1.dart';
import 'package:ghiblistore/items/page2.dart';
import 'package:ghiblistore/items/page3.dart';
import 'package:ghiblistore/items/page4.dart';
import 'package:ghiblistore/pages/settings_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [HomeScreen(), CartPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD5D5),
      appBar: AppBar(backgroundColor: Color(0xFFFFD5D5)),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Text('Coming Soon', style: TextStyle(fontSize: 22)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
        activeColor: Colors.black,
        color: Colors.black,
        gap: 5,
        tabBackgroundColor: Colors.white,
        onTabChange: navigateBottomBar,
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.shopping_cart, text: 'Cart'),
          GButton(icon: Icons.settings, text: 'Settings'),
        ],
        // tabMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class HomeScreen extends StatelessWidget {
  final PageController controller = PageController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Something Aesthetic?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.red,
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 40),
            SmoothPageIndicator(
              controller: controller,
              count: 4,
              effect: SwapEffect(
                activeDotColor: Colors.grey.shade900,
                dotColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 500,
              child: PageView(
                controller: controller,
                children: [Page1(), Page2(), Page3(), Page4()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/views/Tabs/Browse%20Tab/browse_tab.dart';
import 'package:movies_app/views/Tabs/Home%20Tab/home_tab.dart';
import 'package:movies_app/views/Tabs/Search%20Tab/search_tab.dart';
import 'package:movies_app/views/Tabs/Watchlist%20Tab/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/Home.png"),
              size: 45,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/search.png"),
              size: 35,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/browse.png"),
              size: 35,
            ),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/watchlist.png"),
              size: 35,
            ),
            label: 'Watchlist',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff1A1A1A),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0xffFFB224),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: selectedIndex,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = const [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchlistTab()
  ];
}

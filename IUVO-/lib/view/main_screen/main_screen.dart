import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iuvo/components/constant/constant.dart';
import 'package:iuvo/generated/assets.dart';
import 'package:iuvo/view/chat_screen/chat_screen.dart';
import 'package:iuvo/view/discover_group_screen/discover_group_screen.dart';
import 'package:iuvo/view/edit_profile_screen/edit_profile_screen.dart';
import 'package:iuvo/view/home_screen/home_screen.dart';
import 'package:iuvo/view/report_status_screen/report_status_screen.dart';
import 'package:iuvo/view/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DiscoverGroupScreen(),
    ChatScreen(),
    ReportStatusScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("IUVO"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                'ANONYMOUS',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: const Text(
                'XXX.7878TYTY@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  //WE CAN ALSO USE .network INSTEAD OF .asset//
                  child: Image.asset(
                    Assets.imageAvater,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(color: appThemeColor),
            ),
            const ListTile(
              leading: Icon(
                Icons.home_filled,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: ()=>Get.to(const EditProfileScreen()),
              leading:const Icon(
                Icons.edit,
              ),
              title:const Text(
                'Edit Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString("email", "null");
                prefs.setString("password", "null");
                Get.to(const SplashScreen());
              },
              leading: const Icon(Icons.logout, color: Colors.black87),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
            icon: Icons.home_filled,
            backgroundColor: _selectedIndex == 0 ? appThemeColor : Colors.white,
          ),
          FluidNavBarIcon(
            icon: Icons.search,
            backgroundColor: _selectedIndex == 1 ? appThemeColor : Colors.white,
          ),
          FluidNavBarIcon(
            icon: Icons.message,
            backgroundColor: _selectedIndex == 2 ? appThemeColor : Colors.white,
          ),
          FluidNavBarIcon(
            icon: Icons.document_scanner,
            backgroundColor: _selectedIndex == 3 ? appThemeColor : Colors.white,
          ),
        ],
        onChange: _onItemTapped,
        style: const FluidNavBarStyle(
            barBackgroundColor: Colors.white,
            iconBackgroundColor: Colors.white,
            iconSelectedForegroundColor: Colors.white,
            iconUnselectedForegroundColor: Colors.grey),
      ),
    );
  }
}

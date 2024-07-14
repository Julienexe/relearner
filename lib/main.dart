import 'package:flutter/material.dart';
import 'package:relearner/modules/general_modules.dart';
import 'package:relearner/pages/dashboard_page.dart';
import 'package:relearner/pages/home_page.dart';
import 'package:relearner/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReLearner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        useMaterial3: true,
        primaryColor: themeColor 
      ),
      home: const LandingPage(),
    );
  }
}



class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;
  final BottomNavigationBarType _bottomNavType = BottomNavigationBarType.shifting;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('reLearner',style: bannerTextStyle,)),
      drawer: const AppDrawer(),
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[
            HomePage(),
            const DashboardPage(),
            const ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 23, 108, 255),
          unselectedItemColor: const Color(0xff757575),
          type: _bottomNavType,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: _navBarItems),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            DrawerHeader(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.blueAccent, // background color
                  backgroundColor: Colors.white, // foreground color
                ),
                onPressed: () {
                  Navigator.pop(context);
                  //Navigator.pushNamed(context, '/profilepage');
                },
                child: const Icon(
                  Icons.person,
                  size: 45,
                ),
              ),
            ),
            // Categories with Dropdown
            
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                // go to settings page
               
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                //log user out
               
              },
            ),
          ],
        ),
      ),
    );
  }
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.work_outline_rounded),
    activeIcon: Icon(Icons.work_rounded),
    label: 'Dashboard',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
];

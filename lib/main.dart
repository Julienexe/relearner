import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relearner/appState/appState.dart';
import 'package:relearner/modules/general_modules.dart';
import 'package:relearner/pages/account_type.dart';
import 'package:relearner/pages/dashboard_page.dart';
import 'package:relearner/pages/home_page.dart';
import 'package:relearner/pages/login_page.dart';
import 'package:relearner/pages/module_detail.dart';
import 'package:relearner/pages/profile_page.dart';
import 'package:relearner/pages/register_page.dart';

late AppState appState;
void main() async {
  appState = AppState();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ReLearner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        useMaterial3: true,
        primaryColor: themeColor,
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const LandingPage(),
        '/register': (context) => const RegisterPage(),
        '/account': (context) => const AccountTypeSelection(),
        '/course': (context) => const LearningPage(),
      },
      home: const Relearner(),
    );
  }
}

class Relearner extends StatelessWidget {
  const Relearner({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => appState,
      child: FutureBuilder(
        future: appState.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return appState.currentUser != null
                ? const LandingPage()
                : const LoginPage();
          }else{
            return const Scaffold(
              body:
            Center(child: CircularProgressIndicator()),
              ) ;
          }
        },
      ),
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
  final BottomNavigationBarType _bottomNavType =
      BottomNavigationBarType.shifting;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'reLearner',
        style: bannerTextStyle,
      )),
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
                appState.logoutSequence(context);
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

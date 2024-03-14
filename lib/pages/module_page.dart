import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mycityapp/pages/util/my_tab.dart';
import 'package:mycityapp/tab/home_tab.dart';

import '../tab/learningtab.dart';
import '../tab/schedulingtab.dart';
import '../tab/trackingtab.dart';

class ModulePage extends StatefulWidget {
  ModulePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;
//sign user out method
  void drawer() {}
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  State<ModulePage> createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  // my tabs
  List<Widget> myTabs = const [
    // Tracking tab
    MyTab(
      iconPath: 'lib/icons/Home.png',
    ),

    // Tracking tab
    MyTab(
      iconPath: 'lib/icons/Tracking.png',
    ),

    // Scheduling tab
    MyTab(
      iconPath: 'lib/icons/Scheduling.png',
    ),

    // Learning tab
    MyTab(
      iconPath: 'lib/icons/Learning.png',
    ),
  ];
  //sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0,
          // leading: Padding(
          //   padding: const EdgeInsets.only(left: 20.0),
          //   child: IconButton(
          //     // ignore: prefer_const_constructors
          //     icon: Icon(
          //       Icons.menu,
          //       color: const Color.fromARGB(255, 56, 55, 55),
          //       size: 36,
          //     ),
          //     onPressed: () {
          //       // open drawer
          //     },
          //   ),
          // ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 36,
                ),
                onPressed: () {
                  // account button tapped
                },
              ),
            ),
            IconButton(
                onPressed: signUserOut,
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.indigo,
            child: ListView(
              children: [
                const DrawerHeader(
                  child: Text(
                    ' Trashtrek',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.white),
                  title: const Text(
                    'Home',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeTab()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.white),
                  title: const Text(
                    'Profile',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeTab()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.white),
                  title: const Text(
                    'Rewards',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeTab()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Support',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomeTab()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
              child: Row(
                children: [
                  Text(
                    'Welcome to ',
                    style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                  ),
                  const Text(
                    ' Trashtrek',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // tab bar view
            const Expanded(
              child: TabBarView(
                children: [
                  //Home Page
                  HomeTab(),
                  // Tracking page
                  TrackingTab(),

                  // Scheduuling page
                  SchedulingTab(),

                  // Learning page
                  LearningTab(),
                ],
              ),
            ),

            // tab bar
            TabBar(tabs: myTabs),
          ],
        ),
      ),
    );
  }
}

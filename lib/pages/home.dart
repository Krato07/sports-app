import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/models/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

List<Category> categories = [];

void _getCategories() {
  categories = Category.getCategories();
}

class _HomePageState extends State<HomePage> {
  String selectedPage = '';

  void logout() {
    print("logout");
    Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(),
        drawer: _drawer(),
        body: Column(
          children: [_tabBar()],
        ),
      ),
    );
  }

  DefaultTabController _tabBar() {
    return DefaultTabController(
      length: categories.length,
      child: TabBar(
        labelPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        indicatorSize: TabBarIndicatorSize
            .tab, // Set the indicator size to match the label width
        indicatorColor: const Color.fromARGB(255, 0, 154, 100),
        labelColor: const Color.fromARGB(255, 0, 154, 100),
        tabs: categories.map((category) {
          return Tab(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  category.icon,
                  size: 26.0,
                ),
                const SizedBox(height: 5.0),
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Drawer _drawer() {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      elevation: 20.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 90, 94, 98),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      CupertinoIcons.profile_circled,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 70.0,
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Paramaguru",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                        Text(
                          "guru@example.com",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TextButton(
                  onPressed: logout,
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 208, 255, 0),
                    ),
                  ),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard_outlined),
            title: const Text('Dashboard'),
            onTap: () {
              setState(() {
                selectedPage = 'Messages';
                Navigator.of(context).pop();
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.games),
            title: const Text('Tournaments'),
            onTap: () {
              setState(() {
                selectedPage = 'Profile';
                Navigator.of(context).pop();
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Groups'),
            onTap: () {
              setState(() {
                selectedPage = 'Settings';
                Navigator.of(context).pop();
              });
            },
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(248, 46, 42, 42),
      elevation: 20.0,
      centerTitle: true,
      title: const Text(
        "PTW",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
          color: Colors.white,
        ),
      ),
      leading: IconTheme(
        data: const IconThemeData(
          size: 30.0,
          color: Colors.white,
        ),
        child: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
    );
  }
}

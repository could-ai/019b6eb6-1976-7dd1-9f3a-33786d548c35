import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/services_screen.dart';
import 'screens/circuits_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const TourismApp());
}

class TourismApp extends StatelessWidget {
  const TourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourisme Voyage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00695C)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainLayout(child: HomeScreen()),
        '/services': (context) => const MainLayout(child: ServicesScreen()),
        '/circuits': (context) => const MainLayout(child: CircuitsScreen()),
        '/about': (context) => const MainLayout(child: AboutScreen()),
        '/contact': (context) => const MainLayout(child: ContactScreen()),
      },
    );
  }
}

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tourisme Évasion'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: MediaQuery.of(context).size.width > 600
            ? [
                _NavBarItem(title: 'Accueil', route: '/'),
                _NavBarItem(title: 'Services', route: '/services'),
                _NavBarItem(title: 'Circuits', route: '/circuits'),
                _NavBarItem(title: 'À propos', route: '/about'),
                _NavBarItem(title: 'Contact', route: '/contact'),
                const SizedBox(width: 20),
              ]
            : null,
      ),
      drawer: MediaQuery.of(context).size.width <= 600
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Text(
                      'Menu',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  _DrawerItem(icon: Icons.home, title: 'Accueil', route: '/'),
                  _DrawerItem(icon: Icons.room_service, title: 'Services', route: '/services'),
                  _DrawerItem(icon: Icons.map, title: 'Circuits', route: '/circuits'),
                  _DrawerItem(icon: Icons.info, title: 'À propos', route: '/about'),
                  _DrawerItem(icon: Icons.contact_mail, title: 'Contact', route: '/contact'),
                ],
              ),
            )
          : null,
      body: child,
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final String route;

  const _NavBarItem({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushReplacementNamed(context, route),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;

  const _DrawerItem({required this.icon, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close drawer
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }
}

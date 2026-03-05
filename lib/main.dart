import 'package:flutter/material.dart';
import 'package:zendrive_mobile/config/theme.dart';
import 'package:zendrive_mobile/screens/home_screen.dart';
import 'package:zendrive_mobile/screens/login_screen.dart';
import 'package:zendrive_mobile/screens/register_screen.dart';
import 'package:zendrive_mobile/screens/booking_screen.dart';
import 'package:zendrive_mobile/screens/fleet_screen.dart';
import 'package:zendrive_mobile/screens/excursions_screen.dart';
import 'package:zendrive_mobile/screens/contact_screen.dart';
import 'package:zendrive_mobile/screens/client/dashboard_screen.dart';
import 'package:zendrive_mobile/screens/client/reservations_screen.dart';
import 'package:zendrive_mobile/screens/client/profile_screen.dart';

void main() {
  runApp(const ZenDriveApp());
}

class ZenDriveApp extends StatelessWidget {
  const ZenDriveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZenDrive',
      debugShowCheckedModeBanner: false,
      theme: ZenDriveTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/booking': (context) => const BookingScreen(),
        '/fleet': (context) => const FleetScreen(),
        '/excursions': (context) => const ExcursionsScreen(),
        '/contact': (context) => const ContactScreen(),
        '/dashboard': (context) => const ClientDashboardScreen(),
        '/reservations': (context) => const ReservationsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

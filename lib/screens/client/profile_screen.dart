import 'package:flutter/material.dart';
import 'package:zendrive_mobile/config/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          const CircleAvatar(radius: 50, backgroundColor: ZenDriveTheme.accent, child: Icon(Icons.person, size: 50, color: ZenDriveTheme.primary)),
          const SizedBox(height: 16),
          const Text('Client ZenDrive', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const Text('client@zendrive.tn', style: TextStyle(color: ZenDriveTheme.textSecondary)),
          const SizedBox(height: 32),
          const TextField(decoration: InputDecoration(labelText: 'Prenom', prefixIcon: Icon(Icons.person_outline))),
          const SizedBox(height: 16),
          const TextField(decoration: InputDecoration(labelText: 'Nom', prefixIcon: Icon(Icons.person_outline))),
          const SizedBox(height: 16),
          const TextField(decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined))),
          const SizedBox(height: 16),
          const TextField(decoration: InputDecoration(labelText: 'Telephone', prefixIcon: Icon(Icons.phone_outlined))),
          const SizedBox(height: 32),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Sauvegarder'))),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Navigator.pushReplacementNamed(context, '/'), style: OutlinedButton.styleFrom(foregroundColor: Colors.red), child: const Text('Deconnexion'))),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zendrive_mobile/config/theme.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inscription')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text('Creer un compte', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Rejoignez ZenDrive', style: TextStyle(color: ZenDriveTheme.textSecondary)),
          const SizedBox(height: 32),
          const Row(children: [Expanded(child: TextField(decoration: InputDecoration(labelText: 'Prenom', prefixIcon: Icon(Icons.person_outline)))), SizedBox(width: 12), Expanded(child: TextField(decoration: InputDecoration(labelText: 'Nom', prefixIcon: Icon(Icons.person_outline))))]),
          const SizedBox(height: 16),
          const TextField(keyboardType: TextInputType.emailAddress, decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined))),
          const SizedBox(height: 16),
          const TextField(keyboardType: TextInputType.phone, decoration: InputDecoration(labelText: 'Telephone', prefixIcon: Icon(Icons.phone_outlined))),
          const SizedBox(height: 16),
          const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Mot de passe', prefixIcon: Icon(Icons.lock_outline))),
          const SizedBox(height: 16),
          const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Confirmer', prefixIcon: Icon(Icons.lock_outline))),
          const SizedBox(height: 32),
          ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context, '/login'), child: const Text('Inscription')),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('Deja un compte ? '), TextButton(onPressed: () => Navigator.pushNamed(context, '/login'), child: const Text('Se connecter'))]),
        ]),
      ),
    );
  }
}

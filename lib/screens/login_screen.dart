import 'package:flutter/material.dart';
import 'package:zendrive_mobile/config/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(height: 60),
            const Icon(Icons.directions_car, size: 64, color: ZenDriveTheme.primary),
            const SizedBox(height: 16),
            const Text('Connexion', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Bienvenue sur ZenDrive', textAlign: TextAlign.center, style: TextStyle(color: ZenDriveTheme.textSecondary)),
            const SizedBox(height: 40),
            const TextField(keyboardType: TextInputType.emailAddress, decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined))),
            const SizedBox(height: 16),
            TextField(obscureText: _obscure, decoration: InputDecoration(labelText: 'Mot de passe', prefixIcon: const Icon(Icons.lock_outline), suffixIcon: IconButton(icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility), onPressed: () => setState(() => _obscure = !_obscure)))),
            const SizedBox(height: 8),
            Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () {}, child: const Text('Mot de passe oublie ?'))),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () => Navigator.pushReplacementNamed(context, '/dashboard'), child: const Text('Se connecter')),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('Pas encore de compte ? '), TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: const Text('Inscription'))]),
          ]),
        ),
      ),
    );
  }
}

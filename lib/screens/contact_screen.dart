import 'package:flutter/material.dart';
import 'package:zendrive_mobile/config/theme.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Contactez-nous', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          _contactTile(Icons.phone, 'Telephone', '+216 XX XXX XXX'),
          _contactTile(Icons.email, 'Email', 'contact@zendrive.tn'),
          _contactTile(Icons.location_on, 'Adresse', 'Tunis, Tunisie'),
          _contactTile(Icons.access_time, 'Horaires', '24h/24 - 7j/7'),
          const SizedBox(height: 32),
          const Text('Envoyez-nous un message', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const TextField(decoration: InputDecoration(labelText: 'Nom complet', prefixIcon: Icon(Icons.person_outline))),
          const SizedBox(height: 12),
          const TextField(decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined))),
          const SizedBox(height: 12),
          const TextField(decoration: InputDecoration(labelText: 'Sujet', prefixIcon: Icon(Icons.subject))),
          const SizedBox(height: 12),
          const TextField(maxLines: 4, decoration: InputDecoration(labelText: 'Message', alignLabelWithHint: true)),
          const SizedBox(height: 24),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Envoyer'))),
        ]),
      ),
    );
  }

  Widget _contactTile(IconData icon, String title, String value) => ListTile(
    leading: Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: ZenDriveTheme.accent, borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: ZenDriveTheme.primary)),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text(value),
  );
}

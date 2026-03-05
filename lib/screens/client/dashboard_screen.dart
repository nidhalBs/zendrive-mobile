import 'package:flutter/material.dart';
import 'package:zendrive_mobile/config/theme.dart';

class ClientDashboardScreen extends StatelessWidget {
  const ClientDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon Espace')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Card(child: Padding(padding: const EdgeInsets.all(20), child: Row(children: [
            const CircleAvatar(radius: 30, backgroundColor: ZenDriveTheme.accent, child: Icon(Icons.person, size: 30, color: ZenDriveTheme.primary)),
            const SizedBox(width: 16),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Bienvenue !', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text('client@zendrive.tn', style: TextStyle(color: ZenDriveTheme.textSecondary))])),
          ]))),
          const SizedBox(height: 16),
          Row(children: [
            _statCard('Reservations', '12', Icons.book_online),
            const SizedBox(width: 12),
            _statCard('Points', '850', Icons.stars),
          ]),
          const SizedBox(height: 24),
          const Text('Actions rapides', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _actionTile(context, Icons.add_circle, 'Nouvelle reservation', '/booking'),
          _actionTile(context, Icons.list_alt, 'Mes reservations', '/reservations'),
          _actionTile(context, Icons.person, 'Mon profil', '/profile'),
          _actionTile(context, Icons.star, 'Programme fidelite', '/'),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (i) {
          switch (i) {
            case 1: Navigator.pushNamed(context, '/reservations'); break;
            case 2: Navigator.pushNamed(context, '/booking'); break;
            case 3: Navigator.pushNamed(context, '/profile'); break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Reservations'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Reserver'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  Widget _statCard(String title, String value, IconData icon) => Expanded(child: Card(child: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
    Icon(icon, color: ZenDriveTheme.primary, size: 32),
    const SizedBox(height: 8),
    Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ZenDriveTheme.primary)),
    Text(title, style: const TextStyle(color: ZenDriveTheme.textSecondary)),
  ]))));

  Widget _actionTile(BuildContext ctx, IconData icon, String title, String route) => Card(
    margin: const EdgeInsets.only(bottom: 8),
    child: ListTile(
      leading: Icon(icon, color: ZenDriveTheme.primary),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Navigator.pushNamed(ctx, route),
    ),
  );
}

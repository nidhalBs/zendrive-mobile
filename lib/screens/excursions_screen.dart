import 'package:flutter/material.dart';
import 'package:zendrive_mobile/config/theme.dart';

class ExcursionsScreen extends StatelessWidget {
  const ExcursionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final excursions = [
      {'name': 'Carthage & Sidi Bou Said', 'duration': '4h', 'price': '120 TND', 'icon': Icons.temple_hindu},
      {'name': 'Sahara Express', 'duration': '2 jours', 'price': '450 TND', 'icon': Icons.landscape},
      {'name': 'Cap Bon Tour', 'duration': '6h', 'price': '180 TND', 'icon': Icons.beach_access},
      {'name': 'Dougga & Bulla Regia', 'duration': '8h', 'price': '200 TND', 'icon': Icons.account_balance},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Excursions')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: excursions.length,
        itemBuilder: (context, i) {
          final e = excursions[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(height: 150, width: double.infinity, decoration: BoxDecoration(color: ZenDriveTheme.accent, borderRadius: BorderRadius.circular(12)), child: Icon(e['icon'] as IconData, size: 64, color: ZenDriveTheme.primary)),
              const SizedBox(height: 16),
              Text(e['name'] as String, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(children: [const Icon(Icons.schedule, size: 16, color: ZenDriveTheme.textSecondary), const SizedBox(width: 4), Text(e['duration'] as String, style: const TextStyle(color: ZenDriveTheme.textSecondary)), const Spacer(), Text(e['price'] as String, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: ZenDriveTheme.primary))]),
              const SizedBox(height: 16),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/booking'), child: const Text('Reserver'))),
            ])),
          );
        },
      ),
    );
  }
}

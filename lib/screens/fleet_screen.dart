import 'package:flutter/material.dart';
import 'package:zendrive_mobile/config/theme.dart';

class FleetScreen extends StatelessWidget {
  const FleetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vehicles = [
      {'name': 'Berline Confort', 'brand': 'Mercedes Classe E', 'p': 3, 'icon': Icons.directions_car},
      {'name': 'Van Premium', 'brand': 'Mercedes Vito', 'p': 7, 'icon': Icons.airport_shuttle},
      {'name': 'Minibus', 'brand': 'Mercedes Sprinter', 'p': 15, 'icon': Icons.directions_bus},
      {'name': 'SUV Luxe', 'brand': 'BMW X5', 'p': 4, 'icon': Icons.directions_car},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Notre Flotte')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: vehicles.length,
        itemBuilder: (context, i) {
          final v = vehicles[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(height: 120, width: double.infinity, decoration: BoxDecoration(color: ZenDriveTheme.accent, borderRadius: BorderRadius.circular(12)), child: Icon(v['icon'] as IconData, size: 64, color: ZenDriveTheme.primary)),
              const SizedBox(height: 16),
              Text(v['name'] as String, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(v['brand'] as String, style: const TextStyle(color: ZenDriveTheme.textSecondary)),
              const SizedBox(height: 12),
              Row(children: [_chip(Icons.people, '${v["p"]} places'), const SizedBox(width: 8), _chip(Icons.ac_unit, 'Climatise')]),
              const SizedBox(height: 16),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/booking'), child: const Text('Reserver'))),
            ])),
          );
        },
      ),
    );
  }

  Widget _chip(IconData icon, String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(color: ZenDriveTheme.accent, borderRadius: BorderRadius.circular(20)),
    child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 16, color: ZenDriveTheme.primary), const SizedBox(width: 4), Text(label, style: const TextStyle(fontSize: 12, color: ZenDriveTheme.primaryDark))]),
  );
}

import 'package:flutter/material.dart';
import 'package:zendrive_mobile/config/theme.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reservations = [
      {'ref': 'ZD-2026-001', 'route': 'Aeroport Tunis -> Hotel', 'date': '15/03/2026', 'status': 'CONFIRMED', 'amount': '45 TND'},
      {'ref': 'ZD-2026-002', 'route': 'Hotel -> Carthage', 'date': '16/03/2026', 'status': 'PENDING', 'amount': '35 TND'},
      {'ref': 'ZD-2025-089', 'route': 'Sousse -> Tunis', 'date': '20/01/2026', 'status': 'COMPLETED', 'amount': '120 TND'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Mes Reservations')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reservations.length,
        itemBuilder: (context, i) {
          final r = reservations[i];
          Color statusColor = r['status'] == 'CONFIRMED' ? Colors.green : r['status'] == 'PENDING' ? Colors.orange : ZenDriveTheme.textSecondary;
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [Text(r['ref']!, style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'monospace')), const Spacer(), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)), child: Text(r['status']!, style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold)))]),
              const SizedBox(height: 8),
              Text(r['route']!, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 4),
              Row(children: [const Icon(Icons.calendar_today, size: 14, color: ZenDriveTheme.textSecondary), const SizedBox(width: 4), Text(r['date']!, style: const TextStyle(color: ZenDriveTheme.textSecondary)), const Spacer(), Text(r['amount']!, style: const TextStyle(fontWeight: FontWeight.bold, color: ZenDriveTheme.primary))]),
            ])),
          );
        },
      ),
    );
  }
}

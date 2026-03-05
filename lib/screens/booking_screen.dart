import 'package:flutter/material.dart';
import 'package:zendrive_mobile/config/theme.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _step = 0;
  String _vehicle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservation')),
      body: Stepper(
        currentStep: _step,
        onStepContinue: () { if (_step < 3) setState(() => _step++); },
        onStepCancel: () { if (_step > 0) setState(() => _step--); },
        steps: [
          Step(title: const Text('Trajet'), isActive: _step >= 0, content: Column(children: [
            TextField(decoration: InputDecoration(labelText: 'Depart', prefixIcon: const Icon(Icons.location_on, color: ZenDriveTheme.primary), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            const SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'Destination', prefixIcon: const Icon(Icons.flag, color: ZenDriveTheme.primary), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            const SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'Date et heure', prefixIcon: const Icon(Icons.calendar_today, color: ZenDriveTheme.primary), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
          ])),
          Step(title: const Text('Vehicule'), isActive: _step >= 1, content: Column(children: [
            _vCard('Berline Confort', '3 places', '45 TND', Icons.directions_car),
            _vCard('Van Premium', '7 places', '75 TND', Icons.airport_shuttle),
            _vCard('Minibus', '15 places', '120 TND', Icons.directions_bus),
          ])),
          Step(title: const Text('Options'), isActive: _step >= 2, content: Column(children: [
            CheckboxListTile(value: false, onChanged: (_) {}, title: const Text('Siege bebe (+10 TND)')),
            CheckboxListTile(value: false, onChanged: (_) {}, title: const Text('WiFi a bord (+5 TND)')),
            CheckboxListTile(value: false, onChanged: (_) {}, title: const Text('Bouteilles eau (Gratuit)')),
          ])),
          Step(title: const Text('Confirmation'), isActive: _step >= 3, content: Card(
            child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Resume', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              _row('Vehicule', _vehicle.isEmpty ? 'Berline Confort' : _vehicle),
              _row('Total', '45 TND'),
            ])),
          )),
        ],
      ),
    );
  }

  Widget _vCard(String name, String cap, String price, IconData icon) {
    return Card(
      color: _vehicle == name ? ZenDriveTheme.accent : null,
      child: ListTile(
        leading: Icon(icon, color: ZenDriveTheme.primary, size: 36),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(cap),
        trailing: Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: ZenDriveTheme.primary)),
        onTap: () => setState(() => _vehicle = name),
      ),
    );
  }

  Widget _row(String l, String v) => Padding(padding: const EdgeInsets.symmetric(vertical: 4), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(l), Text(v, style: const TextStyle(fontWeight: FontWeight.bold))]));
}

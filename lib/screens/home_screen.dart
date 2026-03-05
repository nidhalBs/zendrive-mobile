import 'package:flutter/material.dart';
import 'package:zendrive_mobile/config/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('ZenDrive', style: TextStyle(fontWeight: FontWeight.bold)),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [ZenDriveTheme.primary, ZenDriveTheme.primaryDark],
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_car, size: 64, color: Colors.white),
                      SizedBox(height: 16),
                      Text('Votre transfert premium en Tunisie',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBookingCard(context),
                  const SizedBox(height: 32),
                  const Text('Nos Services', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildServiceGrid(),
                  const SizedBox(height: 32),
                  const Text('Pourquoi ZenDrive ?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildFeatureList(),
                  const SizedBox(height: 32),
                  _buildCTASection(context),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 1: Navigator.pushNamed(context, '/fleet'); break;
            case 2: Navigator.pushNamed(context, '/booking'); break;
            case 3: Navigator.pushNamed(context, '/contact'); break;
            case 4: Navigator.pushNamed(context, '/login'); break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Flotte'),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Réserver'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contact'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Compte'),
        ],
      ),
    );
  }

  Widget _buildBookingCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text('Réservez votre transfert',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Point de départ',
                prefixIcon: const Icon(Icons.location_on, color: ZenDriveTheme.primary),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Destination',
                prefixIcon: const Icon(Icons.flag, color: ZenDriveTheme.primary),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      prefixIcon: const Icon(Icons.calendar_today, color: ZenDriveTheme.primary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Passagers',
                      prefixIcon: const Icon(Icons.people, color: ZenDriveTheme.primary),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/booking'),
                child: const Text('Rechercher'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceGrid() {
    final services = [
      {'icon': Icons.airport_shuttle, 'title': 'Transfert Aéroport', 'desc': 'Service porte-à-porte'},
      {'icon': Icons.explore, 'title': 'Excursions', 'desc': 'Découvrez la Tunisie'},
      {'icon': Icons.business, 'title': 'VIP & Business', 'desc': 'Service premium'},
      {'icon': Icons.groups, 'title': 'Groupes', 'desc': 'Jusqu\'à 50 personnes'},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.1,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final s = services[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(s['icon'] as IconData, size: 40, color: ZenDriveTheme.primary),
                const SizedBox(height: 12),
                Text(s['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                const SizedBox(height: 4),
                Text(s['desc'] as String, style: const TextStyle(fontSize: 12, color: ZenDriveTheme.textSecondary), textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFeatureList() {
    final features = [
      {'icon': Icons.verified, 'text': 'Chauffeurs professionnels certifiés'},
      {'icon': Icons.access_time, 'text': 'Disponible 24h/24, 7j/7'},
      {'icon': Icons.shield, 'text': 'Véhicules assurés et climatisés'},
      {'icon': Icons.star, 'text': 'Programme de fidélité avantageux'},
    ];
    return Column(
      children: features.map((f) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ZenDriveTheme.accent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(f['icon'] as IconData, color: ZenDriveTheme.primary),
            ),
            const SizedBox(width: 16),
            Expanded(child: Text(f['text'] as String, style: const TextStyle(fontSize: 16))),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildCTASection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [ZenDriveTheme.primary, ZenDriveTheme.primaryDark]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text('Prêt à voyager ?', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Créez votre compte et profitez de nos offres', style: TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/register'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: ZenDriveTheme.primary),
            child: const Text('S\'inscrire maintenant'),
          ),
        ],
      ),
    );
  }
}

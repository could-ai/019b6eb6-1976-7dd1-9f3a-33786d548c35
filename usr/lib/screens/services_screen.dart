import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'title': 'Réservation de Vols',
        'icon': Icons.flight,
        'desc': 'Nous trouvons les meilleurs vols aux meilleurs prix pour toutes vos destinations.'
      },
      {
        'title': 'Hébergement',
        'icon': Icons.hotel,
        'desc': 'Des hôtels de luxe aux auberges de charme, nous avons ce qu\'il vous faut.'
      },
      {
        'title': 'Guides Touristiques',
        'icon': Icons.person_pin_circle,
        'desc': 'Des guides locaux passionnés pour vous faire découvrir les secrets de chaque lieu.'
      },
      {
        'title': 'Location de Voiture',
        'icon': Icons.directions_car,
        'desc': 'Louez un véhicule adapté à vos besoins pour explorer en toute liberté.'
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Nos Services',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                      child: Icon(service['icon'] as IconData, color: Theme.of(context).colorScheme.primary),
                    ),
                    title: Text(service['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(service['desc'] as String),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

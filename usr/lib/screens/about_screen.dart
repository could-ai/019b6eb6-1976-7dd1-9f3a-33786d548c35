import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              const Icon(Icons.travel_explore, size: 100, color: Colors.teal),
              const SizedBox(height: 20),
              Text(
                'À Propos de Tourisme Évasion',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Text(
                'Notre mission est de rendre le voyage accessible et inoubliable pour tous. Fondée en 2024, notre agence s\'efforce de connecter les voyageurs aux expériences les plus authentiques à travers le monde.',
                style: TextStyle(fontSize: 18, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'Nous croyons en un tourisme responsable et durable. Chaque circuit est conçu pour respecter l\'environnement et soutenir les communautés locales.',
                style: TextStyle(fontSize: 18, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 20),
              Text('Notre Équipe', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: const [
                  _TeamMember(name: 'Sophie Martin', role: 'Directrice'),
                  _TeamMember(name: 'Jean Dupont', role: 'Guide Chef'),
                  _TeamMember(name: 'Marie Curie', role: 'Logistique'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamMember extends StatelessWidget {
  final String name;
  final String role;

  const _TeamMember({required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey.shade300,
          child: Text(name[0], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(role, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

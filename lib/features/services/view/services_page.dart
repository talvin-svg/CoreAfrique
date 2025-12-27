import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Services page - Display all services
class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Services Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go to Home'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go('/about'),
              child: const Text('Go to About'),
            ),
          ],
        ),
      ),
    );
  }
}


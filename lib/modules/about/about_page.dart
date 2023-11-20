import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 8,
        leading: const Icon(Icons.flutter_dash),
        title: const Text('PROFESSORA DRIKA'),
        actions: [
          TextButton(
            onPressed: () => Modular.to.navigate('/'),
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () => Modular.to.navigate('/about/'),
            child: const Text('Sobre'),
          ),
          TextButton(
            onPressed: () => Modular.to.navigate('/lessons/'),
            child: const Text('Lições'),
          ),
          TextButton(
            onPressed: () => Modular.to.navigate('/students/'),
            child: const Text('Alunos'),
          ),
          TextButton(
            onPressed: () => Modular.to.navigate('/auth/'),
            child: const Text('Login'),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Text('about'),
        ),
      ),
    );
  }
}
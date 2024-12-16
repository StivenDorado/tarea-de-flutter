import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardTheme: CardTheme(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      home: const Opciones(),
    );
  }
}

class Opciones extends StatelessWidget {
  const Opciones({Key? key}) : super(key: key);

  final List<MenuOption> options = const [
    MenuOption(
      title: 'Consultas', 
      screen: OptionScreen(title: 'Consultas'), 
      icon: Icons.medical_services_outlined,
      color: Colors.blue,
    ),
    MenuOption(
      title: 'Emergencias', 
      screen: OptionScreen(title: 'Emergencias'), 
      icon: Icons.emergency_outlined,
      color: Colors.red,
    ),
    MenuOption(
      title: 'Laboratorio', 
      screen: OptionScreen(title: 'Laboratorio'), 
      icon: Icons.science_outlined,
      color: Colors.green,
    ),
    MenuOption(
      title: 'Especialistas', 
      screen: OptionScreen(title: 'Especialistas'), 
      icon: Icons.people_outline,
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Servicios Hospitalarios',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimationLimiter(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.0,
            ),
            itemCount: options.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: 2,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: _buildOptionCard(context, options[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context, MenuOption option) {
    return Card(
      color: option.color.withOpacity(0.1),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => option.screen,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              option.icon,
              size: 60,
              color: option.color,
            ),
            const SizedBox(height: 10),
            Text(
              option.title,
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                color: option.color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class OptionScreen extends StatelessWidget {
  final String title;

  const OptionScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido a $title',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Aquí encontrarás toda la información relevante',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuOption {
  final String title;
  final Widget screen;
  final IconData icon;
  final Color color;

  const MenuOption({
    required this.title, 
    required this.screen, 
    required this.icon,
    required this.color,
  });
}
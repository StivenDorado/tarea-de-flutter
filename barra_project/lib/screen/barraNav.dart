import 'package:flutter/material.dart';

class BarraNav extends StatefulWidget {
  const BarraNav({Key? key}) : super(key: key);

  @override
  State<BarraNav> createState() => _BarraNavState();
}

class _BarraNavState extends State<BarraNav> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "App TabBar", 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple, // Color de fondo personalizado
        elevation: 4, // Sombra sutil
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white, // Color del indicador
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(
              icon: Icon(Icons.home_rounded), 
              text: "Inicio",
            ),
            Tab(
              icon: Icon(Icons.message_rounded), 
              text: "Mensajes",
            ),
            Tab(
              icon: Icon(Icons.person_rounded), 
              text: "Perfil",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text(
              "Inicio", 
              style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Center(
            child: Text(
              "Mensajes", 
              style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Center(
            child: Text(
              "Perfil", 
              style: TextStyle(
                fontSize: 24,
                color: Colors.deepPurple[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
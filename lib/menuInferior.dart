import 'package:flutter/material.dart';
import 'package:proyecto_electiva/productoForm.dart';

class menuInferior extends StatefulWidget {
  const menuInferior({super.key});

  @override
  State<StatefulWidget> createState() {
    return _menuInferiorState();
  }
}

class _menuInferiorState extends State<menuInferior> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProductoForm(),
    const Text('Screen 2'),
    const Text('Screen 3'),
    const Text('Screen 4'),
    const Text('Screen 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Menu Inferior",
      theme: ThemeData(
        // Estilos globales para el menú inferior
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor:
              Color.fromARGB(255, 10, 10, 10), // Color del ícono seleccionado
          unselectedItemColor: Colors.grey, // Color del ícono no seleccionado
          backgroundColor: Color.fromARGB(
              255, 74, 86, 190), // Color de fondo del menú inferior
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title:
              const Text('Ferre Total', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 74, 86, 190),
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_add),
              label: 'Producto',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categoria',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}

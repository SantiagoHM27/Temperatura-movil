import 'package:flutter/material.dart';
import 'package:historial_exit/screens/frecuencia.dart';


class SaturacionOxigeno extends StatefulWidget {
  const SaturacionOxigeno({super.key});

  @override
  State<SaturacionOxigeno> createState() => _SaturacionOxigenoState();
}

class _SaturacionOxigenoState extends State<SaturacionOxigeno> {
int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pop(context);
    } else {
      switch (index) {
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const FrecuenciaCardiaca()),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informacion'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dew_point),
            label: 'Temperatura y Humedad'
          ),
          
        ],
      ),
    );
  }
}
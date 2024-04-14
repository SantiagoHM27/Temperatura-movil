import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:historial_exit/services/firebase_service.dart';
import 'package:historial_exit/screens/saturacion.dart';

class FrecuenciaCardiaca extends StatefulWidget {
  const FrecuenciaCardiaca({super.key});

  @override
  State<FrecuenciaCardiaca> createState() => _FrecuenciaCardiacaState();
}

class _FrecuenciaCardiacaState extends State<FrecuenciaCardiaca> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Si se selecciona "Inicio" (índice 0), cerrar la pantalla actual
    if (index == 0) {
      Navigator.pop(context);
    } else {
      // Navegar a las respectivas pantallas según el índice seleccionado
      switch (index) {
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SaturacionOxigeno()),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperatura y Humedad del hábitat'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: getEspData(),
        builder: ((context, snapshot){
          if ( snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index){
                return Center(child: Text(snapshot.data?[index]['Humidity']));
              },
            );
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        })
      )
      
      ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_nature),
            label: 'Información',
          ),
        ],
      ),
    );
  }
}

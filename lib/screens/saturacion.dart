import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:historial_exit/screens/info.dart';
import 'package:historial_exit/services/firebase_service.dart';
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
          case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ReptilesScreen()),
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperatura del habitat'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
  future: getEspData(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data?.length,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              // Imagen encima del Container
              Container(
                width: double.infinity, // La imagen ocupará todo el ancho disponible
                height: 200.0, // Altura fija para la imagen
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/profile-png-icon-2.png'), // Cambia a la ruta de tu imagen
                    fit: BoxFit.cover, // Cubre todo el espacio sin perder las proporciones
                  ),
                ),
              ),
              // Container con el texto y la sombra
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 500.0, // Ancho fijo del Container
                  child: Container(
                    height: 160.0, // Altura fija del Container
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.shade200, // Fondo de color del Container
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5), // Color de la sombra
                          spreadRadius: 0,
                          blurRadius: 6,
                          offset: Offset(0, 3), // Posición de la sombra
                        ),
                      ],
                    ),
                    child: Text(
                      'Temperarura: ${snapshot.data?[index]['Temperature']}° C',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  },
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
            icon: Icon(Icons.dew_point),
            label: 'Humedad'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dew_point),
            label: 'información'
          ),
          
        ],
      ),
    );
  }
}
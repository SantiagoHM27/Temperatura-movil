import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
       body: FutureBuilder(
        future: getEspData(),
        builder: ((context, snapshot){
          if ( snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index){
                return Center(child: Text(snapshot.data?[index]['Temperature']));
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
            icon: Icon(Icons.dew_point),
            label: 'Temperatura y Humedad'
          ),
          
        ],
      ),
    );
  }
}
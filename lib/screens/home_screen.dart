import 'package:flutter/material.dart';
import 'package:historial_exit/screens/frecuencia.dart';
import 'package:historial_exit/screens/saturacion.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitor de temperatura'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'CodeCrafters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          
            ListTile(
              title: const Text('Humedad'),
              onTap: () {
                Navigator.pop(context); // Cerrar el Drawer
                final ruta2 = MaterialPageRoute(builder: (context) {
                  return const FrecuenciaCardiaca();
                });
                Navigator.push(context, ruta2);
              },
            ),
            ListTile(
              title: const Text('Temperatura'),
              onTap: () {
                Navigator.pop(context); // Cerrar el Drawer
                final ruta3 = MaterialPageRoute(builder: (context) {
                  return const SaturacionOxigeno();
                });
                Navigator.push(context, ruta3);
              },
            ),
            ListTile(
              title: const Text('Salir'),
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);//modificar esta linea para que nos mande al login al dar clic
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text(
              'Humedad',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            subtitle: const Text(
              'Monitorea la humedad de tu habitat',
              style: TextStyle(color: Color.fromARGB(181, 0, 0, 0)),
            ),
            leading: const Icon(
              Icons.dew_point,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            trailing: const Icon(
              Icons.arrow_right_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onTap: () {
              final ruta1 = MaterialPageRoute(builder: (context) {
                return const FrecuenciaCardiaca();
              });
              Navigator.push(context, ruta1);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Temperatura',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            subtitle: const Text(
              'Monitorea la temperatura de tu habitat',
              style: TextStyle(color: Color.fromARGB(181, 0, 0, 0)),
            ),
            leading: const Icon(
              Icons.emoji_nature,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            trailing: const Icon(
              Icons.arrow_right_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            onTap: () {
              final ruta2 = MaterialPageRoute(builder: (context) {
                return const SaturacionOxigeno();
              });
              Navigator.push(context, ruta2);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}

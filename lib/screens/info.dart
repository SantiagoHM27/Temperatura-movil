import 'package:flutter/material.dart';
import 'package:historial_exit/screens/frecuencia.dart';
import 'package:historial_exit/screens/saturacion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reptiles Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReptilesScreen(),
    );
  }
}

class ReptilesScreen extends StatefulWidget {
  @override
  _ReptilesScreenState createState() => _ReptilesScreenState();
}

class _ReptilesScreenState extends State<ReptilesScreen> {
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
            MaterialPageRoute(builder: (context) => const SaturacionOxigeno()),
          );
          break;
      }
    }
    // Aquí puedes agregar la lógica de navegación para cada índice
  }
  final String reptilesText = """
    Los reptiles son una fascinante y diversa clase de animales que incluye una amplia variedad de especies, desde geckos coloridos hasta majestuosas serpientes.

    Especies Destacadas:
    Gecko Leopardo (Eublepharis macularius): Este gecko terrestre es popular entre los aficionados por su docilidad y variadas coloraciones.
    
    Tortuga Morrocoy (Testudo graeca): Una especie de tortuga terrestre comúnmente mantenida como mascota, conocida por su longevidad y personalidad tranquila.
    
    Pitón Real (Python regius): Una serpiente no venenosa muy popular en la industria de mascotas, valorada por su belleza y comportamiento dócil.

    Otras Especies:
    Iguana Verde (Iguana iguana): Una iguana arbórea que requiere un hábitat espacioso y una dieta rica en vegetales.
    
    Tortuga de Orejas Rojas (Trachemys scripta elegans): Una tortuga acuática popular como mascota, necesita un tanque grande con agua y una dieta equilibrada.
    
    Dragón Barbudo (Pogona vitticeps): Un lagarto de aspecto único que requiere un terrario con luz UVB y una dieta variada.

    Consejos de Cuidado:
    - Proporciona un hábitat adecuado para cada especie (terrestre, acuático o arbóreo).
    - Controla la temperatura y la humedad según las necesidades de cada reptil.
    - Investiga la dieta específica de cada especie y ofréceles alimentos frescos y variados.
    - Limpia regularmente el hábitat y proporciona escondites y lugares para tomar el sol.
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conoce a los reptiles'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          reptilesText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
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
            label: 'Humedad'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dew_point),
            label: 'Temperatura'
          ),
          
        ],
      ),
    );
  }
}



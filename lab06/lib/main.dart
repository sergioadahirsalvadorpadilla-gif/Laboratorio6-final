import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart'; // Asegúrate de tener esto en pubspec.yaml

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Acelerometer App",
      home: HomePage(),
    );
  }
}

// Cambiamos el nombre a HomePage para que coincida con lo que llama MyApp
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Inicializamos las variables
  double x = 0.0, y = 0.0, z = 0.0;

  @override
  void initState() {
    super.initState();
    // Suscripción correcta al sensor
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  // El método build DEBE estar dentro de _HomePageState para ver x, y, z
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accelerometer f-app"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // toStringAsFixed(2) limita los decimales para que no "salten" en pantalla
            Text("Eje X: ${x.toStringAsFixed(2)}", style: const TextStyle(fontSize: 20)),
            Text("Eje Y: ${y.toStringAsFixed(2)}", style: const TextStyle(fontSize: 20)),
            Text("Eje Z: ${z.toStringAsFixed(2)}", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

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


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  double x = 0.0, y = 0.0, z = 0.0;

  @override
  void initState() {
    super.initState();
    
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  
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
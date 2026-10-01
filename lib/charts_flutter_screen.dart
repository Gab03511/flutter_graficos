import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

/// Modelo simple: un Pokémon y su ataque.
class AtaquePokemon {
  final String nombre;
  final int ataque;
  final charts.Color color;

  AtaquePokemon(this.nombre, this.ataque, this.color);
}

class ChartsFlutterScreen extends StatelessWidget {
  const ChartsFlutterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos fijos por ahora (luego los reemplazamos por los de la PokéAPI).
    final datos = [
      AtaquePokemon('Bulbasaur', 49, charts.MaterialPalette.green.shadeDefault),
      AtaquePokemon(
        'Charmander',
        52,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
      AtaquePokemon('Squirtle', 48, charts.MaterialPalette.blue.shadeDefault),
    ];

    // La librería pide los datos envueltos en una "Series".
    final series = [
      charts.Series<AtaquePokemon, String>(
        id: 'Ataque',
        domainFn: (p, _) => p.nombre, // eje X
        measureFn: (p, _) => p.ataque, // eje Y
        colorFn: (p, _) => p.color,
        data: datos,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('1. Ataque de los iniciales')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 300,
          child: charts.BarChart(
            series,
            animate: true, // animación al cargar
          ),
        ),
      ),
    );
  }
}

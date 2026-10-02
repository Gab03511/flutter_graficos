import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class PokemonAtaque {
  final String nombre;
  final int ataque;
  final charts.Color color;

  PokemonAtaque(this.nombre, this.ataque, this.color);
}

class _Punto {
  final int x;
  final int y;

  _Punto(this.x, this.y);
}

Widget _pantallaBasica(String titulo, Widget grafica) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        SizedBox(height: 300, child: grafica),
      ],
    ),
  );
}

class ChartBasica01 extends StatelessWidget {
  const ChartBasica01({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Pikachu', 55, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Charizard', 84, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Bulbasaur', 49, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('Squirtle', 48, charts.MaterialPalette.blue.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Ataques',
        colorFn: (PokemonAtaque ataque, _) => ataque.color,
        domainFn: (PokemonAtaque ataque, _) => ataque.nombre,
        measureFn: (PokemonAtaque ataque, _) => ataque.ataque,
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 1: Barras',
      charts.BarChart(series, animate: true),
    );
  }
}

class ChartBasica02 extends StatelessWidget {
  const ChartBasica02({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 45),
      _Punto(2, 56),
      _Punto(3, 55),
      _Punto(4, 60),
      _Punto(5, 61),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'velocidad',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];
    return _pantallaBasica(
      'Basica 2: Lineas',
      charts.LineChart(series, animate: true),
    );
  }
}

class ChartBasica03 extends StatelessWidget {
  const ChartBasica03({super.key});

  @override
  Widget build(BuildContext context) {
    final tipos = [
      PokemonAtaque('fuego', 55, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('agua', 84, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('planta', 49, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('tierra', 48, charts.MaterialPalette.blue.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Tipos',
        colorFn: (t, _) => t.color,
        domainFn: (t, _) => t.nombre,
        measureFn: (t, _) => t.ataque,
        labelAccessorFn: (t, _) => '${t.nombre}: ${t.ataque}',
        data: tipos,
      ),
    ];

    return _pantallaBasica(
      'Basica 3: Torta',
      charts.PieChart(series, animate: true),
    );
  }
}

class ChartBasica04 extends StatelessWidget {
  const ChartBasica04({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 20),
      _Punto(2, 35),
      _Punto(3, 22),
      _Punto(4, 78),
      _Punto(5, 98),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'HP',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return _pantallaBasica(
      'Basica 4: Area',
      charts.LineChart(
        series,
        animate: true,
        defaultRenderer: charts.LineRendererConfig(
          includeArea: true,
          areaOpacity: 0.4,
        ),
      ),
    );
  }
}

class ChartBasica05 extends StatelessWidget {
  const ChartBasica05({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Pikachu', 55, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Charizard', 84, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Bulbasaur', 49, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('Squirtle', 48, charts.MaterialPalette.blue.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Ataques',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 5: Barras horizontales',
      charts.BarChart(series, animate: true, vertical: false),
    );
  }
}

class ChartBasica06 extends StatelessWidget {
  const ChartBasica06({super.key});

  @override
  Widget build(BuildContext context) {
    final hp = [
      PokemonAtaque('Pikachu', 35, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque(
        'Charizard',
        78,
        charts.MaterialPalette.yellow.shadeDefault,
      ),
      PokemonAtaque(
        'Bulbasaur',
        45,
        charts.MaterialPalette.yellow.shadeDefault,
      ),
    ];

    final ataque = [
      PokemonAtaque('Pikachu', 55, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Charizard', 84, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Bulbasaur', 49, charts.MaterialPalette.red.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'HP',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: hp,
      ),
      charts.Series<PokemonAtaque, String>(
        id: 'Ataque',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: ataque,
      ),
    ];

    return _pantallaBasica(
      'Basica 6: HP vs Ataque',
      charts.BarChart(
        series,
        animate: true,
        barGroupingType: charts.BarGroupingType.grouped,
      ),
    );
  }
}

class ChartBasica07 extends StatelessWidget {
  const ChartBasica07({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 30),
      _Punto(2, 55),
      _Punto(3, 40),
      _Punto(4, 70),
      _Punto(5, 60),
      _Punto(6, 90),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Peso vs Altura',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return _pantallaBasica(
      'Basica 7: Dispersion',
      charts.ScatterPlotChart(series, animate: true),
    );
  }
}

class ChartBasica08 extends StatelessWidget {
  const ChartBasica08({super.key});

  @override
  Widget build(BuildContext context) {
    final charmander = [
      _Punto(1, 39),
      _Punto(2, 52),
      _Punto(3, 60),
      _Punto(4, 78),
      _Punto(5, 84),
    ];

    final squirtle = [
      _Punto(1, 44),
      _Punto(2, 48),
      _Punto(3, 58),
      _Punto(4, 64),
      _Punto(5, 79),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Charmander',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: charmander,
      ),
      charts.Series<_Punto, int>(
        id: 'Squirtle',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: squirtle,
      ),
    ];

    return _pantallaBasica(
      'Basica 8: Charmander vs Squirtle',
      charts.LineChart(series, animate: true),
    );
  }
}

class ChartBasica09 extends StatelessWidget {
  const ChartBasica09({super.key});

  @override
  Widget build(BuildContext context) {
    final ataqueFisico = [
      PokemonAtaque('Pikachu', 55, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque(
        'Charizard',
        84,
        charts.MaterialPalette.yellow.shadeDefault,
      ),
      PokemonAtaque(
        'Bulbasaur',
        49,
        charts.MaterialPalette.yellow.shadeDefault,
      ),
    ];

    final ataqueEspecial = [
      PokemonAtaque('Pikachu', 50, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque(
        'Charizard',
        109,
        charts.MaterialPalette.purple.shadeDefault,
      ),
      PokemonAtaque(
        'Bulbasaur',
        65,
        charts.MaterialPalette.purple.shadeDefault,
      ),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Fisico',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: ataqueFisico,
      ),
      charts.Series<PokemonAtaque, String>(
        id: 'Especial',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: ataqueEspecial,
      ),
    ];

    return _pantallaBasica(
      'Basica 9: Ataque apilado',
      charts.BarChart(
        series,
        animate: true,
        barGroupingType: charts.BarGroupingType.stacked,
      ),
    );
  }
}

class ChartBasica10 extends StatelessWidget {
  const ChartBasica10({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Gyarados', 31, charts.MaterialPalette.lime.shadeDefault),
      PokemonAtaque('Dragonite', 90, charts.MaterialPalette.lime.shadeDefault),
      PokemonAtaque('Mewtwo', 44, charts.MaterialPalette.lime.shadeDefault),
      PokemonAtaque('Lapras', 80, charts.MaterialPalette.lime.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        labelAccessorFn: (p, _) => '${p.ataque}',
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 10: Barras',
      charts.BarChart(series, animate: true),
    );
  }
}

class ChartBasica11 extends StatelessWidget {
  const ChartBasica11({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Flareon', 100, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Onix', 72, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Rapidash', 46, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Arcanine', 73, charts.MaterialPalette.red.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 11: Barras horizontales',
      charts.BarChart(series, animate: true, vertical: false),
    );
  }
}

class ChartBasica12 extends StatelessWidget {
  const ChartBasica12({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 83),
      _Punto(2, 43),
      _Punto(3, 91),
      _Punto(4, 47),
      _Punto(5, 61),
      _Punto(6, 57),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return _pantallaBasica(
      'Basica 12: Linea',
      charts.LineChart(series, animate: true),
    );
  }
}

class ChartBasica13 extends StatelessWidget {
  const ChartBasica13({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 29),
      _Punto(2, 34),
      _Punto(3, 72),
      _Punto(4, 79),
      _Punto(5, 73),
      _Punto(6, 54),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return _pantallaBasica(
      'Basica 13: Area',
      charts.LineChart(
        series,
        animate: true,
        defaultRenderer: charts.LineRendererConfig(
          includeArea: true,
          areaOpacity: 0.4,
        ),
      ),
    );
  }
}

class ChartBasica14 extends StatelessWidget {
  const ChartBasica14({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Tierra', 9, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Fuego', 9, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('Siniestro', 6, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque(
        'Hielo',
        12,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        labelAccessorFn: (p, _) => '${p.nombre}: ${p.ataque}',
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 14: Torta',
      charts.PieChart(series, animate: true),
    );
  }
}

// Reemplazado dona problemática por Barras Verticales estables
class ChartBasica15 extends StatelessWidget {
  const ChartBasica15({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Fuego', 6, charts.MaterialPalette.indigo.shadeDefault),
      PokemonAtaque('Siniestro', 12, charts.MaterialPalette.pink.shadeDefault),
      PokemonAtaque('Hielo', 12, charts.MaterialPalette.cyan.shadeDefault),
      PokemonAtaque('Volador', 9, charts.MaterialPalette.lime.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 15: Barras (Tipos)',
      charts.BarChart(series, animate: true),
    );
  }
}

class ChartBasica16 extends StatelessWidget {
  const ChartBasica16({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      PokemonAtaque('Golduck', 56, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque('Poliwag', 48, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque(
        'Tentacool',
        48,
        charts.MaterialPalette.purple.shadeDefault,
      ),
    ];
    final serieB = [
      PokemonAtaque('Golduck', 34, charts.MaterialPalette.lime.shadeDefault),
      PokemonAtaque('Poliwag', 49, charts.MaterialPalette.lime.shadeDefault),
      PokemonAtaque('Tentacool', 57, charts.MaterialPalette.lime.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Serie A',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieA,
      ),
      charts.Series<PokemonAtaque, String>(
        id: 'Serie B',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieB,
      ),
    ];

    return _pantallaBasica(
      'Basica 16: Barras agrupadas',
      charts.BarChart(
        series,
        animate: true,
        barGroupingType: charts.BarGroupingType.grouped,
      ),
    );
  }
}

class ChartBasica17 extends StatelessWidget {
  const ChartBasica17({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      PokemonAtaque('Doduo', 40, charts.MaterialPalette.teal.shadeDefault),
      PokemonAtaque('Seel', 52, charts.MaterialPalette.teal.shadeDefault),
      PokemonAtaque('Grimer', 59, charts.MaterialPalette.teal.shadeDefault),
    ];
    final serieB = [
      PokemonAtaque('Doduo', 24, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Seel', 70, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Grimer', 58, charts.MaterialPalette.blue.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Serie A',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieA,
      ),
      charts.Series<PokemonAtaque, String>(
        id: 'Serie B',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieB,
      ),
    ];

    return _pantallaBasica(
      'Basica 17: Barras apiladas',
      charts.BarChart(
        series,
        animate: true,
        barGroupingType: charts.BarGroupingType.stacked,
      ),
    );
  }
}

class ChartBasica18 extends StatelessWidget {
  const ChartBasica18({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(3, 63),
      _Punto(6, 64),
      _Punto(9, 67),
      _Punto(12, 99),
      _Punto(15, 67),
      _Punto(18, 35),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return _pantallaBasica(
      'Basica 18: Dispersion',
      charts.ScatterPlotChart(series, animate: true),
    );
  }
}

class ChartBasica19 extends StatelessWidget {
  const ChartBasica19({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      _Punto(1, 56),
      _Punto(2, 45),
      _Punto(3, 34),
      _Punto(4, 88),
      _Punto(5, 34),
    ];
    final serieB = [
      _Punto(1, 96),
      _Punto(2, 89),
      _Punto(3, 58),
      _Punto(4, 21),
      _Punto(5, 35),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Cubone',
        colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: serieA,
      ),
      charts.Series<_Punto, int>(
        id: 'Hitmonlee',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: serieB,
      ),
    ];

    return _pantallaBasica(
      'Basica 19: Lineas multiples',
      charts.LineChart(series, animate: true),
    );
  }
}

class ChartBasica20 extends StatelessWidget {
  const ChartBasica20({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Ninetales', 93, charts.MaterialPalette.pink.shadeDefault),
      PokemonAtaque('Vulpix', 53, charts.MaterialPalette.pink.shadeDefault),
      PokemonAtaque('Growlithe', 101, charts.MaterialPalette.pink.shadeDefault),
      PokemonAtaque('Psyduck', 57, charts.MaterialPalette.pink.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        labelAccessorFn: (p, _) => '${p.ataque}',
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 20: Barras',
      charts.BarChart(series, animate: true),
    );
  }
}

class ChartBasica21 extends StatelessWidget {
  const ChartBasica21({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Tentacool', 83, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Geodude', 66, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Magnemite', 66, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Doduo', 95, charts.MaterialPalette.blue.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 21: Barras horizontales',
      charts.BarChart(series, animate: true, vertical: false),
    );
  }
}

class ChartBasica22 extends StatelessWidget {
  const ChartBasica22({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 47),
      _Punto(2, 60),
      _Punto(3, 83),
      _Punto(4, 44),
      _Punto(5, 70),
      _Punto(6, 73),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return _pantallaBasica(
      'Basica 22: Linea',
      charts.LineChart(series, animate: true),
    );
  }
}

class ChartBasica23 extends StatelessWidget {
  const ChartBasica23({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 50),
      _Punto(2, 43),
      _Punto(3, 41),
      _Punto(4, 46),
      _Punto(5, 71),
      _Punto(6, 40),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return _pantallaBasica(
      'Basica 23: Area',
      charts.LineChart(
        series,
        animate: true,
        defaultRenderer: charts.LineRendererConfig(
          includeArea: true,
          areaOpacity: 0.4,
        ),
      ),
    );
  }
}

class ChartBasica24 extends StatelessWidget {
  const ChartBasica24({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Siniestro', 7, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Electrico', 11, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Fantasma', 12, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Planta', 5, charts.MaterialPalette.green.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        labelAccessorFn: (p, _) => '${p.nombre}: ${p.ataque}',
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 24: Torta',
      charts.PieChart(series, animate: true),
    );
  }
}

// Reemplazado dona problemática por Barras Horizontales estables
class ChartBasica25 extends StatelessWidget {
  const ChartBasica25({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque(
        'Dragon',
        6,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
      PokemonAtaque('Agua', 10, charts.MaterialPalette.teal.shadeDefault),
      PokemonAtaque('Tierra', 9, charts.MaterialPalette.indigo.shadeDefault),
      PokemonAtaque('Normal', 12, charts.MaterialPalette.pink.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 25: Barras Horizontales (Tipos)',
      charts.BarChart(series, animate: true, vertical: false),
    );
  }
}

class ChartBasica26 extends StatelessWidget {
  const ChartBasica26({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      PokemonAtaque('Haunter', 86, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Drowzee', 67, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Krabby', 52, charts.MaterialPalette.yellow.shadeDefault),
    ];
    final serieB = [
      PokemonAtaque('Haunter', 75, charts.MaterialPalette.pink.shadeDefault),
      PokemonAtaque('Drowzee', 87, charts.MaterialPalette.pink.shadeDefault),
      PokemonAtaque('Krabby', 60, charts.MaterialPalette.pink.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Serie A',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieA,
      ),
      charts.Series<PokemonAtaque, String>(
        id: 'Serie B',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieB,
      ),
    ];

    return _pantallaBasica(
      'Basica 26: Barras agrupadas',
      charts.BarChart(
        series,
        animate: true,
        barGroupingType: charts.BarGroupingType.grouped,
      ),
    );
  }
}

class ChartBasica27 extends StatelessWidget {
  const ChartBasica27({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      PokemonAtaque('Cubone', 33, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque(
        'Hitmonlee',
        40,
        charts.MaterialPalette.purple.shadeDefault,
      ),
      PokemonAtaque(
        'Lickitung',
        51,
        charts.MaterialPalette.purple.shadeDefault,
      ),
    ];
    final serieB = [
      PokemonAtaque('Cubone', 50, charts.MaterialPalette.lime.shadeDefault),
      PokemonAtaque('Hitmonlee', 62, charts.MaterialPalette.lime.shadeDefault),
      PokemonAtaque('Lickitung', 57, charts.MaterialPalette.lime.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Serie A',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieA,
      ),
      charts.Series<PokemonAtaque, String>(
        id: 'Serie B',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieB,
      ),
    ];

    return _pantallaBasica(
      'Basica 27: Barras apiladas',
      charts.BarChart(
        series,
        animate: true,
        barGroupingType: charts.BarGroupingType.stacked,
      ),
    );
  }
}

class ChartBasica28 extends StatelessWidget {
  const ChartBasica28({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(4, 20),
      _Punto(7, 56),
      _Punto(10, 28),
      _Punto(13, 24),
      _Punto(16, 81),
      _Punto(19, 66),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return _pantallaBasica(
      'Basica 28: Dispersion',
      charts.ScatterPlotChart(series, animate: true),
    );
  }
}

class ChartBasica29 extends StatelessWidget {
  const ChartBasica29({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      _Punto(1, 76),
      _Punto(2, 50),
      _Punto(3, 26),
      _Punto(4, 93),
      _Punto(5, 84),
    ];
    final serieB = [
      _Punto(1, 23),
      _Punto(2, 27),
      _Punto(3, 48),
      _Punto(4, 34),
      _Punto(5, 69),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Staryu',
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: serieA,
      ),
      charts.Series<_Punto, int>(
        id: 'Pikachu',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: serieB,
      ),
    ];

    return _pantallaBasica(
      'Basica 29: Lineas multiples',
      charts.LineChart(series, animate: true),
    );
  }
}

class ChartBasica30 extends StatelessWidget {
  const ChartBasica30({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Seel', 40, charts.MaterialPalette.teal.shadeDefault),
      PokemonAtaque('Grimer', 105, charts.MaterialPalette.teal.shadeDefault),
      PokemonAtaque('Shellder', 52, charts.MaterialPalette.teal.shadeDefault),
      PokemonAtaque('Gastly', 50, charts.MaterialPalette.teal.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        labelAccessorFn: (p, _) => '${p.ataque}',
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 30: Barras',
      charts.BarChart(series, animate: true),
    );
  }
}

class ChartBasica31 extends StatelessWidget {
  const ChartBasica31({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Krabby', 98, charts.MaterialPalette.cyan.shadeDefault),
      PokemonAtaque('Voltorb', 95, charts.MaterialPalette.cyan.shadeDefault),
      PokemonAtaque('Exeggcute', 99, charts.MaterialPalette.cyan.shadeDefault),
      PokemonAtaque('Cubone', 46, charts.MaterialPalette.cyan.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 31: Barras horizontales',
      charts.BarChart(series, animate: true, vertical: false),
    );
  }
}

class ChartBasica32 extends StatelessWidget {
  const ChartBasica32({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 86),
      _Punto(2, 46),
      _Punto(3, 90),
      _Punto(4, 41),
      _Punto(5, 49),
      _Punto(6, 95),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.cyan.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return _pantallaBasica(
      'Basica 32: Linea',
      charts.LineChart(series, animate: true),
    );
  }
}

class ChartBasica33 extends StatelessWidget {
  const ChartBasica33({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 49),
      _Punto(2, 31),
      _Punto(3, 62),
      _Punto(4, 74),
      _Punto(5, 61),
      _Punto(6, 30),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return _pantallaBasica(
      'Basica 33: Area',
      charts.LineChart(
        series,
        animate: true,
        defaultRenderer: charts.LineRendererConfig(
          includeArea: true,
          areaOpacity: 0.4,
        ),
      ),
    );
  }
}

class ChartBasica34 extends StatelessWidget {
  const ChartBasica34({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Volador', 4, charts.MaterialPalette.lime.shadeDefault),
      PokemonAtaque('Roca', 6, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Electrico', 5, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Psiquico', 9, charts.MaterialPalette.red.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        labelAccessorFn: (p, _) => '${p.nombre}: ${p.ataque}',
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 34: Torta',
      charts.PieChart(series, animate: true),
    );
  }
}

// Reemplazado dona problemática por Barras Agrupadas estables
class ChartBasica35 extends StatelessWidget {
  const ChartBasica35({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Agua', 10, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('Veneno', 8, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque(
        'Volador',
        3,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
      PokemonAtaque('Roca', 8, charts.MaterialPalette.teal.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 35: Barras (Tipos de Agua/Roca)',
      charts.BarChart(series, animate: true),
    );
  }
}

class ChartBasica36 extends StatelessWidget {
  const ChartBasica36({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      PokemonAtaque('Chansey', 85, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Tangela', 78, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Kangaskhan', 81, charts.MaterialPalette.blue.shadeDefault),
    ];
    final serieB = [
      PokemonAtaque('Chansey', 38, charts.MaterialPalette.teal.shadeDefault),
      PokemonAtaque('Tangela', 38, charts.MaterialPalette.teal.shadeDefault),
      PokemonAtaque('Kangaskhan', 69, charts.MaterialPalette.teal.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Serie A',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieA,
      ),
      charts.Series<PokemonAtaque, String>(
        id: 'Serie B',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieB,
      ),
    ];

    return _pantallaBasica(
      'Baica 36: Barras agrupadas',
      charts.BarChart(
        series,
        animate: true,
        barGroupingType: charts.BarGroupingType.grouped,
      ),
    );
  }
}

class ChartBasica37 extends StatelessWidget {
  const ChartBasica37({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      PokemonAtaque('Staryu', 65, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Pikachu', 46, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque(
        'Charizard',
        65,
        charts.MaterialPalette.yellow.shadeDefault,
      ),
    ];
    final serieB = [
      PokemonAtaque('Staryu', 68, charts.MaterialPalette.pink.shadeDefault),
      PokemonAtaque('Pikachu', 45, charts.MaterialPalette.pink.shadeDefault),
      PokemonAtaque('Charizard', 60, charts.MaterialPalette.pink.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Serie A',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieA,
      ),
      charts.Series<PokemonAtaque, String>(
        id: 'Serie B',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        data: serieB,
      ),
    ];

    return _pantallaBasica(
      'Basica 37: Barras apiladas',
      charts.BarChart(
        series,
        animate: true,
        barGroupingType: charts.BarGroupingType.stacked,
      ),
    );
  }
}

class ChartBasica38 extends StatelessWidget {
  const ChartBasica38({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(5, 100),
      _Punto(8, 40),
      _Punto(11, 77),
      _Punto(14, 53),
      _Punto(17, 81),
      _Punto(20, 34),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return _pantallaBasica(
      'Basica 38: Dispersion',
      charts.ScatterPlotChart(series, animate: true),
    );
  }
}

class ChartBasica39 extends StatelessWidget {
  const ChartBasica39({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      _Punto(1, 64),
      _Punto(2, 85),
      _Punto(3, 24),
      _Punto(4, 51),
      _Punto(5, 29),
    ];
    final serieB = [
      _Punto(1, 67),
      _Punto(2, 83),
      _Punto(3, 65),
      _Punto(4, 30),
      _Punto(5, 68),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Alakazam',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: serieA,
      ),
      charts.Series<_Punto, int>(
        id: 'Gyarados',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: serieB,
      ),
    ];

    return _pantallaBasica(
      'Basica 39: Lineas multiples',
      charts.LineChart(series, animate: true),
    );
  }
}

class ChartBasica40 extends StatelessWidget {
  const ChartBasica40({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque(
        'Hitmonlee',
        41,
        charts.MaterialPalette.purple.shadeDefault,
      ),
      PokemonAtaque(
        'Lickitung',
        57,
        charts.MaterialPalette.purple.shadeDefault,
      ),
      PokemonAtaque('Koffing', 104, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque('Rhyhorn', 80, charts.MaterialPalette.purple.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Datos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        labelAccessorFn: (p, _) => '${p.ataque}',
        data: data,
      ),
    ];

    return _pantallaBasica(
      'Basica 40: Barras',
      charts.BarChart(series, animate: true),
    );
  }
}

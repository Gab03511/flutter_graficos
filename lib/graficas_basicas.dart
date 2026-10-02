import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

import 'package:flutter/material.dart';

class PokemonAtaque {
  final String nombre;
  final int ataque;
  final charts.Color color;

  PokemonAtaque(this.nombre, this.ataque, this.color);
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

    return Scaffold(
      appBar: AppBar(title: const Text('Gráfica de Ataques Pokémon')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(series, animate: true),
        ),
      ),
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
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.LineChart(series, animate: true),
        ),
      ),
    );
  }
}

class _Punto {
  final int x;
  final int y;

  _Punto(this.x, this.y);
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

    return Scaffold(
      appBar: AppBar(title: const Text('Gráfica de Ataques Pokémon')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.PieChart(series, animate: true),
        ),
      ),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Gráfica de Ataques Pokémon')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.LineChart(
            series,
            animate: true,
            defaultRenderer: charts.LineRendererConfig(
              includeArea: true,
              areaOpacity: 0.2,
            ),
          ),
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
        colorFn: (PokemonAtaque ataque, _) => ataque.color,
        domainFn: (PokemonAtaque ataque, _) => ataque.nombre,
        measureFn: (PokemonAtaque ataque, _) => ataque.ataque,
        data: data,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Gráfica de Ataques Pokémon')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(series, animate: true, vertical: false),
        ),
      ),
    );
  }
}

class ChartBasica06 extends StatelessWidget {
  const ChartBasica06({super.key});

  @override
  Widget build(BuildContext context) {
    final hp = [
      PokemonAtaque('Pikachu', 35, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Charizard', 78, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Bulbasaur', 45, charts.MaterialPalette.green.shadeDefault),
    ];
    final ataque = [
      PokemonAtaque('Pikachu', 55, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Charizard', 84, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Bulbasaur', 49, charts.MaterialPalette.green.shadeDefault),
    ];

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'hp',
        colorFn: (PokemonAtaque ataque, _) => ataque.color,
        domainFn: (PokemonAtaque ataque, _) => ataque.nombre,
        measureFn: (PokemonAtaque ataque, _) => ataque.ataque,
        data: hp,
      ),
      charts.Series<PokemonAtaque, String>(
        id: 'ataque',
        colorFn: (PokemonAtaque ataque, _) => ataque.color,
        domainFn: (PokemonAtaque ataque, _) => ataque.nombre,
        measureFn: (PokemonAtaque ataque, _) => ataque.ataque,
        data: ataque,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Gráfica de Ataques Pokémon')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(
            series,
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
          ),
        ),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 7: Dispersión')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.ScatterPlotChart(series, animate: true),
        ),
      ),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 8: Charmander vs Squirtle')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.LineChart(series, animate: true),
        ),
      ),
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
        id: 'Físico',
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 9: Ataque total apilado')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(
            series,
            animate: true,
            barGroupingType: charts.BarGroupingType.stacked,
          ),
        ),
      ),
    );
  }
}

class ChartBasica10 extends StatelessWidget {
  const ChartBasica10({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Eevee', 65, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Snorlax', 110, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Gengar', 65, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Machamp', 130, charts.MaterialPalette.blue.shadeDefault),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 10: Barras')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(series, animate: true),
        ),
      ),
    );
  }
}

class ChartBasica11 extends StatelessWidget {
  const ChartBasica11({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Alakazam', 95, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Gyarados', 70, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Dragonite', 100, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Mewtwo', 90, charts.MaterialPalette.red.shadeDefault),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 11: Barras horizontales')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(series, animate: true, vertical: false),
        ),
      ),
    );
  }
}

class ChartBasica12 extends StatelessWidget {
  const ChartBasica12({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 55),
      _Punto(2, 60),
      _Punto(3, 48),
      _Punto(4, 72),
      _Punto(5, 65),
      _Punto(6, 80),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 12: Línea')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.LineChart(series, animate: true),
        ),
      ),
    );
  }
}

class ChartBasica13 extends StatelessWidget {
  const ChartBasica13({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 25),
      _Punto(2, 45),
      _Punto(3, 38),
      _Punto(4, 60),
      _Punto(5, 85),
      _Punto(6, 95),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 13: Área')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.LineChart(
            series,
            animate: true,
            defaultRenderer: charts.LineRendererConfig(
              includeArea: true,
              areaOpacity: 0.4,
            ),
          ),
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
      PokemonAtaque('Volador', 7, charts.MaterialPalette.cyan.shadeDefault),
      PokemonAtaque('Veneno', 5, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque('Roca', 4, charts.MaterialPalette.deepOrange.shadeDefault),
      PokemonAtaque('Hielo', 3, charts.MaterialPalette.blue.shadeDefault),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 14: Torta')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.PieChart(series, animate: true),
        ),
      ),
    );
  }
}

class ChartBasica15 extends StatelessWidget {
  const ChartBasica15({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Dragón', 6, charts.MaterialPalette.indigo.shadeDefault),
      PokemonAtaque('Fantasma', 8, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque('Siniestro', 5, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Normal', 9, charts.MaterialPalette.yellow.shadeDefault),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 15: Dona')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.PieChart(
            series,
            animate: true,
            defaultRenderer: charts.ArcRendererConfig(arcWidth: 60),
          ),
        ),
      ),
    );
  }
}

class ChartBasica16 extends StatelessWidget {
  const ChartBasica16({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      PokemonAtaque('Lapras', 50, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Vaporeon', 65, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Jolteon', 45, charts.MaterialPalette.blue.shadeDefault),
    ];
    final serieB = [
      PokemonAtaque(
        'Lapras',
        70,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
      PokemonAtaque(
        'Vaporeon',
        55,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
      PokemonAtaque(
        'Jolteon',
        80,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 16: Barras agrupadas')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(
            series,
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
          ),
        ),
      ),
    );
  }
}

class ChartBasica17 extends StatelessWidget {
  const ChartBasica17({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      PokemonAtaque('Onix', 30, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('Rapidash', 45, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('Arcanine', 55, charts.MaterialPalette.green.shadeDefault),
    ];
    final serieB = [
      PokemonAtaque('Onix', 40, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Rapidash', 35, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Arcanine', 50, charts.MaterialPalette.yellow.shadeDefault),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 17: Barras apiladas')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(
            series,
            animate: true,
            barGroupingType: charts.BarGroupingType.stacked,
          ),
        ),
      ),
    );
  }
}

class ChartBasica18 extends StatelessWidget {
  const ChartBasica18({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(2, 40),
      _Punto(5, 60),
      _Punto(8, 35),
      _Punto(11, 75),
      _Punto(14, 50),
      _Punto(17, 90),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.pink.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 18: Dispersión')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.ScatterPlotChart(series, animate: true),
        ),
      ),
    );
  }
}

class ChartBasica19 extends StatelessWidget {
  const ChartBasica19({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      _Punto(1, 42),
      _Punto(2, 58),
      _Punto(3, 50),
      _Punto(4, 70),
      _Punto(5, 65),
    ];
    final serieB = [
      _Punto(1, 35),
      _Punto(2, 45),
      _Punto(3, 60),
      _Punto(4, 55),
      _Punto(5, 80),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Snorlax',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: serieA,
      ),
      charts.Series<_Punto, int>(
        id: 'Gengar',
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: serieB,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 19: Líneas múltiples')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.LineChart(series, animate: true),
        ),
      ),
    );
  }
}

class ChartBasica20 extends StatelessWidget {
  const ChartBasica20({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque(
        'Ninetales',
        76,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
      PokemonAtaque(
        'Vulpix',
        41,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
      PokemonAtaque(
        'Growlithe',
        70,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
      PokemonAtaque(
        'Rapidash',
        100,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 20: Barras')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(series, animate: true),
        ),
      ),
    );
  }
}

class ChartBasica21 extends StatelessWidget {
  const ChartBasica21({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Psyduck', 52, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Golduck', 82, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Poliwag', 40, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque(
        'Tentacool',
        40,
        charts.MaterialPalette.yellow.shadeDefault,
      ),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 21: Barras horizontales')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(series, animate: true, vertical: false),
        ),
      ),
    );
  }
}

class ChartBasica22 extends StatelessWidget {
  const ChartBasica22({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 48),
      _Punto(2, 52),
      _Punto(3, 70),
      _Punto(4, 65),
      _Punto(5, 90),
      _Punto(6, 85),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 22: Línea')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.LineChart(series, animate: true),
        ),
      ),
    );
  }
}

class ChartBasica23 extends StatelessWidget {
  const ChartBasica23({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(1, 30),
      _Punto(2, 55),
      _Punto(3, 40),
      _Punto(4, 68),
      _Punto(5, 75),
      _Punto(6, 95),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 23: Área')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.LineChart(
            series,
            animate: true,
            defaultRenderer: charts.LineRendererConfig(
              includeArea: true,
              areaOpacity: 0.4,
            ),
          ),
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
      PokemonAtaque('Eléctrico', 9, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque(
        'Tierra',
        6,
        charts.MaterialPalette.deepOrange.shadeDefault,
      ),
      PokemonAtaque('Roca', 5, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('Hielo', 4, charts.MaterialPalette.blue.shadeDefault),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 24: Torta')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.PieChart(series, animate: true),
        ),
      ),
    );
  }
}

class ChartBasica25 extends StatelessWidget {
  const ChartBasica25({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Normal', 10, charts.MaterialPalette.gray.shadeDefault),
      PokemonAtaque('Fantasma', 6, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque('Volador', 7, charts.MaterialPalette.cyan.shadeDefault),
      PokemonAtaque('Veneno', 5, charts.MaterialPalette.green.shadeDefault),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 25: Dona')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.PieChart(
            series,
            animate: true,
            defaultRenderer: charts.ArcRendererConfig(arcWidth: 60),
          ),
        ),
      ),
    );
  }
}

class ChartBasica26 extends StatelessWidget {
  const ChartBasica26({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      PokemonAtaque('Geodude', 40, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Magnemite', 55, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Doduo', 48, charts.MaterialPalette.blue.shadeDefault),
    ];
    final serieB = [
      PokemonAtaque('Geodude', 35, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Magnemite', 60, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Doduo', 45, charts.MaterialPalette.red.shadeDefault),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 26: Barras agrupadas')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(
            series,
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
          ),
        ),
      ),
    );
  }
}

class ChartBasica27 extends StatelessWidget {
  const ChartBasica27({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      PokemonAtaque('Seel', 30, charts.MaterialPalette.teal.shadeDefault),
      PokemonAtaque('Grimer', 50, charts.MaterialPalette.teal.shadeDefault),
      PokemonAtaque('Shellder', 38, charts.MaterialPalette.teal.shadeDefault),
    ];
    final serieB = [
      PokemonAtaque('Seel', 25, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque('Grimer', 40, charts.MaterialPalette.purple.shadeDefault),
      PokemonAtaque('Shellder', 55, charts.MaterialPalette.purple.shadeDefault),
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

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 27: Barras apiladas')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(
            series,
            animate: true,
            barGroupingType: charts.BarGroupingType.stacked,
          ),
        ),
      ),
    );
  }
}

class ChartBasica28 extends StatelessWidget {
  const ChartBasica28({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _Punto(3, 25),
      _Punto(6, 50),
      _Punto(9, 38),
      _Punto(12, 70),
      _Punto(15, 55),
      _Punto(18, 85),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.lime.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: puntos,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 28: Dispersión')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.ScatterPlotChart(series, animate: true),
        ),
      ),
    );
  }
}

class ChartBasica29 extends StatelessWidget {
  const ChartBasica29({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = [
      _Punto(1, 45),
      _Punto(2, 60),
      _Punto(3, 55),
      _Punto(4, 75),
      _Punto(5, 70),
    ];
    final serieB = [
      _Punto(1, 38),
      _Punto(2, 50),
      _Punto(3, 65),
      _Punto(4, 60),
      _Punto(5, 85),
    ];

    final series = [
      charts.Series<_Punto, int>(
        id: 'Haunter',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: serieA,
      ),
      charts.Series<_Punto, int>(
        id: 'Krabby',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        data: serieB,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Básica 29: Líneas múltiples')),
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.LineChart(series, animate: true),
        ),
      ),
    );
  }
}

import 'dart:math' as math;

import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

import 'graficas_basicas.dart' show PokemonAtaque;

class _Punto {
  final int x;
  final int y;

  _Punto(this.x, this.y);
}

class _PuntoRadio {
  final int x;
  final int y;
  final double radio;

  _PuntoRadio(this.x, this.y, this.radio);
}

class _Pantalla extends StatefulWidget {
  final String titulo;
  final String? inicial;
  final String Function(charts.SeriesDatum d) formato;
  final Widget Function(void Function(charts.SelectionModel) alTocar) grafica;

  const _Pantalla({
    required this.titulo,
    required this.formato,
    required this.grafica,
    this.inicial,
  });

  @override
  State<_Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<_Pantalla> {
  String? seleccion;

  @override
  void initState() {
    super.initState();
    seleccion = widget.inicial;
  }

  void _alTocar(charts.SelectionModel model) {
    final datos = model.selectedDatum;
    if (datos.isNotEmpty) {
      setState(() {
        seleccion = widget.formato(datos.first);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 300, width: 340, child: widget.grafica(_alTocar)),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                seleccion ?? 'toca un dato para ver su info',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<charts.SelectionModelConfig<D>> _sel<D>(
  void Function(charts.SelectionModel) alTocar,
) {
  return [
    charts.SelectionModelConfig<D>(
      type: charts.SelectionModelType.info,
      changedListener: alTocar,
    ),
  ];
}

List<PokemonAtaque> _lista(
  List<String> nombres,
  List<int> valores,
  charts.Color color,
) {
  final resultado = <PokemonAtaque>[];
  for (var i = 0; i < nombres.length; i++) {
    resultado.add(PokemonAtaque(nombres[i], valores[i], color));
  }
  return resultado;
}

List<_Punto> _puntos(List<int> ys) {
  final resultado = <_Punto>[];
  for (var i = 0; i < ys.length; i++) {
    resultado.add(_Punto(i + 1, ys[i]));
  }
  return resultado;
}

charts.Series<PokemonAtaque, String> _serieP(
  String id,
  List<PokemonAtaque> data, {
  String? categoria,
}) {
  return charts.Series<PokemonAtaque, String>(
    id: id,
    seriesCategory: categoria,
    colorFn: (p, _) => p.color,
    domainFn: (p, _) => p.nombre,
    measureFn: (p, _) => p.ataque,
    data: data,
  );
}

charts.Series<_Punto, int> _serieN(
  String id,
  List<_Punto> data,
  charts.Color color,
) {
  return charts.Series<_Punto, int>(
    id: id,
    colorFn: (_, __) => color,
    domainFn: (p, _) => p.x,
    measureFn: (p, _) => p.y,
    data: data,
  );
}

String _fPokemon(charts.SeriesDatum d) {
  final p = d.datum as PokemonAtaque;
  return '${p.nombre}: ${p.ataque}';
}

String _fPokemonSerie(charts.SeriesDatum d) {
  final p = d.datum as PokemonAtaque;
  return '${d.series.displayName} - ${p.nombre}: ${p.ataque}';
}

String _fPunto(charts.SeriesDatum d) {
  final p = d.datum as _Punto;
  return 'x=${p.x}  y=${p.y}';
}

String _fPuntoSerie(charts.SeriesDatum d) {
  final p = d.datum as _Punto;
  return '${d.series.displayName}: x=${p.x} y=${p.y}';
}

List<_Punto> _puntosEstrella() {
  final puntos = <_Punto>[];
  const centroX = 50;
  const centroY = 50;
  const radioLargo = 40;
  const radioCorto = 18;
  for (var i = 0; i < 10; i++) {
    final angulo = i * 36 * math.pi / 180;
    final radio = i.isEven ? radioLargo : radioCorto;
    final x = centroX + radio * math.cos(angulo);
    final y = centroY + radio * math.sin(angulo);
    puntos.add(_Punto(x.round(), y.round()));
  }
  return puntos;
}

class ChartAvanzada01 extends StatelessWidget {
  const ChartAvanzada01({super.key});

  @override
  Widget build(BuildContext context) {
    final nombres = ['Charizard', 'Bulbasaur', 'Squirtle', 'Snorlax', 'Gengar'];
    final hp = _lista(nombres, [
      54,
      99,
      75,
      89,
      36,
    ], charts.MaterialPalette.blue.shadeDefault);
    final velocidad = _lista(nombres, [
      48,
      75,
      51,
      100,
      53,
    ], charts.MaterialPalette.red.shadeDefault);

    final series = [
      _serieP('HP', hp),
      _serieP('Velocidad', velocidad)
        ..setAttribute(charts.rendererIdKey, 'linea'),
    ];

    return _Pantalla(
      titulo: 'Avanzada 1: Barras + linea',
      formato: _fPokemonSerie,
      grafica: (alTocar) => charts.OrdinalComboChart(
        series,
        animate: true,
        defaultRenderer: charts.BarRendererConfig(
          groupingType: charts.BarGroupingType.grouped,
        ),
        customSeriesRenderers: [
          charts.LineRendererConfig(customRendererId: 'linea'),
        ],
        behaviors: [charts.SeriesLegend()],
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada02 extends StatelessWidget {
  const ChartAvanzada02({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Bulbasaur', 28, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Squirtle', 61, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Snorlax', 73, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Gengar', 20, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque(
        'Dragonite',
        56,
        charts.MaterialPalette.purple.shadeDefault,
      ),
    ];

    return _Pantalla(
      titulo: 'Avanzada 2: Con leyenda',
      formato: _fPokemon,
      grafica: (alTocar) => charts.BarChart(
        [_serieP('Ataque', data)],
        animate: true,
        primaryMeasureAxis: const charts.NumericAxisSpec(
          viewport: charts.NumericExtents(0, 110),
        ),
        behaviors: [charts.SeriesLegend()],
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada03 extends StatelessWidget {
  const ChartAvanzada03({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = _puntosEstrella();

    return _Pantalla(
      titulo: 'Avanzada 3: Estrella con scatter',
      formato: (d) {
        final p = d.datum as _Punto;
        return 'punto: x=${p.x}  y=${p.y}';
      },
      grafica: (alTocar) => charts.ScatterPlotChart(
        [
          _serieN(
            'Estrella',
            puntos,
            charts.MaterialPalette.yellow.shadeDefault,
          ),
        ],
        animate: true,
        selectionModels: _sel<num>(alTocar),
      ),
    );
  }
}

class ChartAvanzada04 extends StatelessWidget {
  const ChartAvanzada04({super.key});

  @override
  Widget build(BuildContext context) {
    final nombres = ['Snorlax', 'Gengar', 'Dragonite', 'Mewtwo', 'Lapras'];
    final hp = _lista(nombres, [
      93,
      42,
      84,
      65,
      80,
    ], charts.MaterialPalette.blue.shadeDefault);
    final peso = _lista(nombres, [
      36,
      11,
      49,
      46,
      31,
    ], charts.MaterialPalette.deepOrange.shadeDefault);

    final series = [
      _serieP('HP', hp),
      _serieP('Peso (kg)', peso)
        ..setAttribute(charts.measureAxisIdKey, 'secondaryMeasureAxisId'),
    ];

    return _Pantalla(
      titulo: 'Avanzada 4: Eje secundario',
      formato: _fPokemonSerie,
      grafica: (alTocar) => charts.BarChart(
        series,
        animate: true,
        barGroupingType: charts.BarGroupingType.grouped,
        secondaryMeasureAxis: const charts.NumericAxisSpec(),
        behaviors: [charts.SeriesLegend()],
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada05 extends StatelessWidget {
  const ChartAvanzada05({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = _puntos([56, 100, 65, 50, 61, 63, 87, 66, 41, 63, 65, 77]);

    return _Pantalla(
      titulo: 'Avanzada 5: Pan y zoom',
      formato: _fPunto,
      grafica: (alTocar) => charts.LineChart(
        [_serieN('Datos', puntos, charts.MaterialPalette.indigo.shadeDefault)],
        animate: true,
        behaviors: [charts.PanAndZoomBehavior()],
        selectionModels: _sel<num>(alTocar),
      ),
    );
  }
}

class ChartAvanzada06 extends StatelessWidget {
  const ChartAvanzada06({super.key});

  @override
  Widget build(BuildContext context) {
    final data = _lista(
      ['Dragonite', 'Mewtwo', 'Lapras', 'Eevee', 'Pikachu'],
      [74, 37, 59, 86, 31],
      charts.MaterialPalette.green.shadeDefault,
    );

    return _Pantalla(
      titulo: 'Avanzada 6: Franja de meta',
      formato: _fPokemon,
      grafica: (alTocar) => charts.BarChart(
        [_serieP('Ataque', data)],
        animate: true,
        behaviors: [
          charts.RangeAnnotation([
            charts.RangeAnnotationSegment(
              70,
              90,
              charts.RangeAnnotationAxisType.measure,
              color: charts.MaterialPalette.gray.shade200,
            ),
          ]),
        ],
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada07 extends StatelessWidget {
  const ChartAvanzada07({super.key});

  @override
  Widget build(BuildContext context) {
    final data = _lista(
      [
        'Charizard Mega',
        'Alakazam Shiny',
        'Gyarados Rojo',
        'Dragonite Azul',
        'Mewtwo Armado',
      ],
      [65, 93, 43, 44, 100],
      charts.MaterialPalette.purple.shadeDefault,
    );

    return _Pantalla(
      titulo: 'Avanzada 7: Etiquetas rotadas',
      formato: _fPokemon,
      grafica: (alTocar) => charts.BarChart(
        [_serieP('Ataque', data)],
        animate: true,
        domainAxis: const charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(labelRotation: 45),
        ),
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada08 extends StatelessWidget {
  const ChartAvanzada08({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = _puntos([33, 46, 65, 34, 83, 32]);

    return _Pantalla(
      titulo: 'Avanzada 8: Cuadricula punteada',
      formato: _fPunto,
      grafica: (alTocar) => charts.LineChart(
        [_serieN('Datos', puntos, charts.MaterialPalette.cyan.shadeDefault)],
        animate: true,
        primaryMeasureAxis: const charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
            lineStyle: charts.LineStyleSpec(dashPattern: [4, 4]),
          ),
        ),
        selectionModels: _sel<num>(alTocar),
      ),
    );
  }
}

class ChartAvanzada09 extends StatelessWidget {
  const ChartAvanzada09({super.key});

  @override
  Widget build(BuildContext context) {
    final data = _lista(
      ['Eevee', 'Pikachu', 'Charizard', 'Bulbasaur', 'Squirtle'],
      [85, 67, 44, 49, 79],
      charts.MaterialPalette.pink.shadeDefault,
    );

    return _Pantalla(
      titulo: 'Avanzada 9: Seleccion inicial',
      inicial: 'Eevee: 85',
      formato: _fPokemon,
      grafica: (alTocar) => charts.BarChart(
        [_serieP('Ataque', data)],
        animate: true,
        behaviors: [
          charts.InitialSelection(
            selectedDataConfig: [
              charts.SeriesDatumConfig<String>('Ataque', 'Eevee'),
            ],
          ),
        ],
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada10 extends StatelessWidget {
  const ChartAvanzada10({super.key});

  @override
  Widget build(BuildContext context) {
    final data = _lista(
      ['Pikachu', 'Charizard', 'Bulbasaur', 'Squirtle', 'Snorlax'],
      [37, 55, 41, 78, 50],
      charts.MaterialPalette.lime.shadeDefault,
    );

    return _Pantalla(
      titulo: 'Avanzada 10: Resaltado de columna',
      formato: _fPokemon,
      grafica: (alTocar) => charts.BarChart(
        [_serieP('Ataque', data)],
        animate: true,
        behaviors: [charts.DomainHighlighter()],
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada11 extends StatelessWidget {
  const ChartAvanzada11({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Fuego', 8, charts.MaterialPalette.blue.shadeDefault),
      PokemonAtaque('Agua', 9, charts.MaterialPalette.red.shadeDefault),
      PokemonAtaque('Planta', 8, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Electrico', 6, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('Psiquico', 5, charts.MaterialPalette.purple.shadeDefault),
    ];
    final total = data.fold<int>(0, (suma, p) => suma + p.ataque);

    final series = [
      charts.Series<PokemonAtaque, String>(
        id: 'Tipos',
        colorFn: (p, _) => p.color,
        domainFn: (p, _) => p.nombre,
        measureFn: (p, _) => p.ataque,
        labelAccessorFn: (p, _) =>
            '${p.nombre}: ${(p.ataque / total * 100).round()}%',
        data: data,
      ),
    ];

    return _Pantalla(
      titulo: 'Avanzada 11: Etiquetas afuera',
      formato: (d) {
        final p = d.datum as PokemonAtaque;
        final porcentaje = (p.ataque / total * 100).round();
        return '${p.nombre}: ${p.ataque} ($porcentaje%)';
      },
      grafica: (alTocar) => charts.PieChart(
        series,
        animate: true,
        defaultRenderer: charts.ArcRendererConfig(
          arcWidth: 50,
          arcRendererDecorators: [
            charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside,
            ),
          ],
        ),
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada12 extends StatelessWidget {
  const ChartAvanzada12({super.key});

  @override
  Widget build(BuildContext context) {
    final nombres = ['Bulbasaur', 'Squirtle', 'Snorlax', 'Gengar'];
    final interno = _lista(nombres, [
      16,
      15,
      21,
      14,
    ], charts.MaterialPalette.blue.shadeDefault);
    final externo = _lista(nombres, [
      19,
      25,
      23,
      16,
    ], charts.MaterialPalette.teal.shadeDefault);

    return _Pantalla(
      titulo: 'Avanzada 12: Dona de dos anillos',
      formato: (d) {
        final p = d.datum as PokemonAtaque;
        final lista = d.series.id == 'Interno' ? interno : externo;
        final total = lista.fold<int>(0, (suma, e) => suma + e.ataque);
        final porcentaje = (p.ataque / total * 100).round();
        return '${d.series.displayName} - ${p.nombre}: ${p.ataque} ($porcentaje%)';
      },
      grafica: (alTocar) => charts.PieChart(
        [_serieP('Interno', interno), _serieP('Externo', externo)],
        animate: true,
        defaultRenderer: charts.ArcRendererConfig(arcWidth: 40),
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada13 extends StatelessWidget {
  const ChartAvanzada13({super.key});

  @override
  Widget build(BuildContext context) {
    final data = _lista(
      ['Squirtle', 'Snorlax', 'Gengar', 'Dragonite', 'Mewtwo'],
      [84, 93, 71, 45, 32],
      charts.MaterialPalette.deepOrange.shadeDefault,
    );

    return _Pantalla(
      titulo: 'Avanzada 13: Eje Y fijo (0-100)',
      formato: _fPokemon,
      grafica: (alTocar) => charts.BarChart(
        [_serieP('Ataque', data)],
        animate: true,
        primaryMeasureAxis: const charts.NumericAxisSpec(
          viewport: charts.NumericExtents(0, 100),
        ),
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada14 extends StatelessWidget {
  const ChartAvanzada14({super.key});

  @override
  Widget build(BuildContext context) {
    final linea = _puntos([76, 25, 40, 83, 74, 92]);
    final puntos = _puntos([99, 22, 84, 25, 65, 94]);

    final series = [
      _serieN('Tendencia', linea, charts.MaterialPalette.blue.shadeDefault),
      _serieN('Muestras', puntos, charts.MaterialPalette.red.shadeDefault)
        ..setAttribute(charts.rendererIdKey, 'puntos'),
    ];

    return _Pantalla(
      titulo: 'Avanzada 14: Linea + puntos',
      formato: _fPuntoSerie,
      grafica: (alTocar) => charts.NumericComboChart(
        series,
        animate: true,
        defaultRenderer: charts.LineRendererConfig(),
        customSeriesRenderers: [
          charts.PointRendererConfig(customRendererId: 'puntos'),
        ],
        behaviors: [charts.SeriesLegend()],
        selectionModels: _sel<num>(alTocar),
      ),
    );
  }
}

class ChartAvanzada15 extends StatelessWidget {
  const ChartAvanzada15({super.key});

  @override
  Widget build(BuildContext context) {
    final nombres = ['Gengar', 'Dragonite', 'Mewtwo'];
    final a1 = _lista(nombres, [
      30,
      17,
      23,
    ], charts.MaterialPalette.blue.shadeDefault);
    final a2 = _lista(nombres, [
      15,
      26,
      29,
    ], charts.MaterialPalette.red.shadeDefault);
    final b1 = _lista(nombres, [
      24,
      39,
      14,
    ], charts.MaterialPalette.green.shadeDefault);
    final b2 = _lista(nombres, [
      39,
      39,
      23,
    ], charts.MaterialPalette.yellow.shadeDefault);

    final series = [
      _serieP('A-fisico', a1, categoria: 'A'),
      _serieP('A-especial', a2, categoria: 'A'),
      _serieP('B-fisico', b1, categoria: 'B'),
      _serieP('B-especial', b2, categoria: 'B'),
    ];

    return _Pantalla(
      titulo: 'Avanzada 15: Apiladas y agrupadas',
      formato: _fPokemonSerie,
      grafica: (alTocar) => charts.BarChart(
        series,
        animate: true,
        barGroupingType: charts.BarGroupingType.groupedStacked,
        behaviors: [charts.SeriesLegend()],
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada16 extends StatelessWidget {
  const ChartAvanzada16({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = _puntos([70, 82, 58, 86, 40, 43]);

    return _Pantalla(
      titulo: 'Avanzada 16: Punto marcado',
      formato: _fPunto,
      grafica: (alTocar) => charts.LineChart(
        [_serieN('Datos', puntos, charts.MaterialPalette.blue.shadeDefault)],
        animate: true,
        behaviors: [
          charts.RangeAnnotation([
            charts.LineAnnotationSegment(
              3,
              charts.RangeAnnotationAxisType.domain,
              color: charts.MaterialPalette.red.shadeDefault,
              startLabel: 'Evento',
            ),
          ]),
        ],
        selectionModels: _sel<num>(alTocar),
      ),
    );
  }
}

class ChartAvanzada17 extends StatelessWidget {
  const ChartAvanzada17({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      PokemonAtaque('Mewtwo', 72, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('Lapras', 58, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Eevee', 69, charts.MaterialPalette.yellow.shadeDefault),
      PokemonAtaque('Pikachu', 71, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('Charizard', 85, charts.MaterialPalette.green.shadeDefault),
      PokemonAtaque('Bulbasaur', 23, charts.MaterialPalette.red.shadeDefault),
    ];

    return _Pantalla(
      titulo: 'Avanzada 17: Semaforo de colores',
      formato: _fPokemon,
      grafica: (alTocar) => charts.BarChart(
        [_serieP('Ataque', data)],
        animate: true,
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada18 extends StatelessWidget {
  const ChartAvanzada18({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = [
      _PuntoRadio(1, 66, 12),
      _PuntoRadio(2, 33, 10),
      _PuntoRadio(3, 89, 5),
      _PuntoRadio(4, 86, 7),
      _PuntoRadio(5, 59, 9),
      _PuntoRadio(6, 62, 8),
      _PuntoRadio(7, 28, 11),
      _PuntoRadio(8, 90, 7),
    ];

    final series = [
      charts.Series<_PuntoRadio, int>(
        id: 'Datos',
        colorFn: (_, __) => charts.MaterialPalette.indigo.shadeDefault,
        domainFn: (p, _) => p.x,
        measureFn: (p, _) => p.y,
        radiusPxFn: (p, _) => p.radio,
        data: puntos,
      ),
    ];

    return _Pantalla(
      titulo: 'Avanzada 18: Puntos de tamano variable',
      formato: (d) {
        final p = d.datum as _PuntoRadio;
        return 'x=${p.x} y=${p.y} tamano=${p.radio}';
      },
      grafica: (alTocar) => charts.ScatterPlotChart(
        series,
        animate: true,
        selectionModels: _sel<num>(alTocar),
      ),
    );
  }
}

class ChartAvanzada19 extends StatelessWidget {
  const ChartAvanzada19({super.key});

  @override
  Widget build(BuildContext context) {
    final nombres = ['Eevee', 'Pikachu', 'Charizard', 'Bulbasaur', 'Squirtle'];
    final ataque = _lista(nombres, [
      97,
      43,
      71,
      89,
      94,
    ], charts.MaterialPalette.teal.shadeDefault);
    final nivel = _lista(nombres, [
      1,
      1,
      8,
      9,
      8,
    ], charts.MaterialPalette.pink.shadeDefault);

    final series = [
      _serieP('Ataque', ataque),
      _serieP('Nivel', nivel)
        ..setAttribute(charts.measureAxisIdKey, 'secondaryMeasureAxisId'),
    ];

    return _Pantalla(
      titulo: 'Avanzada 19: Horizontal con eje secundario',
      formato: _fPokemonSerie,
      grafica: (alTocar) => charts.BarChart(
        series,
        animate: true,
        vertical: false,
        barGroupingType: charts.BarGroupingType.grouped,
        secondaryMeasureAxis: const charts.NumericAxisSpec(),
        behaviors: [charts.SeriesLegend()],
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada20 extends StatelessWidget {
  const ChartAvanzada20({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = _puntos([95, 22, 66, 26, 31, 96]);

    return _Pantalla(
      titulo: 'Avanzada 20: Etiqueta con unidad',
      formato: (d) {
        final p = d.datum as _Punto;
        return 'x=${p.x}  y=${p.y}kg';
      },
      grafica: (alTocar) => charts.LineChart(
        [
          _serieN(
            'Peso',
            puntos,
            charts.MaterialPalette.deepOrange.shadeDefault,
          ),
        ],
        animate: true,
        primaryMeasureAxis: charts.NumericAxisSpec(
          tickFormatterSpec: charts.BasicNumericTickFormatterSpec(
            (num? value) => '${value?.round()}kg',
          ),
        ),
        selectionModels: _sel<num>(alTocar),
      ),
    );
  }
}

class ChartAvanzada21 extends StatelessWidget {
  const ChartAvanzada21({super.key});

  @override
  Widget build(BuildContext context) {
    final serieA = _puntos([33, 21, 13, 27, 48]);
    final serieB = _puntos([29, 42, 16, 39, 29]);

    final series = [
      _serieN('Charizard', serieA, charts.MaterialPalette.blue.shadeDefault),
      _serieN('Bulbasaur', serieB, charts.MaterialPalette.green.shadeDefault),
    ];

    return _Pantalla(
      titulo: 'Avanzada 21: Areas apiladas',
      formato: _fPuntoSerie,
      grafica: (alTocar) => charts.LineChart(
        series,
        animate: true,
        defaultRenderer: charts.LineRendererConfig(
          includeArea: true,
          stacked: true,
          areaOpacity: 0.6,
        ),
        behaviors: [charts.SeriesLegend()],
        selectionModels: _sel<num>(alTocar),
      ),
    );
  }
}

class ChartAvanzada22 extends StatelessWidget {
  const ChartAvanzada22({super.key});

  @override
  Widget build(BuildContext context) {
    final data = _lista(
      ['Bulbasaur', 'Squirtle', 'Snorlax', 'Gengar', 'Dragonite'],
      [50, 83, 48, 53, 85],
      charts.MaterialPalette.gray.shadeDefault,
    );

    return _Pantalla(
      titulo: 'Avanzada 22: Bordes marcados',
      formato: _fPokemon,
      grafica: (alTocar) => charts.BarChart(
        [_serieP('Ataque', data)],
        animate: true,
        defaultRenderer: charts.BarRendererConfig(strokeWidthPx: 2),
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada23 extends StatelessWidget {
  const ChartAvanzada23({super.key});

  @override
  Widget build(BuildContext context) {
    final puntos = _puntos([80, 58, 29, 35, 90, 43, 81]);

    return _Pantalla(
      titulo: 'Avanzada 23: Dispersion con mas puntos',
      formato: _fPunto,
      grafica: (alTocar) => charts.ScatterPlotChart(
        [_serieN('Datos', puntos, charts.MaterialPalette.lime.shadeDefault)],
        animate: true,
        selectionModels: _sel<num>(alTocar),
      ),
    );
  }
}

class ChartAvanzada24 extends StatelessWidget {
  const ChartAvanzada24({super.key});

  @override
  Widget build(BuildContext context) {
    final data = _lista(
      ['Snorlax', 'Gengar', 'Dragonite', 'Mewtwo', 'Lapras'],
      [36, 56, 57, 83, 84],
      charts.MaterialPalette.cyan.shadeDefault,
    );

    return _Pantalla(
      titulo: 'Avanzada 24: Titulo dentro del grafico',
      formato: _fPokemon,
      grafica: (alTocar) => charts.BarChart(
        [_serieP('Ataque', data)],
        animate: true,
        behaviors: [
          charts.ChartTitle(
            'Comparacion de ataque',
            behaviorPosition: charts.BehaviorPosition.top,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea,
          ),
        ],
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

class ChartAvanzada25 extends StatelessWidget {
  const ChartAvanzada25({super.key});

  @override
  Widget build(BuildContext context) {
    final nombres = ['Gengar', 'Dragonite', 'Mewtwo', 'Lapras', 'Eevee'];
    final ataque = _lista(nombres, [
      52,
      70,
      45,
      32,
      37,
    ], charts.MaterialPalette.blue.shadeDefault);
    final defensa = _lista(nombres, [
      48,
      41,
      62,
      76,
      38,
    ], charts.MaterialPalette.red.shadeDefault);

    return _Pantalla(
      titulo: 'Avanzada 25: Todo combinado',
      formato: _fPokemonSerie,
      grafica: (alTocar) => charts.BarChart(
        [_serieP('Ataque', ataque), _serieP('Defensa', defensa)],
        animate: true,
        barGroupingType: charts.BarGroupingType.grouped,
        primaryMeasureAxis: const charts.NumericAxisSpec(
          viewport: charts.NumericExtents(0, 110),
        ),
        behaviors: [charts.SeriesLegend(), charts.DomainHighlighter()],
        selectionModels: _sel<String>(alTocar),
      ),
    );
  }
}

import 'package:flutter/material.dart';
// Los spark charts viven en otro "barrel" de la misma librería.
// Por eso este archivo NO importa charts.dart.
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../comun/grafico_item.dart';

const List<double> _serie = [5, 6, 5, 7, 4, 8, 10, 6, 9, 12, 8, 14];

Widget _caja(Widget hijo) =>
    Center(child: SizedBox(height: 200, child: hijo));

Widget _sparkLinea() {
  return _caja(
    SfSparkLineChart(
      data: _serie,
      color: Colors.indigo,
      marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
      trackball: SparkChartTrackball(
          activationMode: SparkChartActivationMode.tap),
    ),
  );
}

Widget _sparkBarras() {
  return _caja(
    SfSparkBarChart(
      data: _serie,
      color: Colors.teal,
      highPointColor: Colors.green,
      lowPointColor: Colors.red,
      labelDisplayMode: SparkChartLabelDisplayMode.all,
    ),
  );
}

Widget _sparkArea() {
  return _caja(
    SfSparkAreaChart(
      data: _serie,
      color: Colors.orange.shade200,
      borderColor: Colors.orange,
      borderWidth: 2,
    ),
  );
}

Widget _sparkGanaPierde() {
  return _caja(
    SfSparkWinLossChart(
      data: const <double>[1, -1, 1, 1, 0, -1, 1, -1, -1, 1, 1, 1],
      color: Colors.green,
      negativePointColor: Colors.red,
      tiePointColor: Colors.grey,
    ),
  );
}

final List<GraficoItem> basicosSpark = [
  GraficoItem('Spark línea', 'Mini gráfico de línea con marcadores y trackball.', _sparkLinea),
  GraficoItem('Spark barras', 'Resalta el punto más alto y el más bajo.', _sparkBarras),
  GraficoItem('Spark área', 'Mini gráfico de área.', _sparkArea),
  GraficoItem('Spark gana/pierde', 'Positivo = gana, negativo = pierde, 0 = empate.', _sparkGanaPierde),
];
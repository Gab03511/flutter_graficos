import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../comun/grafico_item.dart';
import '../models/datos.dart';

Legend _leyenda() => Legend(isVisible: true, position: LegendPosition.bottom);

// ============================ LÍNEAS ============================

Widget _lineaSimple() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      LineSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
      ),
    ],
  );
}

Widget _lineaMarcadores() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    tooltipBehavior: TooltipBehavior(enable: true),
    series: <CartesianSeries<DatoCat, String>>[
      LineSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        color: Colors.teal,
        width: 3,
        markerSettings: MarkerSettings(
            isVisible: true, shape: DataMarkerType.diamond, width: 10, height: 10),
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ],
  );
}

Widget _lineaMultiple() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    series: <CartesianSeries<DatoCat, String>>[
      LineSeries<DatoCat, String>(
        name: 'Ventas',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
      ),
      LineSeries<DatoCat, String>(
        name: 'Gastos',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y2,
      ),
      LineSeries<DatoCat, String>(
        name: 'Utilidad',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y3,
      ),
    ],
  );
}

Widget _spline() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      SplineSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        color: Colors.deepPurple,
        width: 3,
        markerSettings: MarkerSettings(isVisible: true),
      ),
    ],
  );
}

Widget _lineaEscalon() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      StepLineSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        color: Colors.orange,
        width: 3,
      ),
    ],
  );
}

Widget _lineaRapida() {
  final datos = List.generate(
    1000,
    (i) => DatoNum(
        i.toDouble(), math.sin(i / 30) * 50 + math.cos(i / 7) * 10),
  );
  return SfCartesianChart(
    primaryXAxis: NumericAxis(),
    series: <CartesianSeries<DatoNum, double>>[
      FastLineSeries<DatoNum, double>(
        dataSource: datos,
        xValueMapper: (DatoNum d, _) => d.x,
        yValueMapper: (DatoNum d, _) => d.y,
        color: Colors.red,
      ),
    ],
  );
}

Widget _lineaFechas() {
  final base = DateTime(2026, 1, 1);
  final datos = List.generate(
    30,
    (i) => DatoFecha(
        base.add(Duration(days: i)), 50 + 20 * math.sin(i / 4) + i),
  );
  return SfCartesianChart(
    primaryXAxis: DateTimeAxis(
        intervalType: DateTimeIntervalType.days, interval: 5),
    tooltipBehavior: TooltipBehavior(enable: true),
    series: <CartesianSeries<DatoFecha, DateTime>>[
      LineSeries<DatoFecha, DateTime>(
        dataSource: datos,
        xValueMapper: (DatoFecha d, _) => d.x,
        yValueMapper: (DatoFecha d, _) => d.y,
        color: Colors.green,
      ),
    ],
  );
}

// ============================ COLUMNAS Y BARRAS ============================

Widget _columnas() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      ColumnSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        color: Colors.indigo,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
      ),
    ],
  );
}

Widget _columnasColor() {
  const datos = [
    DatoColor('Rojo', 30, Colors.red),
    DatoColor('Azul', 45, Colors.blue),
    DatoColor('Verde', 25, Colors.green),
    DatoColor('Naranja', 55, Colors.orange),
    DatoColor('Morado', 40, Colors.purple),
  ];
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoColor, String>>[
      ColumnSeries<DatoColor, String>(
        dataSource: datos,
        xValueMapper: (DatoColor d, _) => d.x,
        yValueMapper: (DatoColor d, _) => d.y,
        pointColorMapper: (DatoColor d, _) => d.color,
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ],
  );
}

Widget _columnasAgrupadas() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    tooltipBehavior: TooltipBehavior(enable: true),
    series: <CartesianSeries<DatoCat, String>>[
      ColumnSeries<DatoCat, String>(
        name: 'Ventas',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        spacing: 0.1,
      ),
      ColumnSeries<DatoCat, String>(
        name: 'Gastos',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y2,
        spacing: 0.1,
      ),
    ],
  );
}

Widget _barras() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      BarSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        color: Colors.teal,
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ],
  );
}

Widget _barrasAgrupadas() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    series: <CartesianSeries<DatoCat, String>>[
      BarSeries<DatoCat, String>(
        name: 'Ventas',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
      ),
      BarSeries<DatoCat, String>(
        name: 'Utilidad',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y3,
      ),
    ],
  );
}

// ============================ ÁREAS ============================

Widget _area() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      AreaSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        color: Colors.blue,
        opacity: 0.5,
        borderColor: Colors.blue,
        borderWidth: 2,
      ),
    ],
  );
}

Widget _splineArea() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      SplineAreaSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        color: Colors.pink,
        opacity: 0.5,
        borderColor: Colors.pink,
        borderWidth: 2,
      ),
    ],
  );
}

Widget _areaEscalon() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      StepAreaSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        color: Colors.amber,
        opacity: 0.6,
        borderColor: Colors.orange,
        borderWidth: 2,
      ),
    ],
  );
}

// ============================ DISPERSIÓN ============================

Widget _dispersion() {
  final r = math.Random(3);
  final datos = List.generate(
      40, (_) => DatoNum(r.nextDouble() * 100, r.nextDouble() * 100));
  return SfCartesianChart(
    primaryXAxis: NumericAxis(),
    primaryYAxis: NumericAxis(),
    series: <CartesianSeries<DatoNum, double>>[
      ScatterSeries<DatoNum, double>(
        dataSource: datos,
        xValueMapper: (DatoNum d, _) => d.x,
        yValueMapper: (DatoNum d, _) => d.y,
        color: Colors.deepOrange,
        opacity: 0.7,
      ),
    ],
  );
}

Widget _burbujas() {
  const datos = [
    DatoNum(10, 20, 5),
    DatoNum(20, 45, 15),
    DatoNum(35, 30, 10),
    DatoNum(50, 60, 25),
    DatoNum(65, 40, 8),
    DatoNum(80, 75, 20),
  ];
  return SfCartesianChart(
    primaryXAxis: NumericAxis(),
    primaryYAxis: NumericAxis(),
    tooltipBehavior: TooltipBehavior(enable: true),
    series: <CartesianSeries<DatoNum, double>>[
      BubbleSeries<DatoNum, double>(
        dataSource: datos,
        xValueMapper: (DatoNum d, _) => d.x,
        yValueMapper: (DatoNum d, _) => d.y,
        sizeValueMapper: (DatoNum d, _) => d.tam,
        minimumRadius: 5,
        maximumRadius: 25,
        opacity: 0.6,
        color: Colors.cyan,
      ),
    ],
  );
}

// ============================ APILADOS ============================

Widget _columnasApiladas() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    series: <CartesianSeries<DatoCat, String>>[
      StackedColumnSeries<DatoCat, String>(
        name: 'Gastos',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y2,
      ),
      StackedColumnSeries<DatoCat, String>(
        name: 'Utilidad',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y3,
      ),
    ],
  );
}

Widget _barrasApiladas() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    series: <CartesianSeries<DatoCat, String>>[
      StackedBarSeries<DatoCat, String>(
        name: 'Gastos',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y2,
      ),
      StackedBarSeries<DatoCat, String>(
        name: 'Utilidad',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y3,
      ),
    ],
  );
}

Widget _areaApilada() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    series: <CartesianSeries<DatoCat, String>>[
      StackedAreaSeries<DatoCat, String>(
        name: 'Gastos',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y2,
      ),
      StackedAreaSeries<DatoCat, String>(
        name: 'Utilidad',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y3,
      ),
    ],
  );
}

Widget _lineaApilada() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    series: <CartesianSeries<DatoCat, String>>[
      StackedLineSeries<DatoCat, String>(
        name: 'Gastos',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y2,
        markerSettings: MarkerSettings(isVisible: true),
      ),
      StackedLineSeries<DatoCat, String>(
        name: 'Utilidad',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y3,
        markerSettings: MarkerSettings(isVisible: true),
      ),
    ],
  );
}

Widget _columnas100() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    series: <CartesianSeries<DatoCat, String>>[
      StackedColumn100Series<DatoCat, String>(
        name: 'Gastos',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y2,
      ),
      StackedColumn100Series<DatoCat, String>(
        name: 'Utilidad',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y3,
      ),
    ],
  );
}

Widget _barras100() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    series: <CartesianSeries<DatoCat, String>>[
      StackedBar100Series<DatoCat, String>(
        name: 'Gastos',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y2,
      ),
      StackedBar100Series<DatoCat, String>(
        name: 'Utilidad',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y3,
      ),
    ],
  );
}

Widget _area100() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    series: <CartesianSeries<DatoCat, String>>[
      StackedArea100Series<DatoCat, String>(
        name: 'Gastos',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y2,
      ),
      StackedArea100Series<DatoCat, String>(
        name: 'Utilidad',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y3,
      ),
    ],
  );
}

// ============================ RANGOS Y ESTADÍSTICOS ============================

const List<DatoRango> _temperaturas = [
  DatoRango('Ene', 12, 24),
  DatoRango('Feb', 13, 25),
  DatoRango('Mar', 14, 27),
  DatoRango('Abr', 15, 28),
  DatoRango('May', 14, 26),
  DatoRango('Jun', 12, 23),
];

Widget _columnasRango() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    primaryYAxis: NumericAxis(title: AxisTitle(text: 'Temperatura °C')),
    series: <CartesianSeries<DatoRango, String>>[
      RangeColumnSeries<DatoRango, String>(
        dataSource: _temperaturas,
        xValueMapper: (DatoRango d, _) => d.x,
        lowValueMapper: (DatoRango d, _) => d.bajo,
        highValueMapper: (DatoRango d, _) => d.alto,
        color: Colors.lightBlue,
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ],
  );
}

Widget _areaRango() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    primaryYAxis: NumericAxis(title: AxisTitle(text: 'Temperatura °C')),
    series: <CartesianSeries<DatoRango, String>>[
      RangeAreaSeries<DatoRango, String>(
        dataSource: _temperaturas,
        xValueMapper: (DatoRango d, _) => d.x,
        lowValueMapper: (DatoRango d, _) => d.bajo,
        highValueMapper: (DatoRango d, _) => d.alto,
        color: Colors.teal,
        opacity: 0.5,
        borderColor: Colors.teal,
        borderWidth: 2,
      ),
    ],
  );
}

Widget _histograma() {
  final r = math.Random(5);
  final datos = List.generate(
    150,
    (_) => DatoNum(
        0,
        (r.nextDouble() + r.nextDouble() + r.nextDouble() + r.nextDouble()) *
            25),
  );
  return SfCartesianChart(
    primaryXAxis: NumericAxis(),
    series: <CartesianSeries<DatoNum, double>>[
      HistogramSeries<DatoNum, double>(
        dataSource: datos,
        yValueMapper: (DatoNum d, _) => d.y,
        binInterval: 10,
        showNormalDistributionCurve: true,
        curveColor: Colors.red,
        color: Colors.indigo,
      ),
    ],
  );
}

Widget _cascada() {
  const datos = [
    DatoCascada('Inicial', 100),
    DatoCascada('Ventas', 50),
    DatoCascada('Costos', -30),
    DatoCascada('Impuestos', -15),
    DatoCascada('Bonos', 20),
    DatoCascada('Final', 0, true),
  ];
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCascada, String>>[
      WaterfallSeries<DatoCascada, String>(
        dataSource: datos,
        xValueMapper: (DatoCascada d, _) => d.x,
        yValueMapper: (DatoCascada d, _) => d.y,
        totalSumPredicate: (DatoCascada d, _) => d.esTotal,
        negativePointsColor: Colors.red,
        totalSumColor: Colors.indigo,
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ],
  );
}

// ============================ REGISTRO ============================

final List<GraficoItem> basicosCartesianos = [
  GraficoItem('Línea simple', 'Evolución de una sola serie.', _lineaSimple),
  GraficoItem('Línea con marcadores', 'Marcadores en forma de diamante, etiquetas y tooltip.', _lineaMarcadores),
  GraficoItem('Línea múltiple', 'Tres series comparadas con leyenda.', _lineaMultiple),
  GraficoItem('Spline', 'Línea suavizada con curvas.', _spline),
  GraficoItem('Línea escalón', 'Los valores cambian en saltos.', _lineaEscalon),
  GraficoItem('Línea rápida', '1000 puntos con FastLineSeries (alto rendimiento).', _lineaRapida),
  GraficoItem('Línea con fechas', 'Eje X de tipo DateTimeAxis.', _lineaFechas),
  GraficoItem('Columnas', 'Columnas con esquinas redondeadas.', _columnas),
  GraficoItem('Columnas con color por punto', 'Cada columna con su propio color.', _columnasColor),
  GraficoItem('Columnas agrupadas', 'Dos series lado a lado.', _columnasAgrupadas),
  GraficoItem('Barras horizontales', 'Barras con etiquetas de datos.', _barras),
  GraficoItem('Barras agrupadas', 'Dos series en barras horizontales.', _barrasAgrupadas),
  GraficoItem('Área', 'Área rellena semitransparente.', _area),
  GraficoItem('Spline área', 'Área con borde suavizado.', _splineArea),
  GraficoItem('Área escalón', 'Área con cambios en escalón.', _areaEscalon),
  GraficoItem('Dispersión', '40 puntos aleatorios (ScatterSeries).', _dispersion),
  GraficoItem('Burbujas', 'El tamaño de cada burbuja es una tercera variable.', _burbujas),
  GraficoItem('Columnas apiladas', 'Gastos + utilidad apilados.', _columnasApiladas),
  GraficoItem('Barras apiladas', 'Versión horizontal apilada.', _barrasApiladas),
  GraficoItem('Área apilada', 'Áreas acumuladas.', _areaApilada),
  GraficoItem('Línea apilada', 'Líneas acumuladas.', _lineaApilada),
  GraficoItem('Columnas apiladas 100%', 'Muestra la proporción de cada serie.', _columnas100),
  GraficoItem('Barras apiladas 100%', 'Proporciones en barras.', _barras100),
  GraficoItem('Área apilada 100%', 'Proporciones en áreas.', _area100),
  GraficoItem('Columnas de rango', 'Mínimo y máximo por mes.', _columnasRango),
  GraficoItem('Área de rango', 'Banda entre mínimo y máximo.', _areaRango),
  GraficoItem('Histograma', 'Distribución de frecuencias con curva normal.', _histograma),
  GraficoItem('Cascada', 'Cómo suman y restan los valores hasta el total.', _cascada),
];
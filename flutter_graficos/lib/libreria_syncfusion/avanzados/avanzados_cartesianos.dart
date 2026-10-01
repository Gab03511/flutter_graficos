import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../comun/grafico_item.dart';
import '../models/datos.dart';

Legend _leyenda() => Legend(isVisible: true, position: LegendPosition.bottom);

List<DatoOhlc> _ohlc() {
  final base = DateTime(2026, 1, 5);
  final r = math.Random(7);
  double precio = 100;
  return List.generate(30, (i) {
    final abierto = precio;
    final cierre = abierto + (r.nextDouble() - 0.5) * 10;
    final alto = math.max(abierto, cierre) + r.nextDouble() * 4;
    final bajo = math.min(abierto, cierre) - r.nextDouble() * 4;
    precio = cierre;
    return DatoOhlc(base.add(Duration(days: i)), abierto, alto, bajo, cierre);
  });
}

// 1 ─────────────────────────────────────────────
Widget _velas() {
  return SfCartesianChart(
    primaryXAxis: DateTimeAxis(majorGridLines: MajorGridLines(width: 0)),
    primaryYAxis: NumericAxis(rangePadding: ChartRangePadding.additional),
    zoomPanBehavior: ZoomPanBehavior(enablePinching: true, enablePanning: true),
    series: <CartesianSeries<DatoOhlc, DateTime>>[
      CandleSeries<DatoOhlc, DateTime>(
        dataSource: _ohlc(),
        xValueMapper: (DatoOhlc d, _) => d.x,
        lowValueMapper: (DatoOhlc d, _) => d.bajo,
        highValueMapper: (DatoOhlc d, _) => d.alto,
        openValueMapper: (DatoOhlc d, _) => d.abierto,
        closeValueMapper: (DatoOhlc d, _) => d.cierre,
        bullColor: Colors.green,
        bearColor: Colors.red,
      ),
    ],
  );
}

// 2 ─────────────────────────────────────────────
Widget _hiloOpenClose() {
  return SfCartesianChart(
    primaryXAxis: DateTimeAxis(majorGridLines: MajorGridLines(width: 0)),
    primaryYAxis: NumericAxis(rangePadding: ChartRangePadding.additional),
    tooltipBehavior: TooltipBehavior(enable: true),
    series: <CartesianSeries<DatoOhlc, DateTime>>[
      HiloOpenCloseSeries<DatoOhlc, DateTime>(
        dataSource: _ohlc(),
        xValueMapper: (DatoOhlc d, _) => d.x,
        lowValueMapper: (DatoOhlc d, _) => d.bajo,
        highValueMapper: (DatoOhlc d, _) => d.alto,
        openValueMapper: (DatoOhlc d, _) => d.abierto,
        closeValueMapper: (DatoOhlc d, _) => d.cierre,
        bullColor: Colors.teal,
        bearColor: Colors.deepOrange,
      ),
    ],
  );
}

// 3 ─────────────────────────────────────────────
Widget _cajaBigotes() {
  const datos = [
    DatoCaja('Norte', [10, 12, 14, 15, 16, 18, 20, 35]),
    DatoCaja('Sur', [8, 9, 11, 13, 14, 15, 17, 19]),
    DatoCaja('Este', [15, 18, 20, 22, 24, 25, 28, 30]),
    DatoCaja('Oeste', [5, 7, 9, 10, 12, 13, 14, 16]),
  ];
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCaja, String>>[
      BoxAndWhiskerSeries<DatoCaja, String>(
        dataSource: datos,
        xValueMapper: (DatoCaja d, _) => d.x,
        yValueMapper: (DatoCaja d, _) => d.valores,
        boxPlotMode: BoxPlotMode.normal,
        showMean: true,
      ),
    ],
  );
}

// 4 ─────────────────────────────────────────────
Widget _barraError() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      LineSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        markerSettings: MarkerSettings(isVisible: true),
      ),
      ErrorBarSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        type: ErrorBarType.fixed,
        verticalErrorValue: 6,
        capLength: 10,
        color: Colors.red,
      ),
    ],
  );
}

// 5 ─────────────────────────────────────────────
Widget _combinado() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    series: <CartesianSeries<DatoCat, String>>[
      ColumnSeries<DatoCat, String>(
        name: 'Ventas',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
      ),
      LineSeries<DatoCat, String>(
        name: 'Utilidad',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y3,
        color: Colors.red,
        width: 3,
        markerSettings: MarkerSettings(isVisible: true),
      ),
    ],
  );
}

// 6 ─────────────────────────────────────────────
Widget _dobleEje() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    primaryYAxis: NumericAxis(title: AxisTitle(text: 'Ventas')),
    axes: <ChartAxis>[
      NumericAxis(
        name: 'ejeSecundario',
        opposedPosition: true,
        title: AxisTitle(text: 'Utilidad'),
        majorGridLines: MajorGridLines(width: 0),
      ),
    ],
    legend: _leyenda(),
    series: <CartesianSeries<DatoCat, String>>[
      ColumnSeries<DatoCat, String>(
        name: 'Ventas',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
      ),
      LineSeries<DatoCat, String>(
        name: 'Utilidad',
        yAxisName: 'ejeSecundario',
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y3,
        color: Colors.deepOrange,
        markerSettings: MarkerSettings(isVisible: true),
      ),
    ],
  );
}

// 7 ─────────────────────────────────────────────
Widget _zoom() {
  final datos = List.generate(
    200,
    (i) => DatoNum(i.toDouble(), math.sin(i / 10) * 40 + math.cos(i / 3) * 8),
  );
  return SfCartesianChart(
    primaryXAxis: NumericAxis(),
    zoomPanBehavior: ZoomPanBehavior(
      enablePinching: true,
      enablePanning: true,
      enableDoubleTapZooming: true,
      enableMouseWheelZooming: true,
      zoomMode: ZoomMode.x,
    ),
    series: <CartesianSeries<DatoNum, double>>[
      LineSeries<DatoNum, double>(
        dataSource: datos,
        xValueMapper: (DatoNum d, _) => d.x,
        yValueMapper: (DatoNum d, _) => d.y,
      ),
    ],
  );
}

// 8 ─────────────────────────────────────────────
Widget _trackball() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    legend: _leyenda(),
    trackballBehavior: TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: InteractiveTooltip(enable: true),
      tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
    ),
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

// 9 ─────────────────────────────────────────────
Widget _crosshair() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    crosshairBehavior: CrosshairBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      lineType: CrosshairLineType.both,
    ),
    series: <CartesianSeries<DatoCat, String>>[
      SplineSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        markerSettings: MarkerSettings(isVisible: true),
      ),
    ],
  );
}

// 10 ─────────────────────────────────────────────
Widget _seleccion() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      ColumnSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        selectionBehavior: SelectionBehavior(
          enable: true,
          selectedColor: Colors.deepOrange,
          unselectedColor: Colors.grey.shade300,
        ),
      ),
    ],
  );
}

// 11 ─────────────────────────────────────────────
Widget _anotaciones() {
  const datos = [
    DatoNum(0, 20),
    DatoNum(1, 35),
    DatoNum(2, 28),
    DatoNum(3, 50),
    DatoNum(4, 42),
    DatoNum(5, 70),
    DatoNum(6, 55),
    DatoNum(7, 63),
    DatoNum(8, 48),
    DatoNum(9, 60),
  ];
  return SfCartesianChart(
    primaryXAxis: NumericAxis(),
    primaryYAxis: NumericAxis(maximum: 90),
    annotations: <CartesianChartAnnotation>[
      CartesianChartAnnotation(
        widget: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text('Máximo: 70',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        coordinateUnit: CoordinateUnit.point,
        x: 5,
        y: 78,
      ),
    ],
    series: <CartesianSeries<DatoNum, double>>[
      LineSeries<DatoNum, double>(
        dataSource: datos,
        xValueMapper: (DatoNum d, _) => d.x,
        yValueMapper: (DatoNum d, _) => d.y,
        markerSettings: MarkerSettings(isVisible: true),
      ),
    ],
  );
}

// 12 ─────────────────────────────────────────────
Widget _tendencia() {
  final r = math.Random(11);
  final datos = List.generate(
    20,
    (i) => DatoNum(i.toDouble(), 5 + i * 2.0 + r.nextDouble() * 12),
  );
  return SfCartesianChart(
    primaryXAxis: NumericAxis(),
    legend: _leyenda(),
    series: <CartesianSeries<DatoNum, double>>[
      ScatterSeries<DatoNum, double>(
        name: 'Datos',
        dataSource: datos,
        xValueMapper: (DatoNum d, _) => d.x,
        yValueMapper: (DatoNum d, _) => d.y,
        trendlines: <Trendline>[
          Trendline(
            type: TrendlineType.linear,
            name: 'Tendencia',
            color: Colors.red,
            width: 2,
            forwardForecast: 3,
          ),
        ],
      ),
    ],
  );
}

// 13 ─────────────────────────────────────────────
Widget _bandas() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    primaryYAxis: NumericAxis(
      plotBands: <PlotBand>[
        PlotBand(
          isVisible: true,
          start: 40,
          end: 60,
          color: Colors.green.shade100,
          borderColor: Colors.green,
          borderWidth: 1,
          text: 'Zona objetivo',
        ),
      ],
    ),
    series: <CartesianSeries<DatoCat, String>>[
      ColumnSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
      ),
    ],
  );
}

// 14 ─────────────────────────────────────────────
Widget _tooltipPersonalizado() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    tooltipBehavior: TooltipBehavior(
      enable: true,
      builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
          int seriesIndex) {
        final d = data as DatoCat;
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(d.x,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Text('Ventas: \$${d.y.toInt()}k',
                  style: const TextStyle(color: Colors.white)),
              Text('Utilidad: \$${d.y3.toInt()}k',
                  style: const TextStyle(color: Colors.amber)),
            ],
          ),
        );
      },
    ),
    series: <CartesianSeries<DatoCat, String>>[
      ColumnSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
      ),
    ],
  );
}

// 15 ─────────────────────────────────────────────
Widget _etiquetaPlantilla() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      ColumnSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          builder: (dynamic data, dynamic point, dynamic series,
              int pointIndex, int seriesIndex) {
            final d = data as DatoCat;
            final sube = d.y >= 40;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(sube ? Icons.arrow_upward : Icons.arrow_downward,
                    size: 14, color: sube ? Colors.green : Colors.red),
                Text('${d.y.toInt()}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            );
          },
        ),
      ),
    ],
  );
}

// 16 ─────────────────────────────────────────────
Widget _areaDegradado() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      AreaSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        gradient: LinearGradient(
          colors: [Colors.indigo, Colors.indigo.shade50],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderColor: Colors.indigo,
        borderWidth: 2,
      ),
    ],
  );
}

// 17 ─────────────────────────────────────────────
class _TiempoReal extends StatefulWidget {
  const _TiempoReal();

  @override
  State<_TiempoReal> createState() => _TiempoRealState();
}

class _TiempoRealState extends State<_TiempoReal> {
  final List<DatoNum> _datos = [];
  final math.Random _r = math.Random();
  Timer? _timer;
  int _t = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 30; i++) {
      _agregar();
    }
    _timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      setState(_agregar);
    });
  }

  void _agregar() {
    _datos.add(DatoNum(
        _t.toDouble(), 50 + 30 * math.sin(_t / 6) + _r.nextDouble() * 10));
    _t++;
    if (_datos.length > 30) _datos.removeAt(0);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: NumericAxis(),
      primaryYAxis: NumericAxis(minimum: 0, maximum: 100),
      series: <CartesianSeries<DatoNum, double>>[
        SplineSeries<DatoNum, double>(
          dataSource: _datos,
          animationDuration: 0,
          xValueMapper: (DatoNum d, _) => d.x,
          yValueMapper: (DatoNum d, _) => d.y,
          color: Colors.green,
          width: 3,
        ),
      ],
    );
  }
}

// 18 ─────────────────────────────────────────────
Widget _logaritmico() {
  const datos = [
    DatoNum(1, 5),
    DatoNum(2, 40),
    DatoNum(3, 300),
    DatoNum(4, 2500),
    DatoNum(5, 18000),
    DatoNum(6, 150000),
    DatoNum(7, 1200000),
  ];
  return SfCartesianChart(
    primaryXAxis: NumericAxis(),
    primaryYAxis: LogarithmicAxis(minorTicksPerInterval: 4),
    series: <CartesianSeries<DatoNum, double>>[
      LineSeries<DatoNum, double>(
        dataSource: datos,
        xValueMapper: (DatoNum d, _) => d.x,
        yValueMapper: (DatoNum d, _) => d.y,
        markerSettings: MarkerSettings(isVisible: true),
      ),
    ],
  );
}

// 19 ─────────────────────────────────────────────
Widget _transpuesto() {
  return SfCartesianChart(
    isTransposed: true,
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      AreaSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        color: Colors.purple,
        opacity: 0.5,
        borderColor: Colors.purple,
        borderWidth: 2,
      ),
    ],
  );
}

// 20 ─────────────────────────────────────────────
Widget _scrollHorizontal() {
  final datos = List.generate(
    24,
    (i) => DatoCat('M${i + 1}', (20 + (i * 7) % 45).toDouble()),
  );
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(initialVisibleMinimum: 0, initialVisibleMaximum: 6),   // ✅
    zoomPanBehavior: ZoomPanBehavior(enablePanning: true),
    series: <CartesianSeries<DatoCat, String>>[
      ColumnSeries<DatoCat, String>(
        dataSource: datos,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        color: Colors.cyan.shade700,
      ),
    ],
  );
}

// 21 ─────────────────────────────────────────────
Widget _puntosVacios() {
  const datos = [
    DatoNulo('Ene', 30),
    DatoNulo('Feb', 45),
    DatoNulo('Mar', null),
    DatoNulo('Abr', 50),
    DatoNulo('May', null),
    DatoNulo('Jun', 35),
    DatoNulo('Jul', 60),
  ];
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoNulo, String>>[
      LineSeries<DatoNulo, String>(
        dataSource: datos,
        xValueMapper: (DatoNulo d, _) => d.x,
        yValueMapper: (DatoNulo d, _) => d.y,
        emptyPointSettings: EmptyPointSettings(mode: EmptyPointMode.gap),
        markerSettings: MarkerSettings(isVisible: true),
      ),
    ],
  );
}

// 22 ─────────────────────────────────────────────
Widget _eventoToque() {
  return Builder(
    builder: (context) => SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      series: <CartesianSeries<DatoCat, String>>[
        ColumnSeries<DatoCat, String>(
          dataSource: ventasMensuales,
          xValueMapper: (DatoCat d, _) => d.x,
          yValueMapper: (DatoCat d, _) => d.y,
          onPointTap: (ChartPointDetails detalle) {
            final i = detalle.pointIndex;
            if (i == null) return;
            final d = ventasMensuales[i];
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text('${d.x}: ventas de \$${d.y.toInt()}k')));
          },
        ),
      ],
    ),
  );
}

// 23 ─────────────────────────────────────────────
Widget _lineaColorTramo() {
  return SfCartesianChart(
    primaryXAxis: CategoryAxis(),
    series: <CartesianSeries<DatoCat, String>>[
      LineSeries<DatoCat, String>(
        dataSource: ventasMensuales,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        pointColorMapper: (DatoCat d, _) => d.y >= 50
            ? Colors.green
            : (d.y < 35 ? Colors.red : Colors.orange),
        width: 4,
        markerSettings: MarkerSettings(isVisible: true),
      ),
    ],
  );
}

final List<GraficoItem> avanzadosCartesianos = [
  GraficoItem('Velas japonesas', 'CandleSeries con zoom y paneo (datos financieros).', _velas),
  GraficoItem('Hilo abierto-cierre', 'HiloOpenCloseSeries con tooltip.', _hiloOpenClose),
  GraficoItem('Caja y bigotes', 'Diagrama estadístico con la media.', _cajaBigotes),
  GraficoItem('Barras de error', 'Incertidumbre sobre una serie de línea.', _barraError),
  GraficoItem('Combinado columnas + línea', 'Dos tipos de serie en un mismo gráfico.', _combinado),
  GraficoItem('Doble eje Y', 'Eje secundario a la derecha.', _dobleEje),
  GraficoItem('Zoom y desplazamiento', 'Pellizca, arrastra o haz doble toque.', _zoom),
  GraficoItem('Trackball', 'Toca para ver todas las series a la vez.', _trackball),
  GraficoItem('Crosshair', 'Cruz de seguimiento al tocar.', _crosshair),
  GraficoItem('Selección', 'Toca una columna para resaltarla.', _seleccion),
  GraficoItem('Anotaciones', 'Widgets Flutter ubicados sobre el gráfico.', _anotaciones),
  GraficoItem('Línea de tendencia', 'Regresión lineal con proyección.', _tendencia),
  GraficoItem('Bandas de trazado', 'Zona resaltada en el eje Y.', _bandas),
  GraficoItem('Tooltip personalizado', 'Tooltip construido con tus propios widgets.', _tooltipPersonalizado),
  GraficoItem('Etiquetas con plantilla', 'Iconos y texto dentro de la etiqueta de datos.', _etiquetaPlantilla),
  GraficoItem('Área con degradado', 'Relleno con LinearGradient.', _areaDegradado),
  GraficoItem('Tiempo real', 'Se actualiza cada 500 ms.', () => const _TiempoReal()),
  GraficoItem('Eje logarítmico', 'Para datos que crecen exponencialmente.', _logaritmico),
  GraficoItem('Gráfico transpuesto', 'Ejes intercambiados (isTransposed).', _transpuesto),
  GraficoItem('Scroll horizontal', 'Muestra 6 columnas y desliza para ver el resto.', _scrollHorizontal),
  GraficoItem('Puntos vacíos', 'Valores null mostrados como huecos.', _puntosVacios),
  GraficoItem('Evento al tocar', 'Toca una columna y aparece un SnackBar.', _eventoToque),
  GraficoItem('Línea con color por tramo', 'El color cambia según el valor.', _lineaColorTramo),
];
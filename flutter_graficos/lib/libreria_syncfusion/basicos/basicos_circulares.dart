import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../comun/grafico_item.dart';
import '../models/datos.dart';

Legend _leyenda([LegendPosition pos = LegendPosition.bottom]) =>
    Legend(isVisible: true, position: pos, overflowMode: LegendItemOverflowMode.wrap);

Widget _pastel() {
  return SfCircularChart(
    legend: _leyenda(),
    tooltipBehavior: TooltipBehavior(enable: true),
    series: <CircularSeries<DatoCat, String>>[
      PieSeries<DatoCat, String>(
        dataSource: categorias,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ],
  );
}

Widget _dona() {
  return SfCircularChart(
    legend: _leyenda(),
    series: <CircularSeries<DatoCat, String>>[
      DoughnutSeries<DatoCat, String>(
        dataSource: categorias,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        innerRadius: '55%',
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ],
  );
}

Widget _pastelPorcentaje() {
  return SfCircularChart(
    legend: _leyenda(LegendPosition.right),
    series: <CircularSeries<DatoCat, String>>[
      PieSeries<DatoCat, String>(
        dataSource: categorias,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        dataLabelMapper: (DatoCat d, _) => '${d.y.toInt()}%',
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          textStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    ],
  );
}

Widget _semiPastel() {
  return SfCircularChart(
    legend: _leyenda(),
    series: <CircularSeries<DatoCat, String>>[
      PieSeries<DatoCat, String>(
        dataSource: categorias,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        startAngle: 270,
        endAngle: 90,
        radius: '100%',
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ],
  );
}

Widget _donaTextoCentral() {
  return SfCircularChart(
    legend: _leyenda(),
    annotations: <CircularChartAnnotation>[
      CircularChartAnnotation(
        widget: const Text(
          'Total\n100%',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ],
    series: <CircularSeries<DatoCat, String>>[
      DoughnutSeries<DatoCat, String>(
        dataSource: categorias,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        innerRadius: '65%',
      ),
    ],
  );
}

Widget _barraRadial() {
  const datos = [
    DatoCat('Ventas', 80),
    DatoCat('Metas', 65),
    DatoCat('Clientes', 45),
    DatoCat('Soporte', 90),
  ];
  return SfCircularChart(
    legend: _leyenda(),
    series: <CircularSeries<DatoCat, String>>[
      RadialBarSeries<DatoCat, String>(
        dataSource: datos,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        maximumValue: 100,
        gap: '8%',
        radius: '95%',
        cornerStyle: CornerStyle.bothCurve,
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ],
  );
}

Widget _piramide() {
  const datos = [
    DatoCat('Dirección', 5),
    DatoCat('Gerencia', 15),
    DatoCat('Jefaturas', 30),
    DatoCat('Operativos', 50),
  ];
  return SfPyramidChart(
    legend: _leyenda(),
    series: PyramidSeries<DatoCat, String>(
      dataSource: datos,
      xValueMapper: (DatoCat d, _) => d.x,
      yValueMapper: (DatoCat d, _) => d.y,
      dataLabelSettings: DataLabelSettings(isVisible: true),
    ),
  );
}

Widget _embudo() {
  const datos = [
    DatoCat('Visitas', 1000),
    DatoCat('Registros', 600),
    DatoCat('Pruebas', 300),
    DatoCat('Compras', 120),
  ];
  return SfFunnelChart(
    legend: _leyenda(),
    series: FunnelSeries<DatoCat, String>(
      dataSource: datos,
      xValueMapper: (DatoCat d, _) => d.x,
      yValueMapper: (DatoCat d, _) => d.y,
      dataLabelSettings: DataLabelSettings(isVisible: true),
    ),
  );
}

final List<GraficoItem> basicosCirculares = [
  GraficoItem('Pastel', 'Gráfico circular clásico con tooltip.', _pastel),
  GraficoItem('Dona', 'Pastel con radio interior.', _dona),
  GraficoItem('Pastel con porcentajes', 'Etiquetas en % y leyenda lateral.', _pastelPorcentaje),
  GraficoItem('Semi pastel', 'Medio círculo (startAngle / endAngle).', _semiPastel),
  GraficoItem('Dona con texto central', 'Usa CircularChartAnnotation.', _donaTextoCentral),
  GraficoItem('Barra radial', 'Progreso circular por categoría.', _barraRadial),
  GraficoItem('Pirámide', 'SfPyramidChart.', _piramide),
  GraficoItem('Embudo', 'SfFunnelChart para conversiones.', _embudo),
];
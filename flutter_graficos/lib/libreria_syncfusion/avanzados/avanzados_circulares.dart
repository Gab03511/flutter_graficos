import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../comun/grafico_item.dart';
import '../models/datos.dart';

Widget _pastelConectores() {
  return SfCircularChart(
    legend: Legend(isVisible: true, position: LegendPosition.bottom),
    tooltipBehavior: TooltipBehavior(enable: true),
    series: <CircularSeries<DatoCat, String>>[
      PieSeries<DatoCat, String>(
        dataSource: categorias,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        radius: '65%',
        explode: true,
        explodeIndex: 0,
        explodeOffset: '12%',
        selectionBehavior: SelectionBehavior(enable: true),
        dataLabelMapper: (DatoCat d, _) => '${d.x}\n${d.y.toInt()}%',
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          labelPosition: ChartDataLabelPosition.outside,
          useSeriesColor: true,
          connectorLineSettings: ConnectorLineSettings(
            type: ConnectorType.curve,
            length: '15%',
          ),
        ),
      ),
    ],
  );
}

Widget _donaDosAnillos() {
  return SfCircularChart(
    legend: Legend(isVisible: true, position: LegendPosition.bottom),
    tooltipBehavior: TooltipBehavior(enable: true),
    series: <CircularSeries<DatoCat, String>>[
      // Anillo exterior: año actual
      DoughnutSeries<DatoCat, String>(
        name: 'Actual',
        dataSource: categorias,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y,
        radius: '100%',
        innerRadius: '70%',
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
      // Anillo interior: año anterior
      DoughnutSeries<DatoCat, String>(
        name: 'Anterior',
        dataSource: categorias,
        xValueMapper: (DatoCat d, _) => d.x,
        yValueMapper: (DatoCat d, _) => d.y2,
        radius: '65%',
        innerRadius: '45%',
        dataLabelSettings: DataLabelSettings(isVisible: true),
      ),
    ],
  );
}

final List<GraficoItem> avanzadosCirculares = [
  GraficoItem('Pastel con conectores', 'Etiquetas externas, sector separado y selección.', _pastelConectores),
  GraficoItem('Dona de dos anillos', 'Dos series concéntricas: año actual vs anterior.', _donaDosAnillos),
];
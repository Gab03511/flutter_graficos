import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'models/chart_data.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      CategoriaData('Alimentos', 40),
      CategoriaData('Transporte', 20),
      CategoriaData('Ocio', 15),
      CategoriaData('Servicios', 25),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion - Circular')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SfCircularChart(
          title: ChartTitle(text: 'Gastos por categoría'),
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CircularSeries<CategoriaData, String>>[
            PieSeries<CategoriaData, String>(
              dataSource: datos,
              xValueMapper: (CategoriaData d, _) => d.categoria,
              yValueMapper: (CategoriaData d, _) => d.porcentaje,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              explode: true, // separa el sector al tocarlo
            ),
          ],
        ),
      ),
    );
  }
}
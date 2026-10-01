import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'models/chart_data.dart';

class BarChartPage extends StatelessWidget {
  const BarChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      VentasData('Ene', 35),
      VentasData('Feb', 28),
      VentasData('Mar', 54),
      VentasData('Abr', 42),
      VentasData('May', 65),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion - Barras')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SfCartesianChart(
          title: ChartTitle(text: 'Ventas por mes'),
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryXAxis: CategoryAxis(),
          series: <CartesianSeries<VentasData, String>>[
            ColumnSeries<VentasData, String>(
              dataSource: datos,
              xValueMapper: (VentasData d, _) => d.mes,
              yValueMapper: (VentasData d, _) => d.ventas,
              color: Colors.indigo,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}
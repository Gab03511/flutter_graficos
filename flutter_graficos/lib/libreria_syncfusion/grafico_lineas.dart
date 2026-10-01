import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'models/chart_data.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final datos = [
      VentasData('Ene', 35),
      VentasData('Feb', 28),
      VentasData('Mar', 54),
      VentasData('Abr', 42),
      VentasData('May', 65),
      VentasData('Jun', 58),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Syncfusion - Líneas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SfCartesianChart(
          title: ChartTitle(text: 'Ventas mensuales'),
          legend: Legend(isVisible: true, position: LegendPosition.bottom),
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryXAxis: CategoryAxis(),
          primaryYAxis: NumericAxis(title: AxisTitle(text: 'Miles de \$')),
          series: <CartesianSeries<VentasData, String>>[
            LineSeries<VentasData, String>(
              name: 'Ventas',
              dataSource: datos,
              xValueMapper: (VentasData d, _) => d.mes,
              yValueMapper: (VentasData d, _) => d.ventas,
              markerSettings: const MarkerSettings(isVisible: true),
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ),
    );
  }
}
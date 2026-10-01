import 'package:flutter/material.dart';

/// Describe un gráfico: nombre, explicación y la función que lo construye.
class GraficoItem {
  final String titulo;
  final String descripcion;
  final Widget Function() builder;

  GraficoItem(this.titulo, this.descripcion, this.builder);
}

/// Pantalla genérica que muestra cualquier [GraficoItem].
class GraficoPage extends StatelessWidget {
  final GraficoItem item;
  final int numero;

  const GraficoPage({super.key, required this.item, required this.numero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$numero. ${item.titulo}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.descripcion,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 12),
            Expanded(child: item.builder()),
          ],
        ),
      ),
    );
  }
}
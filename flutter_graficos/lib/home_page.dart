import 'package:flutter/material.dart';

import 'libreria_syncfusion/avanzados/avanzados.dart';
import 'libreria_syncfusion/basicos/basicos.dart';
import 'libreria_syncfusion/comun/grafico_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gráficos Syncfusion'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Básicos (${graficosBasicos.length})'),
              Tab(text: 'Avanzados (${graficosAvanzados.length})'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _Lista(items: graficosBasicos),
            _Lista(items: graficosAvanzados),
          ],
        ),
      ),
    );
  }
}

class _Lista extends StatelessWidget {
  final List<GraficoItem> items;
  const _Lista({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      // ignore: unnecessary_underscores
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final item = items[i];
        return ListTile(
          leading: CircleAvatar(child: Text('${i + 1}')),
          title: Text(item.titulo),
          subtitle:
              Text(item.descripcion, maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => GraficoPage(item: item, numero: i + 1),
            ),
          ),
        );
      },
    );
  }
}
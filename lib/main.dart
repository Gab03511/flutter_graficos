import 'package:flutter/material.dart';

import 'graficas_avanzadas.dart';
import 'graficas_basicas.dart';

void main() => runApp(const MaterialApp(home: MenuPrincipal()));

const List<Widget> _basicas = [
  ChartBasica01(),
  ChartBasica02(),
  ChartBasica03(),
  ChartBasica04(),
  ChartBasica05(),
  ChartBasica06(),
  ChartBasica07(),
  ChartBasica08(),
  ChartBasica09(),
  ChartBasica10(),
  ChartBasica11(),
  ChartBasica12(),
  ChartBasica13(),
  ChartBasica14(),
  ChartBasica15(),
  ChartBasica16(),
  ChartBasica17(),
  ChartBasica18(),
  ChartBasica19(),
  ChartBasica20(),
  ChartBasica21(),
  ChartBasica22(),
  ChartBasica23(),
  ChartBasica24(),
  ChartBasica25(),
  ChartBasica26(),
  ChartBasica27(),
  ChartBasica28(),
  ChartBasica29(),
  ChartBasica30(),
  ChartBasica31(),
  ChartBasica32(),
  ChartBasica33(),
  ChartBasica34(),
  ChartBasica35(),
  ChartBasica36(),
  ChartBasica37(),
  ChartBasica38(),
  ChartBasica39(),
  ChartBasica40(),
];

const List<Widget> _avanzadas = [
  ChartAvanzada01(),
  ChartAvanzada02(),
  ChartAvanzada03(),
  ChartAvanzada04(),
  ChartAvanzada05(),
  ChartAvanzada06(),
  ChartAvanzada07(),
  ChartAvanzada08(),
  ChartAvanzada09(),
  ChartAvanzada10(),
  ChartAvanzada11(),
  ChartAvanzada12(),
  ChartAvanzada13(),
  ChartAvanzada14(),
  ChartAvanzada15(),
  ChartAvanzada16(),
  ChartAvanzada17(),
  ChartAvanzada18(),
  ChartAvanzada19(),
  ChartAvanzada20(),
  ChartAvanzada21(),
  ChartAvanzada22(),
  ChartAvanzada23(),
  ChartAvanzada24(),
  ChartAvanzada25(),
];

class _Tarjeta extends StatelessWidget {
  final Widget grafica;

  const _Tarjeta(this.grafica);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          elevation: 3,
          clipBehavior: Clip.antiAlias,
          child: SizedBox(height: 440, child: grafica),
        ),
      ),
    );
  }
}

class _ListaGraficas extends StatelessWidget {
  final List<Widget> graficas;

  const _ListaGraficas(this.graficas);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: graficas.length,
      itemBuilder: (context, i) => _Tarjeta(graficas[i]),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mis graficas'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Basicas (40)'),
              Tab(text: 'Avanzadas (25)'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [_ListaGraficas(_basicas), _ListaGraficas(_avanzadas)],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'graficas_basicas.dart';

void main() => runApp(const MaterialApp(home: MenuPrincipal()));

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis gráficas')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Básica 1: Barras'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica01()),
              );
            },
          ),
          ListTile(
            title: const Text('Básica 2: Líneas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica02()),
              );
            },
          ),
          ListTile(
            title: const Text('Básica 3: Pastel'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica03()),
              );
            },
          ),
          ListTile(
            title: const Text('Básica 4: Barras'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica04()),
              );
            },
          ),
          ListTile(
            title: const Text('Básica 5: Barras Horizontales'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica05()),
              );
            },
          ),
          ListTile(
            title: const Text('Básica 6: Barras Agrupadas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica06()),
              );
            },
          ),
          ListTile(
            title: const Text('Básica 7: Dispersión'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica07()),
              );
            },
          ),
          ListTile(
            title: const Text('Básica 8: Charmander vs Squirtle'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica08()),
              );
            },
          ),
          ListTile(
            title: const Text('Básica 9: Ataque total apilado'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica09()),
              );
            },
          ),
          ListTile(
            title: const Text('Básica 10: Ataque total apilado horizontal'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica10()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 11: Ataque total apilado horizontal con leyenda',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica11()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 12: Ataque total apilado horizontal con leyenda y animación',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica12()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 13: Ataque total apilado horizontal con leyenda, animación y colores personalizados',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica13()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 14: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica14()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 15: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica15()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 16: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica16()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 17: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica17()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 18: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica18()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 19: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica19()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 20: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica20()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 21: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica21()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 22: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica22()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 23: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica23()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 24: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica24()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 25: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica25()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 26: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica26()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 27: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica27()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 28: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica28()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Básica 29: Ataque total apilado horizontal con leyenda, animación, colores personalizados y etiquetas',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChartBasica29()),
              );
            },
          ),
        ],
      ),
    );
  }
}

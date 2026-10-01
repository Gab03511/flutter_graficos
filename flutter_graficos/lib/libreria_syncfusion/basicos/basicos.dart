import '../comun/grafico_item.dart';
import 'basicos_cartesianos.dart';
import 'basicos_circulares.dart';
import 'basicos_spark.dart';

/// 28 cartesianos + 8 circulares/pirámide/embudo + 4 spark = 40
final List<GraficoItem> graficosBasicos = [
  ...basicosCartesianos,
  ...basicosCirculares,
  ...basicosSpark,
];
import 'package:flutter/material.dart';

/// Dato con eje X de texto y hasta 3 valores numéricos.
class DatoCat {
  final String x;
  final double y;
  final double y2;
  final double y3;
  const DatoCat(this.x, this.y, [this.y2 = 0, this.y3 = 0]);
}

/// Dato con eje X numérico (y un tamaño opcional para burbujas).
class DatoNum {
  final double x;
  final double y;
  final double tam;
  const DatoNum(this.x, this.y, [this.tam = 1]);
}

/// Dato con eje X de fecha.
class DatoFecha {
  final DateTime x;
  final double y;
  final double y2;
  DatoFecha(this.x, this.y, [this.y2 = 0]);
}

/// Dato financiero (velas japonesas).
class DatoOhlc {
  final DateTime x;
  final double abierto;
  final double alto;
  final double bajo;
  final double cierre;
  DatoOhlc(this.x, this.abierto, this.alto, this.bajo, this.cierre);
}

/// Dato con rango (mínimo y máximo).
class DatoRango {
  final String x;
  final double bajo;
  final double alto;
  const DatoRango(this.x, this.bajo, this.alto);
}

/// Dato con lista de valores (diagrama de caja).
class DatoCaja {
  final String x;
  final List<double> valores;
  const DatoCaja(this.x, this.valores);
}

/// Dato que puede venir vacío (null).
class DatoNulo {
  final String x;
  final double? y;
  const DatoNulo(this.x, this.y);
}

/// Dato para gráfico de cascada.
class DatoCascada {
  final String x;
  final double y;
  final bool esTotal;
  const DatoCascada(this.x, this.y, [this.esTotal = false]);
}

/// Dato con color propio.
class DatoColor {
  final String x;
  final double y;
  final Color color;
  const DatoColor(this.x, this.y, this.color);
}

// ---------------- Datos de ejemplo reutilizables ----------------

/// y = Ventas, y2 = Gastos, y3 = Utilidad
const List<DatoCat> ventasMensuales = [
  DatoCat('Ene', 35, 28, 7),
  DatoCat('Feb', 28, 24, 4),
  DatoCat('Mar', 54, 40, 14),
  DatoCat('Abr', 42, 36, 6),
  DatoCat('May', 65, 48, 17),
  DatoCat('Jun', 58, 50, 8),
];

/// y = porcentaje año actual, y2 = porcentaje año anterior
const List<DatoCat> categorias = [
  DatoCat('Alimentos', 40, 35),
  DatoCat('Transporte', 20, 25),
  DatoCat('Ocio', 15, 10),
  DatoCat('Servicios', 25, 30),
];
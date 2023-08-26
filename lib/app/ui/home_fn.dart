part of 'home_page.dart';

String propinaFn(double cuenta, double propina, double personas) {
  double resultado = (cuenta * (propina / 100)) / personas;
  return resultado.toStringAsFixed(2);
}

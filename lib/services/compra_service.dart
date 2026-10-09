import '../models/compra_model.dart';

class CompraService {
 double calcularSubtotal(CompraModel compra){
  return compra.precio * compra.cantidad;
 } 
 double calcularDescuento(CompraModel compra){
  return calcularSubtotal(compra) * compra.porcentajeDescuento / 100;
 }
 double calcularTotal(CompraModel compra){
  return calcularSubtotal(compra) - calcularDescuento(compra);
 }
 double calcularCompra ({
  required String nombreProducto,
  required double precio,
  required int cantidad,
  required double porcentajeDescuento,
 }) {
  final compra = CompraModel(
   nombreProducto: nombreProducto,
   precio: precio,
   cantidad: cantidad,
   porcentajeDescuento: porcentajeDescuento,
  );
  return calcularTotal(compra);
 }

}

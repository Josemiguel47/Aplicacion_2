import 'package:flutter/material.dart';
import '../models/compra_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';

class ResultadoScreen extends StatelessWidget {
  final CompraModel compra;

  const ResultadoScreen({Key? key, required this.compra}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subtotal = compra.precio * compra.cantidad;
    final descuento = subtotal * (compra.porcentajeDescuento / 100);
    final total = subtotal - descuento;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado de la Compra'),
      ),
      body: SingleChildScrollView(
        child: CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Producto: ${compra.nombreProducto}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              const SizedBox(height: 8.0),
              Text('Precio unitario: \$${compra.precio.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
              Text('Cantidad: ${compra.cantidad}', style: const TextStyle(fontSize: 16)),
              Text('Subtotal: \$${subtotal.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16)),
              Text('Valor del descuento (${compra.porcentajeDescuento}%): -\$${descuento.toStringAsFixed(2)}', style: const TextStyle(fontSize: 16, color: Colors.red)),
              const SizedBox(height: 8.0),
              const Divider(),
              Text('Total a pagar: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
              const SizedBox(height: 24.0),
              CustomButton(
                text: 'Regresar',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
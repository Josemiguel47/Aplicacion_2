import 'package:flutter/material.dart';
import '../models/compra_model.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_container.dart';
import 'resultado_screen.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _nombreController = TextEditingController();
  final _precioController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _descuentoController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _precioController.dispose();
    _cantidadController.dispose();
    _descuentoController.dispose();
    super.dispose();
  }

  void _procesarCompra() {
    String nombre = _nombreController.text.trim();
    String precioText = _precioController.text.trim();
    String cantidadText = _cantidadController.text.trim();
    String descuentoText = _descuentoController.text.trim();

    // Validar que no estén vacíos
    if (nombre.isEmpty || precioText.isEmpty || cantidadText.isEmpty || descuentoText.isEmpty) {
      _mostrarAlerta('Por favor, llene todos los campos.');
      return;
    }

    double? precio = double.tryParse(precioText);
    int? cantidad = int.tryParse(cantidadText);
    double? descuento = double.tryParse(descuentoText);

    if (precio == null || cantidad == null || descuento == null) {
      _mostrarAlerta('Precio, cantidad y descuento deben ser valores numéricos válidos.');
      return;
    }

    
    final compraModel = CompraModel(
      nombreProducto: nombre,
      precio: precio,
      cantidad: cantidad,
      porcentajeDescuento: descuento,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoScreen(compra: compraModel),
      ),
    );
  }

  void _mostrarAlerta(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Compra'),
      ),
      body: SingleChildScrollView(
        child: CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: _nombreController,
                labelText: 'Nombre del producto', label: '',
              ),
              CustomTextField(
                controller: _precioController,
                labelText: 'Precio del producto',
                keyboardType: TextInputType.number, label: '',
              ),
              CustomTextField(
                controller: _cantidadController,
                labelText: 'Cantidad',
                keyboardType: TextInputType.number, label: '',
              ),
              CustomTextField(
                controller: _descuentoController,
                labelText: 'Porcentaje de descuento (%)',
                keyboardType: TextInputType.number, label: '',
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                text: 'Calcular compra',
                onPressed: _procesarCompra,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductoForm extends StatefulWidget {
  const ProductoForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProductoFormState();
  }
}

class _ProductoFormState extends State<ProductoForm> {
  final _formKey = GlobalKey<FormState>();
  final _codigoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _stockmaxController = TextEditingController();
  final _srockminController = TextEditingController();
  final _precioController = TextEditingController();
  final _codcatController = TextEditingController();
  @override
  void dispose() {
    _codigoController.dispose();
    _nombreController.dispose();
    _descripcionController.dispose();
    _cantidadController.dispose();
    _stockmaxController.dispose();
    _srockminController.dispose();
    _precioController.dispose();
    _codcatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear un Nuevo Producto'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _codigoController,
                  decoration: const InputDecoration(
                    labelText: 'Codigo',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un codigo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _nombreController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _descripcionController,
                  decoration: const InputDecoration(
                    labelText: 'Descripcion',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu mensaje';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _cantidadController,
                  decoration: const InputDecoration(
                    labelText: 'Cantidad',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa una cantidad';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _stockmaxController,
                  decoration: const InputDecoration(
                    labelText: 'Stock Max',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un stock maximo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _srockminController,
                  decoration: const InputDecoration(
                    labelText: 'Stock Min',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un stock minimo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _precioController,
                  decoration: const InputDecoration(
                    labelText: 'Precio',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un precio';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _codcatController,
                  decoration: const InputDecoration(
                    labelText: 'Codigo de la Categoria',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa un codigo de categoria';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Aquí iría la lógica para enviar el formulario
                      _createProducto();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Crear ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _createProducto() async {
    // 1. Construir el mapa con los datos del formulario
    final Map<String, String> productoData = {
      'codigo': _codigoController.text,
      'nombre': _nombreController.text,
      'descripcion': _descripcionController.text,
      'cantidad': _cantidadController.text,
      'stockMax': _stockmaxController.text,
      'stockMin': _srockminController.text,
      'precio': _precioController.text,
      'codCat': _codcatController.text,
    };

    // 2. Reemplazar con la URL de tu servidor
    final Uri url = Uri.parse('http://localhost:3333/api/v1/productos/save');

    // 3. Enviar la solicitud POST
    final response = await http.post(url, body: productoData);

    // 4. Manejar la respuesta
    if (response.statusCode == 200) {
      // Producto creado exitosamente
      print('Producto creado');
      // Puedes mostrar un mensaje de éxito al usuario
    } else {
      // Error al crear el producto
      print('Error: ${response.statusCode}');
      // Puedes mostrar un mensaje de error al usuario
    }
  }
}

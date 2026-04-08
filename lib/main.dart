import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MainApp(),
));

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}
class _MainAppState extends State<MainApp> {

  static const Color corFundo = Color(0xFFEDE7F6);      
  static const Color corCard = Color.fromARGB(255, 178, 141, 224);      
  static const Color corPrimaria = Color(0xFF9C27B0);  
  static const Color corSecundaria = Color.fromARGB(255, 153, 80, 171);
  static const Color corTexto = Color.fromARGB(255, 61, 24, 69);      
  static const Color corTextoCinza = Color.fromARGB(255, 72, 38, 134);
  static const Color corBorda = Color.fromARGB(255, 156, 107, 190);    

  final TextEditingController _gasolinaController = TextEditingController();
  final TextEditingController _etanolController = TextEditingController();

  String _resultado = "";

  void _calcular() {
    final double etanol = double.tryParse(_etanolController.text) ?? 0.0;
    final double gasolina = double.tryParse(_gasolinaController.text) ?? 0.0;

    if (etanol <= 0 || gasolina <= 0) {
      setState(() {
        _resultado = "Informe os valores dos combustíveis⛽";
      });
      return;
    }

    final double proporcao = etanol / gasolina;

    String mensagem = "";

    if (proporcao <= 0.7) {
      mensagem = "⛽ Etanol compensa mais!";
    } else {
      mensagem = "⛽ Gasolina compensa mais!";
    }

    setState(() {
      _resultado =
          "Porcentagem: ${(proporcao * 100).toStringAsFixed(0)}%\n\n"
          "$mensagem";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corFundo,
      appBar: AppBar(
        backgroundColor: corCard,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "✨ Calculadora de Combustível ✨",
          style: TextStyle(
            color: corSecundaria,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: corCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: corBorda, width: 1),
              ),
              child: Text(
                "Informe a quantidade de combustível:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: corTextoCinza,
                  height: 1.5,
                ),
              ),
            ),

            SizedBox(height: 28),

            _buildCampo(
              controller: _gasolinaController,
              label: 'Quantidade de Gasolina',
              icone: Icons.local_gas_station,
            ),

            SizedBox(height: 16),

            _buildCampo(
              controller: _etanolController,
              label: 'Quantidade de Etanol',
              icone: Icons.local_gas_station_outlined,
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: corPrimaria,
                foregroundColor: corTexto,
                padding: EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 6,
                shadowColor: corPrimaria.withOpacity(0.5),
              ),
              child: Text(
                "Calcular",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),

            SizedBox(height: 36),

            if (_resultado.isNotEmpty)
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:corCard,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: corPrimaria,
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: corPrimaria.withOpacity(0.2),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'Resultado:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: corPrimaria,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      _resultado,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        height: 2.0,
                        color: corTextoCinza
                      ),
                    )
                  ],
                ),
              ),

            SizedBox(height: 15),

            Text(
              'Gasolina R\$ 6,78 por litro e Etanol R\$ 4,70 por litro',
              style: TextStyle(fontSize: 13, color: const Color.fromARGB(255, 213, 158, 255)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampo({
    required TextEditingController controller,
    required String label,
    required IconData icone,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(color: corTexto, fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: corTextoCinza),
        prefixIcon: Icon(icone, color: corPrimaria),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: corBorda, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: corPrimaria, width: 2),
        ),
        filled: true,
        fillColor: corCard,
      ),
    );
  }
}
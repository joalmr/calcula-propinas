import 'package:calcula_propina/app/ui/fn.dart';
import 'package:calcula_propina/app/ui/widgets/cuenta_field.dart';
import 'package:calcula_propina/app/ui/widgets/icon_action.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cuentaController = TextEditingController(text: "0");
  bool fase = true;
  double personas = 2;
  double propina = 8;
  double cuenta = 0;
  String propinaResult = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(height: 210),
                Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  height: 180,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.elliptical(32, 24),
                      bottomRight: Radius.elliptical(32, 24),
                    ),
                  ),
                  child: !fase
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Debes dar propina",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              propinaResult,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 42,
                              ),
                            ),
                            const Text(
                              "por persona",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "¿Cuánto es la cuenta?",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            // SizedBox(height: 24),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 52),
                              child: CuentaField(controller: cuentaController),
                            ),
                          ],
                        ),
                ),
                Positioned(
                  bottom: 3,
                  left: (MediaQuery.of(context).size.width / 2) - 31,
                  child: GestureDetector(
                      onTap: () {
                        if (fase && personas != 0 && propina != 0) {
                          cuenta = double.parse(cuentaController.text);
                          propinaResult = propinaFn(cuenta, propina, personas);
                        }
                        setState(() {
                          fase = !fase;
                        });
                      },
                      child: IconAction(fase: fase)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text("Propina %"),
            ),
            Slider(
              value: propina,
              max: 20,
              divisions: 20,
              label: "${propina.toStringAsFixed(0)}%",
              onChanged: (value) {
                setState(() {
                  propina = value;
                });
                if (!fase && personas != 0 && propina != 0) {
                  cuenta = double.parse(cuentaController.text);
                  setState(() {
                    propinaResult = propinaFn(cuenta, propina, personas);
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Text("Personas"),
            ),
            Slider(
              value: personas,
              max: 20,
              divisions: 20,
              label: personas.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  personas = value;
                });
                if (!fase && personas != 0 && propina != 0) {
                  cuenta = double.parse(cuentaController.text);
                  setState(() {
                    propinaResult = propinaFn(cuenta, propina, personas);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

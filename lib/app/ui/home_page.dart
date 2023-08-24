import 'package:calcula_propina/app/ui/fn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

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
                  padding: EdgeInsets.only(left: 16, right: 16),
                  height: 180,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(32, 24),
                      bottomRight: Radius.elliptical(32, 24),
                    ),
                  ),
                  child: !fase
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Debes dar propina",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              propinaResult,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 42,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
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
                              child: TextField(
                                controller: cuentaController,
                                cursorColor: Colors.white,
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(9)
                                ],
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.5,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1.5,
                                      color: Colors.white.withOpacity(0.35),
                                    ),
                                  ),
                                ),
                              ),
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
                    child: Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        color: Colors.brown.shade100,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        fase
                            ? Icons.request_page_rounded
                            : Icons.arrow_back_ios_rounded,
                        color: Colors.brown,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
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
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
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

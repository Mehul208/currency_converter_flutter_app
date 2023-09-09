import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyCoverterHomePage();
}

class _CurrencyCoverterHomePage extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();
  String dropdownValue1 = "INR";
  String dropdownValue2 = "USD";

  final Map<String, double> _cerMap = {
    "INR": 83.5,
    "USD": 1,
    "AED": 3.67,
    "CHF": 0.89,
    "RUB": 98.51,
    "JPY": 147.20
  };

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void convert() {
    double v = double.parse(textEditingController.text);
    double? er = _cerMap[dropdownValue1];
    double? cer = _cerMap[dropdownValue2];
    setState(() {
      result = (v / er!) * cer!;
    });
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
          width: 2.0,
          style: BorderStyle.solid,
          color: Color.fromRGBO(0, 0, 0, 0.4)),
      borderRadius: BorderRadius.all(
        Radius.circular(60),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter"),
        backgroundColor: const Color.fromRGBO(13, 142, 255, 1),
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                result != 0 ? 'Converted Currency' : 'Exchange Rate',
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w300,
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                ),
              ),
            ),
            Text(
              result != 0
                  ? '$dropdownValue2 ${result.toStringAsFixed(2)}'
                  : "₹80",
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, 0.85),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.9),
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  hintText: "Please Enter Amount in INR",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.395),
                  ),
                  prefixIcon: Icon(Icons.currency_rupee_outlined),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: "INR",
                      child: Text("INR"),
                    ),
                    DropdownMenuItem(
                      value: "USD",
                      child: Text("USD"),
                    ),
                    DropdownMenuItem(
                      value: "AED",
                      child: Text("AED"),
                    ),
                    DropdownMenuItem(
                      value: "CHF",
                      child: Text("CHF"),
                    ),
                    DropdownMenuItem(
                      value: "RUB",
                      child: Text("RUB"),
                    ),
                    DropdownMenuItem(
                      value: "JPY",
                      child: Text("JPY"),
                    ),
                  ],
                  value: dropdownValue1,
                  onChanged: (value) {
                    if (value is String) {
                      setState(() {
                        dropdownValue1 = value;
                      });
                    }
                  },
                ),
                const SizedBox(
                  child: Icon(
                    Icons.arrow_right_alt_sharp,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                  ),
                ),
                DropdownButton(
                  padding: const EdgeInsets.all(10),
                  elevation: 10,
                  items: const [
                    DropdownMenuItem(
                      value: "INR",
                      child: Text("INR"),
                    ),
                    DropdownMenuItem(
                      value: "USD",
                      child: Text("USD"),
                    ),
                    DropdownMenuItem(
                      value: "AED",
                      child: Text("AED"),
                    ),
                    DropdownMenuItem(
                      value: "CHF",
                      child: Text("CHF"),
                    ),
                    DropdownMenuItem(
                      value: "RUB",
                      child: Text("RUB"),
                    ),
                    DropdownMenuItem(
                      value: "JPY",
                      child: Text("JPY"),
                    ),
                  ],
                  value: dropdownValue2,
                  onChanged: (value) {
                    if (value is String) {
                      setState(() {
                        dropdownValue2 = value;
                      });
                    }
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextButton(
                onPressed: convert,
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(13, 142, 255, 1),
                  ),
                  foregroundColor: MaterialStatePropertyAll(
                    Colors.white,
                  ),
                  overlayColor: MaterialStatePropertyAll(
                    Color.fromRGBO(255, 255, 255, 0.12),
                  ),
                  minimumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 60),
                  ),
                ),
                child: const Text(
                  "Convert",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

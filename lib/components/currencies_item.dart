import 'package:cotacao/models/currencies.dart';
import 'package:flutter/material.dart';

class CurrenciesItem extends StatelessWidget {
  final CurrenciesModel currencies;
  final double height;
  const CurrenciesItem({@required this.currencies, this.height = 80});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    getFormatedCurrencies(currencies.name),
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Text(
                    currencies.buy.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.87),
                    ),
                  ),
                  Spacer(),
                  Text(
                    currencies.name,
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(width: 6.0),
                  Icon(Icons.grade)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: RichText(
                text: TextSpan(
                    text: 'variação: ',
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '${currencies.variation.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getFormatedCurrencies(String value) {
    if (value.contains('Dollar'))
      return 'US\$';
    else if (value.contains('Euro'))
      return 'U€\$';
    else if (value.contains('Poun'))
      return '£\$';
    else if (value.contains('Argen'))
      return '\$';
    else if (value.contains('Bit')) return '฿\$';

    return '\$';
  }
}

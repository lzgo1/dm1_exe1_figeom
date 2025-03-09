import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Figuras Geométricas')),
        body: FigurasGeometricasScreen(),
      ),
    );
  }
}

class FigurasGeometricasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var circulo = Circulo(10.0);
    var retangulo = Retangulo(5.0, 10.0);
    var quadrado = Retangulo(7.0, 7.0);
    var triangulo = Triangulo(3.0, 4.0, 5.0);

    var figuras = [
      circulo,
      retangulo,
      quadrado,
      triangulo,
    ];

    var resultados = [
      "Círculo:\n  Diâmetro = ${circulo.diametro}\n  Raio = ${circulo.raio}\n  Área = ${circulo.area()}",
      "Retângulo:\n  Largura = ${retangulo.largura}, Altura = ${retangulo.altura}\n  É quadrado? ${retangulo.isQuadrado()}\n  Área = ${retangulo.area()}",
      "Quadrado:\n  Lado = ${quadrado.largura}\n  É quadrado? ${quadrado.isQuadrado()}\n  Área = ${quadrado.area()}",
      "Triângulo:\n  Lados = (${triangulo.ladoA}, ${triangulo.ladoB}, ${triangulo.ladoC})\n  Área = ${triangulo.area()}",
    ];

    var areaTotal = figuras.fold(0.0, (sum, figura) => sum + figura.area());
    resultados.add("Área total de todas as figuras: $areaTotal");

    return ListView.builder(
      itemCount: resultados.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            child: ListTile(
              title: Text(resultados[index], style: TextStyle(fontSize: 16)),
            ),
          ),
        );
      },
    );
  }
}

abstract class FiguraGeometrica {
  double area();
}

class Circulo extends FiguraGeometrica {
  final double diametro;
  late final double raio;

  Circulo(this.diametro) {
    raio = diametro / 2;
  }

  @override
  double area() => pi * pow(raio, 2);
}

class Retangulo extends FiguraGeometrica {
  final double largura;
  final double altura;

  Retangulo(this.largura, this.altura);

  bool isQuadrado() => largura == altura;

  @override
  double area() => largura * altura;
}

class Triangulo extends FiguraGeometrica {
  final double ladoA;
  final double ladoB;
  final double ladoC;

  Triangulo(this.ladoA, this.ladoB, this.ladoC);

  @override
  double area() {
    var semiPerimetro = (ladoA + ladoB + ladoC) / 2;
    return sqrt(semiPerimetro * (semiPerimetro - ladoA) * (semiPerimetro - ladoB) * (semiPerimetro - ladoC));
  }
}

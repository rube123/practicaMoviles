import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../utils/hero_model.dart' as HeroModel;
import '../../utils/attribute_painter.dart';
import 'hero_detail_screen.dart';

class HeroCard extends StatelessWidget {
  final HeroModel.Hero hero;
  final double rowHeight;

  const HeroCard({Key? key, required this.hero, this.rowHeight = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: rowHeight + 50,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Capa de fondo - la más lejana
          Transform.translate(
            offset: Offset(-10, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(math.pi / 120), // 1.5 grados
              child: Container(
                height: 216,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
              ),
            ),
          ),

          // Capa intermedia
          Transform.translate(
            offset: Offset(-44, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(math.pi / 22.5), // 8 grados
              child: Container(
                height: 188,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
              ),
            ),
          ),

          // Imagen del personaje héroe - lado izquierdo
          Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(-30, 0),
              child: Container(
                child: Transform.scale(
                  scale:
                      1.45, // 👈 Escala de la imagen, ajústalo (1.0 = normal)
                  child: Image.network(
                    hero.image,
                    width: rowHeight,
                    height: rowHeight,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: rowHeight,
                        height: rowHeight,
                        decoration: BoxDecoration(
                          color: hero.color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.person,
                          size: rowHeight *
                              0.9, // también más grande el ícono de fallback
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          // Sección de atributos - lado derecho
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 58),
              padding: EdgeInsets.symmetric(vertical: 20), // menos padding
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // ya no "spaceAround"
                children: [
                  AttributeWidget(
                    progress: hero.speed,
                    size: 35, // más delgado y compacto

                    strokeWidth:
                        2.0, // 👈 añade este si tu AttributeWidget lo soporta
                    child: Icon(
                      Icons.speed,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  AttributeWidget(
                    progress: hero.health,
                    size: 35,
                    strokeWidth: 2.0,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  AttributeWidget(
                    progress: hero.attack,
                    size: 35,
                    strokeWidth: 2.0,
                    child: Icon(
                      Icons.flash_on,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  SizedBox(height: 16), // espacio antes del botón
                  SizedBox(
                    height: 40, // más alto el botón
                    width: 100, // un poco más ancho
                    child: OutlinedButton(
                      child: Text(
                        'See Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HeroDetailScreen(hero: hero),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.white, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

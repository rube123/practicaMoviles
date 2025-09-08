import 'package:flutter/material.dart';
import '../utils/hero_model.dart';
import 'widgets/hero_card.dart';

class HeroListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E1E2C), // Azul oscuro/grisáceo
              Color(0xFF232526), // Gris carbón
            ],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header con título
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Your',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Hero',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),

              // Lista de héroes
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: HeroData.heroes.length,
                  itemBuilder: (context, index) {
                    return HeroCard(
                      hero: HeroData.heroes[index],
                      rowHeight: 180,
                    );
                  },
                ),
              ),

              // Footer con indicadores de página
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Container(
                      width: index == 0 ? 12 : 8,
                      height: index == 0 ? 12 : 8,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: index == 0
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

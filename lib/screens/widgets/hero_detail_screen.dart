import 'package:flutter/material.dart';
import '../../utils/hero_model.dart' as HeroModel;

class HeroDetailScreen extends StatefulWidget {
  final HeroModel.Hero hero;

  const HeroDetailScreen({Key? key, required this.hero}) : super(key: key);

  @override
  _HeroDetailScreenState createState() => _HeroDetailScreenState();
}

class _HeroDetailScreenState extends State<HeroDetailScreen> {
  final double appBarHeight = 80;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF141E30), // Azul muy oscuro
              Color(0xFF243B55), // Azul medianoche
            ],
            begin: Alignment(0.3, -1),
            end: Alignment(-0.8, 1),
          ),
        ),
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              padding: EdgeInsets.only(top: appBarHeight),
              children: [
                _HeroDetailsImage(widget.hero.image),
                _HeroDetailsName(widget.hero.name),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 12),
                  child: Text(
                    "Super smash bros ultimate villagers from the animal crossing series. This troops fight most effectively in large group",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                _buildStatsSection(),
                SizedBox(height: 28),
                _buildActionButtons(),
                SizedBox(height: 28),
              ],
            ),
            _buildAppBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 18),
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Text(
            'Overview',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(child: Container(height: 80)),
          Container(
            width: 80,
            height: 80,
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            'Hero Stats',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          _buildStatRow('Speed', widget.hero.speed, Icons.speed),
          SizedBox(height: 15),
          _buildStatRow('Health', widget.hero.health, Icons.favorite),
          SizedBox(height: 15),
          _buildStatRow('Attack', widget.hero.attack, Icons.flash_on),
        ],
      ),
    );
  }

  Widget _buildStatRow(String label, double value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(width: 20),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value / 100,
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 8,
            ),
          ),
        ),
        SizedBox(width: 10),
        Text(
          '${value.toInt()}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        SizedBox(width: 28),
        Expanded(
          child: Container(
            height: 54,
            child: OutlinedButton(
              child: Text(
                'Add Favourite',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 14),
        Expanded(
          child: Container(
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFF29758),
                      Color(0xFFEF5D67),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                ),
                child: Container(
                  constraints: BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Select Hero',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 28),
      ],
    );
  }
}

// Hero Details Image Widget
class _HeroDetailsImage extends StatelessWidget {
  final String imageUrl;

  const _HeroDetailsImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Image.network(
                        imageUrl,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            size: 100,
                            color: Colors.white,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Hero Details Name Widget
class _HeroDetailsName extends StatelessWidget {
  final String heroName;

  const _HeroDetailsName(this.heroName);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(
              heroName,
              style: TextStyle(
                color: Colors.white.withOpacity(0.1),
                fontWeight: FontWeight.bold,
                fontSize: 56,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            heroName,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
          ),
        ),
      ],
    );
  }
}

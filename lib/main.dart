import 'package:flutter/material.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StaggeredGridViewExample(),
    );
  }
}

class StaggeredGridViewExample extends StatelessWidget {
  const StaggeredGridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" StaggeredGridView",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: _tiles.length,
          itemBuilder: (BuildContext context, int index) => _tiles[index],
          staggeredTileBuilder: (int index) => _staggeredTiles[index],
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile(this.backgroundColor, this.iconData, {super.key});
  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(iconData, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

final List<Widget> _tiles = const <Widget>[
  Tile(Colors.green, Icons.widgets),
  Tile(Colors.lightBlue, Icons.wifi),
  Tile(Colors.amber, Icons.panorama_wide_angle),
  Tile(Colors.brown, Icons.map),
  Tile(Colors.deepOrange, Icons.send),
  Tile(Colors.indigo, Icons.airline_seat_flat),
  Tile(Colors.red, Icons.bluetooth),
  Tile(Colors.pink, Icons.battery_alert),
  Tile(Colors.purple, Icons.desktop_windows),
  Tile(Colors.blue, Icons.radio),
];

final List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  StaggeredTile.count(2, 2),
  StaggeredTile.count(2, 1),
  StaggeredTile.count(1, 2),
  StaggeredTile.count(1, 1),
  StaggeredTile.count(2, 2),
  StaggeredTile.count(1, 2),
  StaggeredTile.count(1, 1),
  StaggeredTile.count(3, 1),
  StaggeredTile.count(1, 1),
  StaggeredTile.count(4, 1),
];

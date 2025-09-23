import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StaggeredGridPatternPage(),
    );
  }
}

class StaggeredGridPatternPage extends StatelessWidget {
  const StaggeredGridPatternPage({super.key});

  @override
  Widget build(BuildContext context) {
    const totalTiles = 60;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Staggered Grid ",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            children: List.generate(totalTiles, (index) {
              final pos = index % 12;

              switch (pos) {
                case 0:
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: Tile(index: index),
                  );

              // Top-right two small squares (1,2)
                case 1:
                case 2:
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Tile(index: index),
                  );
              // Under 1&2: a tile spanning the two right columns (3)
                case 3:
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: Tile(index: index),
                  );

              // LEFT: a tile spanning two columns (4) — long horizontally above 6&7
                case 4:
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: Tile(index: index),
                  );

              // RIGHT: tall tile spanning two columns × two rows (5)
                case 5:
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: Tile(index: index),
                  );
              // Two small boxes under tile 4 (6,7)
                case 6:
                case 7:
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Tile(index: index),
                  );

              // Next block: large left tile (8)
                case 8:
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 2,
                    child: Tile(index: index),
                  );

              // Top-right pair for the block (9,10)
                case 9:
                case 10:
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Tile(index: index),
                  );

              // below 9&10: spanning right (11)
                case 11:
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: Tile(index: index),
                  );

                default:
                  return StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Tile(index: index),
                  );
              }
            }),
          ),
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final int index;
  const Tile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2F5F8F),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Text(
            (index % 100).toString(), // show index (keeps numbers readable)
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

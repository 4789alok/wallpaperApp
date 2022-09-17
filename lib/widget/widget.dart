import 'package:demo_project/image_view.dart';
import 'package:demo_project/model/wallpaper_model.dart';
import 'package:flutter/material.dart';

Widget brandName() {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      children: const <TextSpan>[
        TextSpan(
          text: 'Wallpaper',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        TextSpan(
          text: 'Hub',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ],
    ),
  );
}

Widget wallpapersList(List<WallpaperModel> wallpaper, context) {
  return Container(
    child: GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpaper.map(
        (wallpaper) {
          return GridTile(
            child: GestureDetector(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ImageView(imgUrl: wallpaper.src!.portrait!,
                        ),
                  ),
                );
              }),
              child: Hero(
                tag: wallpaper.src!.portrait!,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      wallpaper.src!.portrait!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    ),
  );
}

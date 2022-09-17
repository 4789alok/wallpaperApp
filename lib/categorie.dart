import 'dart:convert';
import 'package:demo_project/data/data.dart';
import 'package:demo_project/model/wallpaper_model.dart';
import 'package:demo_project/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categorie extends StatefulWidget {
  final String? categorieName;
  Categorie({this.categorieName});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<WallpaperModel> wallpaper = [];

  @override
  void initState() {
    getSearchWallpapers(widget.categorieName!);
    super.initState();
  }

  getSearchWallpapers(String query) async {
    var url =
        Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=50");
    var response = await http.get(url, headers: {"Authorization": apiKey});
    //print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      // print(element);
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpaper.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              wallpapersList(wallpaper, context),
            ],
          ),
        ),
      ),
    );
  }
}

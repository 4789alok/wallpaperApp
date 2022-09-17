import 'dart:convert';
import 'package:demo_project/data/data.dart';
import 'package:demo_project/model/wallpaper_model.dart';
import 'package:demo_project/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String? searchQuary;
  Search({this.searchQuary});

  @override
  _SearchState createState() => _SearchState();
}
//State<Search> createState() => _SearchState();

class _SearchState extends State<Search> {
  List<WallpaperModel> wallpaper = [];
  TextEditingController searchController = TextEditingController();
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
  void initState() {
    getSearchWallpapers(widget.searchQuary!);
    super.initState();
    searchController.text = widget.searchQuary!;
  }

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
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "search Wallpaper",
                            border: InputBorder.none),
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {
                        getSearchWallpapers(searchController.text);
                      }),
                      child: Container(
                        child: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              wallpapersList(wallpaper, context),
            ],
          ),
        ),
      ),
    );
  }
}

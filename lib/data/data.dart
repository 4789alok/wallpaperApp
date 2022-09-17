import 'package:demo_project/model/categories_model.dart';

String apiKey = "563492ad6f91700001000001fa63a05a5f0c46f5b5b96ede7fb493d2";

List<CategoriesModel> getCategories() {
  List<CategoriesModel> categories = [];
  CategoriesModel categoriesModel = CategoriesModel();

  categoriesModel.imgurl =
      "https://i.pinimg.com/564x/e8/7b/7c/e87b7c1fea7d91695c2e09ef50846455.jpg";
  categoriesModel.categorieName = "Street Art";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgurl =
      "https://i.pinimg.com/564x/51/fa/fa/51fafa2a34f9f4e6f5058ee36e3235f4.jpg";
  categoriesModel.categorieName = "Wild Life";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgurl =
      "https://i.pinimg.com/564x/6a/02/96/6a029645e3378569b5de88ee07980790.jpg";
  categoriesModel.categorieName = "Nature";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgurl =
      "https://i.pinimg.com/564x/d1/6e/95/d16e954f48d98e7bed5e1c26d54b4666.jpg";
  categoriesModel.categorieName = "City";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgurl =
      "https://i.pinimg.com/564x/56/54/7a/56547a21860b1dd9fdbc6d5e2d9b4728.jpg";
  categoriesModel.categorieName = "Motivation";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgurl =
      "https://i.pinimg.com/564x/bd/69/4b/bd694b613aea51718e2e76241adb9668.jpg";
  categoriesModel.categorieName = "Bike";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgurl =
      "https://i.pinimg.com/564x/0e/f6/f6/0ef6f6913a32bc22259f8644cac6832b.jpg";
  categoriesModel.categorieName = "Car";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  return categories;
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final title = 'Flutter Horizontal demo list';
//     return MaterialApp(title: title,);
//   }
// }

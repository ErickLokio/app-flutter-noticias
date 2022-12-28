
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../models/category.dart';
import '../models/news_models.dart';
import 'package:http/http.dart' as http;

const _URL_NEWS = 'https://newsapi.org/v2';
const _API_KEY = '850fbe23a90a46119be59af0d420f0f3';

class NewsService with ChangeNotifier{
  List<Article> headLines = [];
  String _selectedCategory = 'business';

  List<CategoryModel> categorias = [
    CategoryModel(FontAwesomeIcons.building, 'business'),
    CategoryModel(FontAwesomeIcons.tv, 'entertainment'),
    CategoryModel(FontAwesomeIcons.addressCard, 'general'),
    CategoryModel(FontAwesomeIcons.headSideVirus, 'health'),
    CategoryModel(FontAwesomeIcons.vials, 'science'),
    CategoryModel(FontAwesomeIcons.football, 'sports'),
    CategoryModel(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};


  NewsService(){
    getTopHeadLines();

    for (var element in categorias) {
      categoryArticles[element.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor){
    _selectedCategory = valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  getTopHeadLines() async{

    final Uri peticion = Uri.parse('$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=us');

    final http.Response respuesta = await http.get(peticion);
    final newsResponse = newsResponseFromJson(respuesta.body);

    headLines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async{

    if(categoryArticles[category]!.isNotEmpty ){
      return categoryArticles[category]!.length;
    }

    final Uri peticion = Uri.parse('$_URL_NEWS/top-headlines?apiKey=$_API_KEY&country=us&category=$category');

    final http.Response respuesta = await http.get(peticion);
    final newsResponse = newsResponseFromJson(respuesta.body);

    categoryArticles[category]!.addAll(newsResponse.articles);
    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada => categoryArticles[selectedCategory]!;
}


import 'package:app_new_noticias/src/services/news_service.dart';
import 'package:app_new_noticias/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../theme/tema.dart';

class Tab2Page extends StatelessWidget {

  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          _ListaCategorias(),

          Expanded(
            child: ListaNoticias(newsService.getArticulosCategoriaSeleccionada),
          ),
        ],
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categorias = Provider.of<NewsService>(context).categorias;

    return SizedBox(
      width: double.infinity,
      height: 125,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          final name = categorias[index].name;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20,),
                _CategoryButton(categoria: categorias[index],),
                const SizedBox(height: 5,),
                Text('${name[0].toUpperCase()}${name.substring(1)}'),

              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final CategoryModel categoria;

  const _CategoryButton({Key? key, required this.categoria}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (newsService.selectedCategory == categoria.name) ? miTema.accentColor :  Colors.white,
        ),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategory == categoria.name) ? Colors.white : Colors.black54,
        ),
      ),
    );
  }
}



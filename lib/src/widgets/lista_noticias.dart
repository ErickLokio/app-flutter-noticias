import 'package:app_new_noticias/src/theme/tema.dart';
import 'package:flutter/material.dart';

import '../models/news_models.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(noticia: noticias[index], index: index,);
      },
    );
  }
}

class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({
    Key? key,
    required this.index,
    required this.noticia
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaToBar(noticia: noticia, index: index),
        _TarjetaTitulo(noticia: noticia),
        _TarjetaImagen(noticia: noticia,),
        _TarjetaBody(noticia: noticia),
        const SizedBox(height: 10,),
        const Divider(),
        _TarjetaBotones(),
      ],
    );
  }
}


class _TarjetaToBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaToBar({
    Key? key,
    required this.noticia,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index +1}. ', style: TextStyle(color: miTema.accentColor),),
          Text('${noticia.source.name}. ',)
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {

  final Article noticia;

  const _TarjetaTitulo({
    Key? key,
    required this.noticia
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article noticia;

  const _TarjetaImagen({
    Key? key,
    required this.noticia
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (noticia.urlToImage != null) ?
          FadeInImage(
            placeholder: const AssetImage('assets/giphy.gif'),
            image: NetworkImage('${noticia.urlToImage}'),
          )
          :
           const Image(image: AssetImage('assets/no-image.png')),
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {

  final Article noticia;

  const _TarjetaBody({
    Key? key,
    required this.noticia
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String? descripcion = noticia.description ?? '';

    return Text(descripcion);
  }
}

class _TarjetaBotones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RawMaterialButton(
          onPressed: (){},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: miTema.accentColor,
          child: const Icon(Icons.star_border),
        ),

        const SizedBox(width: 10,),

        RawMaterialButton(
          onPressed: (){},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: Colors.blue,
          child: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}






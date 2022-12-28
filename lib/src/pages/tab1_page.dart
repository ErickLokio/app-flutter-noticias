import 'package:app_new_noticias/src/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/lista_noticias.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context).headLines;

    return Scaffold(
      body: (newsService.isEmpty)
          ? const Center(child: CircularProgressIndicator(),)
          : ListaNoticias(newsService),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

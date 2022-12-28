import 'package:app_new_noticias/src/pages/tabs_page.dart';
import 'package:app_new_noticias/src/services/news_service.dart';
import 'package:app_new_noticias/src/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo JAJA',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: const TabsPage(),
      ),
    );
  }
}

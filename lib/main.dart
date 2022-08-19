import 'package:flutter/material.dart';
import 'burc_rehberi.dart';
import 'burc_detay.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Burç Rehberi',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        "/": (context) => const BurcRehberi(),
        "/burcListesi": (context) => const BurcRehberi(),
      },
      initialRoute: "/burcListesi",
      onGenerateRoute: (RouteSettings settings) {
        List<String> pathElemanlari = settings.name!.split("/");

        if (pathElemanlari[1] == "listeDetay") {
          return MaterialPageRoute(
            builder: (context) => BurcDetay(
              int.parse(pathElemanlari[2]),
            ),
          );
        }
        return null;
      },
    );
  }
}

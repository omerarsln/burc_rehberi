import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'models/burc.dart';
import 'burc_rehberi.dart';

class BurcDetay extends StatefulWidget {
  final int index;
  const BurcDetay(this.index, {Key? key}) : super(key: key);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc = Burc("", "", "", "", "");
  Color baskinRenk = Colors.black;

  void baskinRengiAl() {
    Future<PaletteGenerator> fPaletteG = PaletteGenerator.fromImageProvider(
        AssetImage("assets/${secilenBurc.burcBuyukResim}"));
    fPaletteG.then((value) {
      setState(() {
        baskinRenk = value.dominantColor!.color;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    secilenBurc = BurcRehberi.tumBurclar[widget.index];
    baskinRengiAl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: baskinRenk,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/${secilenBurc.burcBuyukResim}",
                fit: BoxFit.cover,
              ),
              title: Text("${secilenBurc.burcAdi} ve Özellikleri"),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  secilenBurc.burcDetayi,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

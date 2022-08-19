import 'package:flutter/material.dart';
import 'models/burc.dart';
import 'utils/strings.dart';

class BurcRehberi extends StatelessWidget {
  static List<Burc> tumBurclar = [];

  const BurcRehberi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Burç Rehberi"),
        centerTitle: true,
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String burcAdi = Strings.burcAdlari[i];
      String burcTarihi = Strings.burcTarihleri[i];
      String burcDetayi = Strings.burcGenelOzellikleri[i];
      String burcKucukResim =
          Strings.burcAdlari[i].toLowerCase() + "${i + 1}.png";
      String burcBuyukResim =
          Strings.burcAdlari[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Burc eklenecekBurc =
          Burc(burcAdi, burcTarihi, burcDetayi, burcKucukResim, burcBuyukResim);

      burclar.add(eklenecekBurc);
    }

    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return burcListesiElemani(context, index);
      },
      itemCount: tumBurclar.length,
    );
  }

  Widget burcListesiElemani(context, index) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListTile(
          onTap: () => Navigator.pushNamed(context, "/listeDetay/$index"),
          leading: Image.asset("assets/" + tumBurclar[index].burcKucukResim),
          title: Text(
            tumBurclar[index].burcAdi,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.purple,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              tumBurclar[index].burcTarihi,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

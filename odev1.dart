void main(List<String> arguments) {
  // arügüman eksikliğinden ekrana hata çıktısı
  if (arguments.length != 10) {
    print("Lütfen argümanları 10 sayıdan fazla veya eksik girmeyin!!!");
    return;
  }
  // liste oluşturup dönüştürülerek eklenmesi
  List<num> liste = [];
  for (var i in arguments) {
    // hata sorgusu
    try {
      liste.add(num.parse(i));
    } on FormatException {
      print("Yazılan argümanlar içinde istenilenin dışında değerler vardır!!!");
      return;
    }
  }

  // listenin sıralanması ve tersten sıralanması
  liste.sort();
  var listeReversed = List.from(liste.reversed);

  print("büyükten küçüğe: $liste\nküçükten büyüğe: $listeReversed");
}

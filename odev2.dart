import 'dart:io';

void main() {
  Islemler islem = new Islemler();

  num birinciSayi, ikinciSayi;
  print("Değerleri girildikten sonra işlem seçeneği ile işlem yapılacaktır.");
  while (true) {
    try {
      stdout.write("Birinci sayınızı giriniz: ");
      birinciSayi = num.parse(stdin.readLineSync()!);
      stdout.write("İkinci sayıyı giriniz: ");
      ikinciSayi = num.parse(stdin.readLineSync()!);
    } on FormatException {
      print("Girdi olarak program başa alındı!!!");
      continue;
    }
    stdout.write("""
  İşlemler:
  1- Toplama
  2- Çıkarma
  3- Çarpma
  4- Bölme
  q- Çıkış
İşleminizi seçiniz: """);
    var secim = stdin.readLineSync();
    switch (secim) {
      case "1":
        islem.toplama(birinciSayi, ikinciSayi);
        break;
      case "2":
        islem.cikarma(birinciSayi, ikinciSayi);
        break;
      case "3":
        islem.carpma(birinciSayi, ikinciSayi);
        break;
      case "4":
        islem.bolme(birinciSayi, ikinciSayi);
        break;
      default:
        print("seçeneklerde bir problem var!!!");
        continue;
    }
    return;
  }
}

class Islemler {
  void carpma(var x, var y) {
    print("$x * $y = ${x * y}");
  }

  void bolme(var x, var y) {
    print("$x / $y = ${x / y}");
  }

  void toplama(var x, var y) {
    print("$x + $y = ${x + y}");
  }

  void cikarma(var x, var y) {
    print("$x - $y = ${x - y}");
  }
}

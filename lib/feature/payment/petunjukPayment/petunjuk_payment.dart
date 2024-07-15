import 'petunjuk_payment_model.dart';

class PetunjukPembayaran {
  //data
  List<PetunjukPayment> petunjuk = [
    //!Qris
    PetunjukPayment(
      metode: "QRIS", 
      petunjuk: [
        "Buka aplikasi mobile banking anda",
        "pastikan mobile banking anda mendukung pembayaran QRIS",
        "Pindai kode QR pada layar diatas",
        "Atau upload kode QR ke mobile banking anda (Pastikan kode QR diatas sudah di download terlebih dahulu)",
        "Jika pembayaran berhasil, pembayaran anda secara otomatis akan segera di proses"
      ]
    ),
  ];

  //get petunjuk
  List<PetunjukPayment> ambilPetunjuk (String metode) {
    List<PetunjukPayment> temporary = petunjuk.where((element) => element.metode == metode).toList();
    return temporary;
  }
}
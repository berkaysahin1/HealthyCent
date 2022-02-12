import 'dart:ffi';

class Users{
  late int User_Id;
  late String User_AdSoyad;
  late String User_Email;
  late String User_Sifre;
  late int User_Gsm;
  late int User_Bakiye;
  late int User_Puan;
  late int User_TopHak;
  late int User_TopTasKul;
  late int User_AdimSayisi;

  Users(
      this.User_Id,
      this.User_AdSoyad,
      this.User_Email,
      this.User_Sifre,
      this.User_Gsm,
      this.User_Bakiye,
      this.User_Puan,
      this.User_TopHak,
      this.User_TopTasKul,
      this.User_AdimSayisi);
}
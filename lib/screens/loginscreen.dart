import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healthycent/db/Users.dart';
import 'package:healthycent/db/veritabaniyardimcisi.dart';
import 'package:healthycent/screens/registerscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);



  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var tfkullanici=TextEditingController();
  var tfsifre=TextEditingController();
  var scaffoldKey=GlobalKey<ScaffoldState>();
  Future<List<Users>> UserList()async{
    var db =await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps=await db.rawQuery("SELECT * FROM Users");
    return List.generate(maps.length,(i){
      var satir=maps[i];
      return  Users(satir["User_Id"], satir["User_AdSoyad"], satir["User_Email"], satir["User_Sifre"], satir["User_Gsm"], satir["User_Bakiye"], satir["User_Puan"], satir["User_TopHak"], satir["User_TopTasKul"], satir["User_AdimSayisi"]);
    });
  }
  Future<void> girisKontrol() async{
    var liste=await UserList();
    int controlsayac=0;
    for (Users s in liste){


      if (tfkullanici.text==s.User_Email && tfsifre.text==s.User_Sifre){
        var sp=await SharedPreferences.getInstance();

        sp.setString("KullaniciAdi", tfkullanici.text);
        sp.setString("sifre", tfsifre.text);
        sp.setString("Ad", s.User_AdSoyad);
        sp.setString("VeriMail", s.User_Email);
        sp.setString("VeriSifre", s.User_Sifre);
        sp.setInt("KullaniciId", s.User_Id);
        sp.setInt("bakiye", s.User_Bakiye);
        sp.setInt("adim", s.User_AdimSayisi);
        sp.setInt("tthak", s.User_TopHak);
        sp.setInt("ttkul", s.User_TopTasKul);
        sp.setInt("puan", s.User_Puan);
        controlsayac=controlsayac + 1;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
      }
    }
    if (controlsayac==0){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text("Hata!"),
          content: Text("HATALI GİRİŞ YAPTINIZ!!!"),
        );
      });
    }
  }
  bool isChecked = false;
  Widget _buildForgotPasswordButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: const Text(
          'Şifremi Unuttum?',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
  Widget _buildRemeberMe() {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
          checkColor: Colors.blue,
          fillColor: MaterialStateProperty.all(Colors.white),
        ),
        const Text(
          'Beni Hatırla',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
  Widget _buildLoginButton() {
    return SizedBox(
      height: 64,
      width: double.infinity,

      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          elevation: MaterialStateProperty.all(6),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        child: const Text(
          'Giriş Yap',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,

          ),
        ),
        onPressed: () {
girisKontrol();
        },
      ),
    );
  }
  Widget _buildreButton() {
    return SizedBox(
      height: 64,
      width: double.infinity,

      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          elevation: MaterialStateProperty.all(6),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        child: const Text(
          'Kayıt Ol',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,

          ),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>registerscreen()));
        },
      ),
    );
  }
  Widget _buildLogoButton({
    String? image,
    VoidCallback? onPressed,
  }) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: onPressed,
      child: SizedBox(
        height: 30,
        child: Image.asset(image!),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.green
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ).copyWith(top: 60),
              child: Column(
                children: [
                  const Text(
                    'Giriş Yap',
                    style: TextStyle(
                      fontFamily: 'PT-Sans',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'E-Posta',
                      style: TextStyle(
                        fontFamily: 'PT-Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: tfkullanici,
                    cursorColor: Colors.white,
                    cursorWidth: 2,
                    obscureText: false,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.green,
                      prefixIcon: const Icon(Icons.mail, color: Colors.white),
                      hintText: "E-posta Adresinizi Giriniz...",
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PTSans',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Şifre',
                      style: TextStyle(
                        fontFamily: 'PT-Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: tfsifre,
                    cursorColor: Colors.white,
                    cursorWidth: 2,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.green,
                      prefixIcon: const Icon(Icons.vpn_key, color: Colors.white),
                      hintText: "Şifrenizi Giriniz...",
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PTSans',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildForgotPasswordButton(),
                  _buildRemeberMe(),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildLoginButton(),

                  const SizedBox(
                    height: 20,
                  ),
                  _buildreButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
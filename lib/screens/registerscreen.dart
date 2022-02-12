import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../db/Users.dart';
import '../db/veritabaniyardimcisi.dart';

class registerscreen extends StatefulWidget {
  const registerscreen({Key? key}) : super(key: key);
  @override
  State<registerscreen> createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {
  var tfadsoyad = TextEditingController();
  var tfeposta = TextEditingController();
  var tfgsm = TextEditingController();
  var tfsifre = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> kayit() async {
    if (tfsifre.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Şifre boş bırakılamaz.')));
    } else if (tfgsm.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Telefon numarası 10 haneli girilmelidir.')));
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(tfeposta.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Yanlış e-posta formatı.')));
    } else if (tfadsoyad.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ad-Soyad boş bırakılamaz.')));
    } else {
      UserAdd(tfadsoyad.text, tfeposta.text, tfsifre.text, tfgsm.text);
    }
  }

  Future<List<Users>> UserAdd(
      String Ad, String Email, String Sifre, String Gsm) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();
    var GsmVeri = int.parse(Gsm);
    bilgiler['User_AdSoyad'] = Ad;
    bilgiler["User_Email"] = Email;
    bilgiler["User_Sifre"] = Sifre;
    bilgiler["User_Gsm"] = GsmVeri;

    await db.insert("Users", bilgiler);
    print("eklendi");
    return [];
  }

  bool isChecked = false;

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
          'Kayıt Ol',
          style: TextStyle(
            fontFamily: 'PT-Sans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          kayit();
        },
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
          decoration: const BoxDecoration(color: Colors.green),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ).copyWith(top: 60),
              child: Column(
                children: [
                  const Text(
                    'Kayıt Ol',
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
                      'Ad-Soyad',
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
                    controller: tfadsoyad,
                    cursorColor: Colors.white,
                    cursorWidth: 2,
                    obscureText: false,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.green,
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      hintText: "Ad ve Soyadınızı Giriniz...",
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
                      'E-posta',
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
                    controller: tfeposta,
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
                  TextFormField(
                    controller: tfsifre,
                    cursorColor: Colors.white,
                    cursorWidth: 2,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.green,
                      prefixIcon:
                          const Icon(Icons.vpn_key, color: Colors.white),
                      hintText: "Şifrenizi Giriniz...",
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
                      'GSM',
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
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: tfgsm,
                    cursorColor: Colors.white,
                    cursorWidth: 2,
                    obscureText: false,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                    ],
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.green,
                      prefixIcon: const Icon(Icons.phone, color: Colors.white),
                      hintText: "Telefon Numaranızı Giriniz...",
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
                  _buildLoginButton(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

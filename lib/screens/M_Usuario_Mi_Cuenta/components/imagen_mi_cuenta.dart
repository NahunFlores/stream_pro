import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsuarioImagenMiCuenta extends StatelessWidget {
  User user;
  UsuarioImagenMiCuenta({required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 180,
      child: Stack(
        clipBehavior: Clip.none, fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: Image.network(user.photoURL ?? "https://png.clipart.me/previews/85b/psd-universal-blue-web-user-icon-45876.jpg")
                .image,
            backgroundColor: Colors.white,
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.white),
                ),
                backgroundColor:  const Color(0xFF37474F),
                padding: const EdgeInsets.all(0),
              ),
                onPressed: () {},
                child: SvgPicture.asset("icons/Icono Camara 2.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

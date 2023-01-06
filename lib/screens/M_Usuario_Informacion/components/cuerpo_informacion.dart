import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:stream_pro/components/custom_boton_nuevos_registros.dart';
import 'package:stream_pro/screens/M_Usuario_Informacion/components/contenido_informacion.dart';
import 'package:stream_pro/config/constants.dart';
import 'package:stream_pro/config/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [

    {
      "text":
      "Ayudamos a las personas en la gestión y el control de cuentas\nen el servicio de Streaming; ",
      "image": "images/splash_5.png"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => ContenidoInformacion(
                  image: splashData[index]["image"] ?? "",
                  text: splashData[index]['text'] ?? "",
                ),

              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),

                    RichText(
                      text: TextSpan(
                        text: 'Proyecto desarrollado por ',
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(text: 'Dev+ Team', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ', Harol Miranda'),
                        ],
                      ),
                    ),

                    RichText(
                      text: TextSpan(
                        text: 'versión ',
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(text: '1.0.5 ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'mayo, 2021'),
                        ],
                      ),
                    ),

                    const Spacer(flex: 3),

                    BotomNuevosRegistros(
                      text: "Contáctanos",
                      press: () async {
                          final Email email = Email(
                            body: '',
                            subject: '',
                            recipients: ['alonehadeshn@gmail.com'],
                          );

                          await FlutterEmailSender.send(email);
                        },
                    ),

                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
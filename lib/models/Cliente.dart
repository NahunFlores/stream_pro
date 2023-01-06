import 'package:flutter/material.dart';

class Cliente {
  final String idCliente;
  final String cliente, descripcion;
  final List<String> images;
  final List<Color> colors;
  final double rating, precio;
  final bool pagado, vigente;

  Cliente({
    required this.idCliente,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.pagado = false,
    this.vigente = false,
    required this.cliente,
    required this.precio,
    required this.descripcion,
  });
}

// Our demo Products

List<Cliente> demoClientes = [
  Cliente(
    idCliente: "1",
    images: [
      "images/item_netflix.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    cliente: "Mariela Lagos",
    precio: 270.00,
    descripcion: descripcion,
    rating: 0.0,
    pagado: true,
    vigente: true,
  ),
  Cliente(
    idCliente: "2",
    images: [
      "images/item_disney_plus.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    cliente: "Ariel Martinez",
    precio: 220.00,
    descripcion: descripcion,
    rating: 0.0,
    pagado: true,
    vigente: true,
  ),
  Cliente(
    idCliente: "3",
    images: [
      "images/item_spotify.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    cliente: "Iveth Zelaya",
    precio: 80.00,
    descripcion: descripcion,
    rating: 0.0,
    pagado: false,
    vigente: true,
  ),
  Cliente(
    idCliente: "4",
    images: [
      "images/item_prime_video.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    cliente: "Celeste Rodriguez",
    precio: 220.00,
    descripcion: descripcion,
    rating: 0.0,
    pagado: true,
    vigente: true,
  ),
  Cliente(
    idCliente: "5",
    images: [
      "images/item_youtube.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    cliente: "Harol Miranda",
    precio: 180.00,
    descripcion: descripcion,
    rating: 0.0,
    pagado: true,
    vigente: true,
  ),
];

const String descripcion = "Ejemplo …";

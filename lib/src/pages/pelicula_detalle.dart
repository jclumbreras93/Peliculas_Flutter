import 'package:flutter/material.dart';

import '../models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {

  PeliculaDetalle();

  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Text(pelicula.title),
      ),
    );
  }
}
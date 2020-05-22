import 'package:Peliculas_Flutter/src/models/pelicula_model.dart';
import 'package:Peliculas_Flutter/src/providers/peliculas_providers.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{

  String seleccion = '';
  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
    'Spiderman', 
    'Capitan America',
    'Batman', 
    'Ironman',
  ];
  final peliculasRecientes = [
    'Spiderman', 
    'Capitan America'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
      // Acciones de nuestro appbar
      return [
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: (){
            query = '';
          }
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icono a la izquierda del appbar
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ), 
        onPressed: (){
          close(context, null);
        }
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // Crea los resultado que mostramos
      return Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.blueAccent,
          child: Text(seleccion),
        ),
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // Crea sugerencias de la busqueda mientras escribes

      if (query.isEmpty) {
        return Container();
      }

      return FutureBuilder(
        future: peliculasProvider.buscarPelicula(query),
        builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (snapshot.hasData) {
            final peliculas = snapshot.data;
            return ListView(
              children: peliculas.map((pelicula) {
                return ListTile(
                  leading: FadeInImage(
                    placeholder: AssetImage('assets/img/no-image.jpg'), 
                    image: NetworkImage(pelicula.getPosterImg()),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  title: Text(pelicula.title),
                  onTap: (){
                    close(context, null);
                    pelicula.uniqueId = '';
                    Navigator.pushNamed(context, 'detalle', arguments: pelicula);
                  },
                );
              }).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );

    }


    // buildSuggestion
    //   final listaSugerida = (query.isEmpty) 
    //                         ? peliculasRecientes 
    //                         : peliculas.where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

    //   return ListView.builder(
    //     itemCount: listaSugerida.length,
    //     itemBuilder: (context, i) {
    //       return ListTile(
    //         leading: Icon(Icons.movie),
    //         title: Text(listaSugerida[i]),
    //         onTap: () {
    //           seleccion = listaSugerida[i];
    //           showResults(context);
    //         },
    //       );
    //     }
    //   );


}
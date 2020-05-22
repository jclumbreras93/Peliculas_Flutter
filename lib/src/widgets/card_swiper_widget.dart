import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({ @required this.peliculas });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.6,
      child: Column(
        children: <Widget>[
          Text('Cartelera', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500)),
          SizedBox(height: 10.0),
          Swiper(
            layout: SwiperLayout.STACK,
            itemWidth: _screenSize.width * 0.7,
            itemHeight: _screenSize.height * 0.5,
            itemBuilder: (BuildContext context,int index){

              peliculas[index].uniqueId = '${peliculas[index].id}-tarjeta';
              return Hero(
                tag: peliculas[index].uniqueId,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: GestureDetector(
                    onTap: ()=> Navigator.pushNamed(context, 'detalle', arguments: peliculas[index]),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/img/no-image.jpg'), 
                      fit: BoxFit.cover,
                      image: NetworkImage( peliculas[index].getPosterImg() ),
                    ),
                  )
                ),
              );        
            },
            itemCount: peliculas.length,
            //pagination: new SwiperPagination(),
            //control: new SwiperControl(),
          ),
        ],
      ),
    );
  }
}
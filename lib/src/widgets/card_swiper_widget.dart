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
      //padding: EdgeInsets.only(top: 5.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Text('Cartelera', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
            SizedBox(height: 20.0),
            Swiper(
              layout: SwiperLayout.STACK,
              itemWidth: _screenSize.width * 0.7,
              itemHeight: _screenSize.height * 0.5,
              itemBuilder: (BuildContext context,int index){
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/img/no-image.jpg'), 
                    fit: BoxFit.cover,
                    image: NetworkImage( peliculas[index].getPosterImg() ),
                  )
                );        
              },
              itemCount: peliculas.length,
              //pagination: new SwiperPagination(),
              //control: new SwiperControl(),
            ),
          ],
        ),
      )
    );
  }
}
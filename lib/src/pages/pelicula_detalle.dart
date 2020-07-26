import 'package:flutter/material.dart';
import 'package:movies_app/src/models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar( pelicula ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.0),
                _posterTitulo(pelicula, context),
              ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearAppbar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(pelicula.getBackgroundImg()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

 Widget _posterTitulo(Pelicula pelicula, BuildContext context) {
   return Container(
     padding: EdgeInsets.symmetric(horizontal: 20.0),
     child: Row(
       children: <Widget>[
         ClipRRect(
           borderRadius: BorderRadius.circular(20.0),
           child: Image(
             image: NetworkImage(pelicula.getPostImg()),
             height: 150.0,
           ),
         ),
         SizedBox(width: 20.0 ),
         Flexible(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text(pelicula.title, style: Theme.of(context).textTheme.headline6, overflow: TextOverflow.ellipsis),
               Text(pelicula.originalTitle, style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis),
               Row(
                 children: <Widget>[
                   Icon(Icons.star_border),
                   Text(pelicula.voteAverage.toString(), style: Theme.of(context).textTheme.subtitle1)
                 ],
               )
             ],
           ),
         ),
       ],
     ),
   );
 }
}
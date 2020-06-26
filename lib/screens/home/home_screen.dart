import 'package:flutter/material.dart';
import 'package:loja_escorpiao_rei/common/custom_drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.yellowAccent,
              Colors.yellowAccent,
              Color.fromARGB(255, 255, 255, 80),
              Colors.yellow[300],
              Colors.yellow[300],
              Color.fromARGB(240, 65, 105, 225),
              Color.fromARGB(230, 0, 0, 192),
              Color.fromARGB(240, 0, 0, 125),
              Color.fromARGB(250, 0, 0, 85),
              Color.fromARGB(255, 0, 0, 65),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                snap: true,
                floating: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Loja Escorpião Rei', style: TextStyle(color: Colors.black),),
                  centerTitle: true,
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.black,
                    onPressed: () => Navigator.of(context).pushNamed('/cart'),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: Image.asset("imagens/logo.png"),
          )
        ],
      ),
      
    );
  }
}

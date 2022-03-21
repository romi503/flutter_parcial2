import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parcial_2/data/data.dart';
import 'package:parcial_2/pages/descripcion.dart';

class Compra extends StatefulWidget {
  final int tamanio;
  final int activoMenu1;
  const Compra(
    {
      Key? key,
      required this.tamanio,
      required this.activoMenu1
    }) : super(key: key
  );

  @override
  State<Compra> createState() => _CompraState();
}

class _CompraState extends State<Compra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Cart"),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: List.generate(articulos.length, (index) {
              return GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    PageTransition(
                      alignment: Alignment.bottomCenter,
                      child: Descripcion(
                        img: 
                          widget.activoMenu1 == 0 ? articulos[index]['img']
                            : widget.activoMenu1 == 1 ? articulos2[index]['img']
                            : widget.activoMenu1 == 2 ? articulos3[index]['img']
                            : widget.activoMenu1 == 3 ? articulos4[index]['img']
                            : articulos5[index]['img'],
                        description: 
                          widget.activoMenu1 == 0 ? articulos[index]['description']
                            : widget.activoMenu1 == 1 ? articulos2[index]['description']
                            : widget.activoMenu1 == 2 ? articulos3[index]['description']
                            : widget.activoMenu1 == 3 ? articulos4[index]['description']
                            : articulos5[index]['description'],
                        name: 
                          widget.activoMenu1 == 0 ? articulos[index]['name']
                            : widget.activoMenu1 == 1 ? articulos2[index]['name']
                            : widget.activoMenu1 == 2 ? articulos3[index]['name']
                            : widget.activoMenu1 == 3 ? articulos4[index]['name']
                            : articulos5[index]['name'],
                        cost: 
                          widget.activoMenu1 == 0 ? articulos[index]['cost']
                            : widget.activoMenu1 == 1 ? articulos2[index]['cost']
                            : widget.activoMenu1 == 2 ? articulos3[index]['cost']
                            : widget.activoMenu1 == 3 ? articulos4[index]['cost']
                            : articulos5[index]['cost'],
                        activoMenu1: widget.activoMenu1,
                        color:
                          widget.activoMenu1 == 0 ? articulos[index]['color']
                            : widget.activoMenu1 == 1 ? articulos2[index]['color']
                            : widget.activoMenu1 == 2 ? articulos3[index]['color']
                            : widget.activoMenu1 == 3 ? articulos4[index]['color']
                            : articulos5[index]['color'],
                      ),
                      type: PageTransitionType.scale
                    )
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      widget.activoMenu1 == 0 ? articulos[index]['img']
                        : widget.activoMenu1 == 1 ? articulos2[index]['img']
                        : widget.activoMenu1 == 2 ? articulos3[index]['img']
                        : widget.activoMenu1 == 3 ? articulos4[index]['img']
                        : articulos5[index]['img'],
                      fit: BoxFit.fill,
                      width: 40,
                      height: 40,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.activoMenu1 == 0 ? articulos[index]['name']
                            : widget.activoMenu1 == 1 ? articulos2[index]['name']
                            : widget.activoMenu1 == 2 ? articulos3[index]['name']
                            : widget.activoMenu1 == 3 ? articulos4[index]['name']
                            : articulos5[index]['name'],
                          style: const TextStyle(
                            color: Colors.black
                          ),
                        ),
                        Text(
                          widget.activoMenu1 == 0 ? articulos[index]['cost']
                            : widget.activoMenu1 == 1 ? articulos2[index]['cost']
                            : widget.activoMenu1 == 2 ? articulos3[index]['cost']
                            : widget.activoMenu1 == 3 ? articulos4[index]['cost']
                            : articulos5[index]['cost'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.cancel,
                      size: 30,
                    )
                  ],
                ),
              );
            })
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 3, left: 10),
                    child: Text(
                      "Pagar",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                shadowColor: Colors.black26,
                // ignore: unnecessary_new
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 0,
                fixedSize: const Size(300, 50)
              ),
            ),
          ),
        ],
      )
    );
  }
}
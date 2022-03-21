import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parcial_2/data/data.dart';
import 'package:parcial_2/pages/compra.dart';

class Descripcion extends StatefulWidget {
  final String img;
  final String description;
  final String name;
  final String cost;
  final int activoMenu1;
  final Color color;
  const Descripcion(
    {
      Key? key,
      required this.img,
      required this.description,
      required this.name,
      required this.cost,
      required this.activoMenu1,
      required this.color
    }) : super(key: key
  );

  @override
  State<Descripcion> createState() => _DescripcionState();
}

class _DescripcionState extends State<Descripcion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
            child: Container(
              padding: const EdgeInsets.only(left: 265, top: 5),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 30, top: 20),
                child: Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.img),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Text(
                  widget.cost,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Text(
              widget.description,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Row(
            children: List.generate(articulos.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 25),
                child: GestureDetector(
                  onTap: ((){
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
                  }),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.circle,
                        color: articulos[index]['color'],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageTransition(
                    alignment: Alignment.bottomCenter,
                    child: Compra(
                      tamanio: articulos.length,
                      activoMenu1: widget.activoMenu1,
                    ),
                    type: PageTransitionType.rightToLeft
                  )
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 70),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 30,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3, left: 10),
                    child: Text(
                      "Comprar",
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
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:parcial_2/data/data.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parcial_2/pages/descripcion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Parcial 2',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activoMenu1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black45,
                ),
              ),
              const Text("Comercial Sivar"),
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
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
            child: Container(
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  labelText: 'Buscar...'
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Row(
                children: List.generate(mobiliario.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: GestureDetector(
                      onTap: ((){
                        setState(() {
                          activoMenu1 = index;
                        });
                      }),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mobiliario[index],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          activoMenu1 == index ?
                            Container(
                              width: 40,
                              height: 3,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5)
                              ),
                            ) : Container()
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(articulos.length, (index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      PageTransition(
                        alignment: Alignment.bottomCenter,
                        child: Descripcion(
                          img: 
                            activoMenu1 == 0 ? articulos[index]['img']
                              : activoMenu1 == 1 ? articulos2[index]['img']
                              : activoMenu1 == 2 ? articulos3[index]['img']
                              : activoMenu1 == 3 ? articulos4[index]['img']
                              : articulos5[index]['img'],
                          description: 
                            activoMenu1 == 0 ? articulos[index]['description']
                              : activoMenu1 == 1 ? articulos2[index]['description']
                              : activoMenu1 == 2 ? articulos3[index]['description']
                              : activoMenu1 == 3 ? articulos4[index]['description']
                              : articulos5[index]['description'],
                          name: 
                            activoMenu1 == 0 ? articulos[index]['name']
                              : activoMenu1 == 1 ? articulos2[index]['name']
                              : activoMenu1 == 2 ? articulos3[index]['name']
                              : activoMenu1 == 3 ? articulos4[index]['name']
                              : articulos5[index]['name'],
                          cost: 
                            activoMenu1 == 0 ? articulos[index]['cost']
                              : activoMenu1 == 1 ? articulos2[index]['cost']
                              : activoMenu1 == 2 ? articulos3[index]['cost']
                              : activoMenu1 == 3 ? articulos4[index]['cost']
                              : articulos5[index]['cost'],
                          activoMenu1: activoMenu1,
                          color:
                            activoMenu1 == 0 ? articulos[index]['color']
                              : activoMenu1 == 1 ? articulos2[index]['color']
                              : activoMenu1 == 2 ? articulos3[index]['color']
                              : activoMenu1 == 3 ? articulos4[index]['color']
                              : articulos5[index]['color'],
                        ),
                        type: PageTransitionType.scale
                      )
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                          activoMenu1 == 0 ? articulos[index]['img']
                            : activoMenu1 == 1 ? articulos2[index]['img']
                            : activoMenu1 == 2 ? articulos3[index]['img']
                            : activoMenu1 == 3 ? articulos4[index]['img']
                            : articulos5[index]['img'],
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      Text(
                        activoMenu1 == 0 ? articulos[index]['name']
                            : activoMenu1 == 1 ? articulos2[index]['name']
                            : activoMenu1 == 2 ? articulos3[index]['name']
                            : activoMenu1 == 3 ? articulos4[index]['name']
                            : articulos5[index]['name'],
                        style: const TextStyle(
                          color: Colors.black
                        ),
                      ),
                      Text(
                        activoMenu1 == 0 ? articulos[index]['cost']
                            : activoMenu1 == 1 ? articulos2[index]['cost']
                            : activoMenu1 == 2 ? articulos3[index]['cost']
                            : activoMenu1 == 3 ? articulos4[index]['cost']
                            : articulos5[index]['cost'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                );
              })
            )
          )
        ],
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mi App con Tabs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  final iconList = <IconData>[
    Icons.image,
    Icons.image,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi app con tabs')),
      //Se utiliza el widget IndexedStack que guarda varias widgets como hijo pero muestro solo uno a la vez
      //Lo utilizo para poder mostrando el contenido de cada pestania de navegacion del navbar
      //Donde en la variable selectedIndex vamos guardardo el index de cada pagina
      body: IndexedStack(
        index: selectedIndex,
        children: [
          //Los widgets que tiene el contenido de cada pestania
          CarruselPage(),
          ImagenBotonPage(),
        ],
      ),
      //Permite la navegacion entre pestanias
      bottomNavigationBar: BottomNavigationBar(
        //Tipo de animacion que va a tener al cambiar de pestania
        type: BottomNavigationBarType.fixed,
        //Se le pasa el valor del index en la pestania que se encuentra
        currentIndex: selectedIndex,
        //Cuando se hace click cambia el index y redirige a la pestania correspondiente
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        //Se definen los items que representan los botones de navegacion para el navbar
        //Cada boton tiene su texto y icono correspondiente
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Carrusel',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Imagen y boton',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

//Codigo reutilizado de la actividad 3
class CarruselPage extends StatelessWidget {
  final images = [
    {
      'image': 'assets/025.png',
      'tipo': 'Electrico',
      'nombre': 'Pikachu',
      'numero': '025',
    },
    {
      'image': 'assets/004.png',
      'tipo': 'Fuego',
      'nombre': 'Charmander',
      'numero': '004'
    },
    {
      'image': 'assets/007.png',
      'tipo': 'Agua',
      'nombre': 'Squirtle',
      'numero': '007'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 460.0,
                autoPlay: true,
              ),
              items: [0, 1, 2].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Image.asset(images[i]['image']!),
                              const SizedBox(height: 20),
                              Text(
                                images[i]['nombre']!,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 300,
                                child: Row(
                                  children: <Widget>[
                                    if (images[i]['tipo'] == 'Electrico')
                                      Container(
                                        width: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(22)),
                                        ),
                                        child: Text(
                                          images[i]['tipo']!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    if (images[i]['tipo'] == 'Fuego')
                                      Container(
                                        width: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(22)),
                                        ),
                                        child: Text(
                                          images[i]['tipo']!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    if (images[i]['tipo'] == 'Agua')
                                      Container(
                                        width: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.cyan,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(22)),
                                        ),
                                        child: Text(
                                          images[i]['tipo']!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        'N.° ${images[i]['numero']!}',
                                        style: const TextStyle(
                                          fontSize: 22,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ImagenBotonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Se llama a la imagen
            Image.asset(
              'assets/035.png',
              height: 200,
            ),
            const SizedBox(height: 75),
            //Se crea un button que de momento no hace nada
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {},
              //Texto del boton
              child: const Text(
                'Editar perfil',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

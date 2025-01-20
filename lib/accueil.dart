import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Expanded(
            child: Center(
              child: AjoutBouton(),
            ),
          ),
        ],
      ),
      routes: {
        '/page1': (context) => const Page1(),
        '/page2': (context) => const Page2(),
        '/page3': (context) => const Page3(),
        '/page4': (context) => const Page4(),
        '/page5': (context) => const Page5(),
        '/page6': (context) => const Page6(),
        '/page7': (context) => const Page7(),
        '/page8': (context) => const Page8(),
        '/page9': (context) => const Page9(),
        '/page10': (context) => const Page10(),
        '/page11': (context) => const Page11(),
        '/page12': (context) => const Page12(),
        '/page13': (context) => const Page13(),
        '/page14': (context) => const Page14(),
        '/page15': (context) => const Page15(),
        '/page16': (context) => const Page16(),
        '/page17': (context) => const Page17(),
        '/page18': (context) => const Page18(),
        '/page19': (context) => const Page19(),
        '/page20': (context) => const Page20(),
      },
    );
  }
}

class BoutonAjoutPatient extends StatelessWidget {
  const BoutonAjoutPatient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0), // Adjust the value as needed
      child: ElevatedButton(
        onPressed: () {
          // Action for the first button
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AjoutPatient()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_add_alt_1_rounded),
            SizedBox(width: 20, height: 80),
            Text('Ajout Patient'),
          ],
        ),
      ),
    );
  }
}

class AjoutBouton extends StatelessWidget {
  final GlobalKey<_ButtonGridState> _buttonGridKey =
      GlobalKey<_ButtonGridState>();

  AjoutBouton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ButtonGrid(key: _buttonGridKey),
            ),
            ElevatedButton(
              onPressed: () {
                _buttonGridKey.currentState?.ajouterBouton();
              },
              child: const Text("Valider"),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonGrid extends StatefulWidget {
  const ButtonGrid({super.key});

  @override
  State<ButtonGrid> createState() => _ButtonGridState();
}

class _ButtonGridState extends State<ButtonGrid> {
  final List<Widget> _boutons =
      []; // Initialiser avec un widget vide pour éviter une grille vide au départ

  void ajouterBouton() {
    setState(() {
      _boutons.add(
        GestureDetector(
          onTap: () {
            print("Bouton ${_boutons.length + 1} appuyé");
          },
          child: Container(
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 33, 150, 243),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                "Bouton ${_boutons.length + 1}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      key: UniqueKey(),
      crossAxisCount: 3,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: _boutons,
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PREDIBACK'),
      ),
      body: const Center(
        child: Text('This is Page 1'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PREDIPAIN'),
      ),
      body: const Center(
        child: Text('This is Page 2'),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: const Center(
        child: Text('This is Page 3'),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 4'),
      ),
      body: const Center(
        child: Text('This is Page 4'),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 5'),
      ),
      body: const Center(
        child: Text('This is Page 5'),
      ),
    );
  }
}

class Page6 extends StatelessWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 6'),
      ),
      body: const Center(
        child: Text('This is Page 6'),
      ),
    );
  }
}

class Page7 extends StatelessWidget {
  const Page7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 7'),
      ),
      body: const Center(
        child: Text('This is Page 7'),
      ),
    );
  }
}

class Page8 extends StatelessWidget {
  const Page8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 8'),
      ),
      body: const Center(
        child: Text('This is Page 8'),
      ),
    );
  }
}

class Page9 extends StatelessWidget {
  const Page9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 9'),
      ),
      body: const Center(
        child: Text('This is Page 9'),
      ),
    );
  }
}

class Page10 extends StatelessWidget {
  const Page10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 10'),
      ),
      body: const Center(
        child: Text('This is Page 10'),
      ),
    );
  }
}

class Page11 extends StatelessWidget {
  const Page11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 11'),
      ),
      body: const Center(
        child: Text('This is Page 11'),
      ),
    );
  }
}

class Page12 extends StatelessWidget {
  const Page12({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 12'),
      ),
      body: const Center(
        child: Text('This is Page 12'),
      ),
    );
  }
}

class Page13 extends StatelessWidget {
  const Page13({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 13'),
      ),
      body: const Center(
        child: Text('This is Page 13'),
      ),
    );
  }
}

class Page14 extends StatelessWidget {
  const Page14({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 14'),
      ),
      body: const Center(
        child: Text('This is Page 14'),
      ),
    );
  }
}

class Page15 extends StatelessWidget {
  const Page15({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 15'),
      ),
      body: const Center(
        child: Text('This is Page 15'),
      ),
    );
  }
}

class Page16 extends StatelessWidget {
  const Page16({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 16'),
      ),
      body: const Center(
        child: Text('This is Page 16'),
      ),
    );
  }
}

class Page17 extends StatelessWidget {
  const Page17({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 17'),
      ),
      body: const Center(
        child: Text('This is Page 17'),
      ),
    );
  }
}

class Page18 extends StatelessWidget {
  const Page18({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 18'),
      ),
      body: const Center(
        child: Text('This is Page 18'),
      ),
    );
  }
}

class Page19 extends StatelessWidget {
  const Page19({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 19'),
      ),
      body: const Center(
        child: Text('This is Page 19'),
      ),
    );
  }
}

class Page20 extends StatelessWidget {
  const Page20({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 20'),
      ),
      body: const Center(
        child: Text('This is Page 20'),
      ),
    );
  }
}

class AjoutPatient extends StatelessWidget {
  const AjoutPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page ajout patient'),
      ),
      body: const Center(
        child: Text('go'),
      ),
    );
  }
}

class FormulaireInclusion extends StatelessWidget {
  const FormulaireInclusion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page inclusion'),
      ),
      body: const Center(
        child: Text('hruhfuihfuehfiud'),
      ),
    );
  }
}

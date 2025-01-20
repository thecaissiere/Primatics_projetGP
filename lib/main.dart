import 'package:flutter/material.dart';
import 'package:name_app/Administration.dart';
import 'package:name_app/Financement.dart';
import 'package:name_app/accueil.dart';
import 'package:name_app/ajout_etude.dart';
import 'package:name_app/my_drawer_head.dart';
import 'package:name_app/schema_etude.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    home: MyMain(),
  ));
}

class MyMain extends StatefulWidget {
  const MyMain({super.key});

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: [
            const Text(
              "Prismatics",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold), // Couleur blanche pour le titre
            ),
            const Text(
              "Schéma d'étude",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold), // Couleur blanche pour le titre
            ),
            const Text('Ajout d\'une étude',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            const Text('Ajout d\'un patient',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            const Text('Formulaire d\'inclusion',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold))
          ][_currentIndex],
          backgroundColor: [
            Colors.blue,
            Colors.blue,
            const Color.fromARGB(255, 255, 126, 126),
            Colors.blue,
            Colors.blue,
          ][_currentIndex],
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset(
                'assets/images/chupoitiers.png',
                width: 50, // ajustez la largeur de l'image selon vos besoins
                height: 50, // ajustez la hauteur de l'image selon vos besoins
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Image.asset(
                'assets/images/prismatics.png',
                width: 60, // ajustez la largeur de l'image selon vos besoins
                height: 60, // ajustez la hauteur de l'image selon vos besoins
              ),
            ),
            IconButton(
              icon: const Icon(Icons.help, color: Colors.white, size: 40),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    final MaterialLocalizations localizations =
                        MaterialLocalizations.of(context);
                    return AlertDialog(
                      title: Text(localizations.alertDialogLabel),
                      content: const Text(
                          "content: Text('Pour naviguer dans ce Powerpoint : cliquez sur les différents boutons disponibles sur les pages pour accéder aux diapositives affichant les informations voulues. \n\nCliquer dans le vide ne passera pas à la diapositive suivante. \n\nPour revenir sur le menu principal, cliquez sur l'icon de la maison .\n\nPour revenir à la fenêtre précédente, cliquez sur retour .\n\nPour arrêter le PowerPoint, cliquez sur arrêter.\n\nChaque étude se compose d’un volet « Déroulement de la recherche » et d’un volet « Administration / Financement ». Ces informations sont accessibles depuis le panneau principal de chaque étude.\n\nPour accéder aux dernières données à jours (graphiques et diagrammes), il est recommandé au préalable (hors mode présentation) de faire un clique droit sur la figure en question et de cliquer sur « Modifier les données ». Cette action mettra les figures à jour.\n\nPS : La barre de recherche ne fonctionne pas, c’est purement esthétique."),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text(localizations.cancelButtonLabel),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        backgroundColor: [
          Colors.blue,
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white,
        ][_currentIndex],
        body: [
          const MyApp(),
          const SchemaEtude(),
          const AjoutEtude(),
          const AjoutPatient(),
          const FormulaireInclusion(),
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setCurrentIndex(index),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Étude'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), label: 'Ajout d\'étude'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt_1_rounded),
                label: 'Ajout d\'un patient'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment_add),
                label: 'Formulaire d\'inclusion'),
          ],
        ),
        drawer: _currentIndex == 1
            ? Drawer(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        const MyHeaderDrawer(),
                        MyDrawerList(context),
                      ],
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }

  Widget MyDrawerList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem("Accueil Schéma d'étude", Icons.house),
          menuItem("Administration", Icons.assignment),
          menuItem("Financement", Icons.trending_up),
          menuItem("Déroulement de la recherche", Icons.menu_book),
        ],
      ),
    );
  }

  Widget menuItem(String title, IconData icon) {
    return Material(
      child: InkWell(
        onTap: () {
          if (title == "Accueil Schéma d'étude") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SchemaEtude()),
            );
          }
          if (title == "Administration") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Administration()),
            );
          }
          if (title == "Financement") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Financement()),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

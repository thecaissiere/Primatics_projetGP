import 'package:flutter/material.dart';
import 'package:name_app/Administration.dart';
import 'package:name_app/Financement.dart';
import 'package:name_app/my_drawer_head.dart';
import 'package:name_app/schema_etude.dart';

class AppBarSchEtude extends StatelessWidget {
  const AppBarSchEtude({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Schéma d'étude",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor:
            Colors.blue, // Correction pour les parenthèses inutiles
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              'assets/images/chupoitiers.png',
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              'assets/images/prismatics.png',
              width: 60,
              height: 60,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.help,
                color: Colors.white, size: 40), // Correction pour 'const'
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Aide"),
                    content: const Text(
                        "Pour naviguer dans ce Powerpoint : cliquez sur les différents boutons disponibles sur les pages pour accéder aux diapositives affichant les informations voulues. \n\nCliquer dans le vide ne passera pas à la diapositive suivante. \n\nPour revenir sur le menu principal, cliquez sur l'icon de la maison.\n\nPour revenir à la fenêtre précédente, cliquez sur retour.\n\nPour arrêter le PowerPoint, cliquez sur arrêter.\n\nChaque étude se compose d’un volet « Déroulement de la recherche » et d’un volet « Administration / Financement ». Ces informations sont accessibles depuis le panneau principal de chaque étude.\n\nPour accéder aux dernières données à jour (graphiques et diagrammes), il est recommandé au préalable (hors mode présentation) de faire un clic droit sur la figure en question et de cliquer sur « Modifier les données ». Cette action mettra les figures à jour.\n\nPS : La barre de recherche ne fonctionne pas, c’est purement esthétique."),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                            "Fermer"), // Utilisation de TextButton au lieu de ElevatedButton pour mieux s'aligner sur les conventions actuelles
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
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [const MyHeaderDrawer(), MyDrawerList(context)],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem("Accueil Schéma d'étude", Icons.house, context),
          menuItem("Administration", Icons.assignment, context),
          menuItem("Financement", Icons.trending_up, context),
          menuItem("Déroulement de la recherche", Icons.menu_book, context),
        ],
      ),
    );
  }

  Widget menuItem(String title, IconData icon, BuildContext context) {
    // Ajout de BuildContext context dans la signature de la fonction
    return Material(
      child: InkWell(
        onTap: () {
          if (title == "Accueil Schéma d'étude") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
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

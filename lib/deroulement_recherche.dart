import 'package:flutter/material.dart';
import 'package:name_app/Administration.dart';
import 'package:name_app/Financement.dart';
import 'package:name_app/my_drawer_head.dart';
import 'package:name_app/schema_etude.dart';

class DeroulementRecherche extends StatefulWidget {
  const DeroulementRecherche({super.key});

  @override
  State<DeroulementRecherche> createState() => _DeroulementRechercheState();
}

class _DeroulementRechercheState extends State<DeroulementRecherche> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [const MyHeaderDrawer(), MyDrawerList()],
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Schéma de la recherche",
                style: TextStyle(
                  color: Colors.black, // Changé en noir pour la visibilité
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Critères de jugement principaux",
                style: TextStyle(
                  color: Colors.black, // Changé en noir pour la visibilité
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Outils utilisés",
                style: TextStyle(
                  color: Colors.black, // Changé en noir pour la visibilité
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Ajoutez plus de widgets selon vos besoins
          ],
        ),
      ),
    );
  }

  Widget MyDrawerList() {
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
          if (title == "Déroulement de la recherche") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DeroulementRecherche()),
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

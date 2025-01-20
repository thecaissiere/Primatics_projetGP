import 'package:flutter/material.dart';
import 'package:name_app/Administration.dart';
import 'package:name_app/my_drawer_head.dart';
import 'package:name_app/schema_etude.dart';
import 'package:date_field/date_field.dart';

void main() {
  runApp(const MaterialApp(
    home: Financement(),
  ));
}

class Financement extends StatefulWidget {
  const Financement({super.key});

  @override
  State<Financement> createState() => _FinancementState();
}

class _FinancementState extends State<Financement> {
  final _formKey = GlobalKey<FormState>();

  final titreController = TextEditingController();
  final datetheoriqueController = TextEditingController();
  final daterelleController = TextEditingController();

  DateTime selectedtimeDebut = DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch -
          (DateTime.now().hour * 3600000 +
              DateTime.now().minute * 60000 +
              DateTime.now().second * 1000));
  DateTime selectedtimeFin = DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch -
          (DateTime.now().hour * 3600000 +
              DateTime.now().minute * 60000 +
              DateTime.now().second * 1000));

  @override
  void dispose() {
    titreController.dispose();
    datetheoriqueController.dispose();
    daterelleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [const MyHeaderDrawer(), MyDrawerList(context)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      'Financement / Millestone',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Titre',
                    hintText: 'Entrez le titre',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter le titre';
                    }
                    return null;
                  },
                  controller: titreController,
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_month),
                      labelText: 'Choisir la date théorique',
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Inserez la date théorique';
                      }
                      return null;
                    },
                    onChanged: (DateTime? value) {
                      setState(() {
                        selectedtimeDebut = value!;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_month),
                      labelText: 'Choisir la date réelle',
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Inserez la date réelle';
                      }
                      return null;
                    },
                    onChanged: (DateTime? value) {
                      setState(() {
                        selectedtimeFin = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        //<=Contient par défaut OnPressed et child qui est generalemnt le text du bouton
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final titreName = titreController.text;
                            final timedatetheorique =
                                datetheoriqueController.text;
                            final timedatereelle = daterelleController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Ajout de l'étude en cours...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                            print(
                                "la date est $selectedtimeDebut"); //Permet que le clavier se ferme direct automatiquement près validation
                          }
                        },
                        child: const Text(
                          'Valider',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
          menuItem(
            "Accueil Schéma d'étude",
            Icons.house,
          ),
          menuItem(
            "Administration",
            Icons.assignment,
          ),
          menuItem("Financement", Icons.trending_up),
          menuItem(
            "Déroulement de la recherche",
            Icons.menu_book,
          ),
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

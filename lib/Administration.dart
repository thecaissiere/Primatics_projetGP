import 'package:flutter/material.dart';
import 'package:name_app/Financement.dart';
import 'package:name_app/my_drawer_head.dart';
import 'package:name_app/schema_etude.dart';
import 'package:date_field/date_field.dart';

void main() {
  runApp(const MaterialApp(
    home: Administration(),
  ));
}

class Administration extends StatefulWidget {
  const Administration({super.key});

  @override
  State<Administration> createState() => _AdministrationState();
}

class _AdministrationState extends State<Administration> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20), // Ajout d'espace
            const Text(
              "Administration", // Titre ajouté
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormePage1()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cpp.png',
                    width: 200,
                    height: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some space between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormePage2()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ANSM_logo.png',
                    width: 200,
                    height: 100,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some space between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormePage3()),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Assurance",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some space between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormePage4()),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Document de l'essai",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some space between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormePage5()),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Newsletters",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some space between buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormePage6()),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BA",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
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

class FormePage1 extends StatefulWidget {
  const FormePage1({super.key});

  @override
  State<FormePage1> createState() => _FormePageState1();
}

class _FormePageState1 extends State<FormePage1> {
  final _formKey = GlobalKey<FormState>();

  final titreNameController = TextEditingController();
  final commentaireController = TextEditingController();
  final dateController = TextEditingController();

  DateTime selectedtimeDebut = DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch -
          (DateTime.now().hour * 3600000 +
              DateTime.now().minute * 60000 +
              DateTime.now().second * 1000));

  @override
  void dispose() {
    super.dispose();

    titreNameController.dispose();
    commentaireController.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page de formulaire'),
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
                      'Formulaire',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Titre formulaire',
                    hintText: 'Entrez le titre du formulaire',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter le titre';
                    }
                    return null;
                  },
                  controller: titreNameController,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Commentaire',
                    hintText: 'Entrez le commentaire',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter le commentaire';
                    }
                    return null;
                  },
                  controller: commentaireController,
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
                      labelText: 'Choisir une date',
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.toString().isEmpty) {
                        return 'Inserez une date';
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
                            final etudName = titreNameController.text;
                            final promoteName = commentaireController.text;
                            final timedate = dateController.text;

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
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormePage2 extends StatefulWidget {
  const FormePage2({super.key});

  @override
  State<FormePage2> createState() => _FormePageState2();
}

class _FormePageState2 extends State<FormePage2> {
  final _formKey = GlobalKey<FormState>();

  final rapportController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    rapportController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page de formulaire'),
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
                      'Formulaire',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Rapport',
                    hintText: 'Entrez le statu du rapport de l\'ANSM',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter rapport';
                    }
                    return null;
                  },
                  controller: rapportController,
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
                            final etudName = rapportController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Ajout de l'étude en cours...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                            print(
                                "la date est $selectedDate"); //Permet que le clavier se ferme direct automatiquement près validation
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
}

class FormePage3 extends StatefulWidget {
  const FormePage3({super.key});

  @override
  State<FormePage3> createState() => _FormePageState3();
}

class _FormePageState3 extends State<FormePage3> {
  final _formKey = GlobalKey<FormState>();

  final rapportController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    rapportController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page de formulaire'),
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
                      'Formulaire',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Rapport',
                    hintText: 'Entrez le statu du rapport de l\'ANSM',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter rapport';
                    }
                    return null;
                  },
                  controller: rapportController,
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
                            final etudName = rapportController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Ajout de l'étude en cours...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                            print(
                                "la date est $selectedDate"); //Permet que le clavier se ferme direct automatiquement près validation
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
}

class FormePage4 extends StatefulWidget {
  const FormePage4({super.key});

  @override
  State<FormePage4> createState() => _FormePageState4();
}

class _FormePageState4 extends State<FormePage4> {
  final _formKey = GlobalKey<FormState>();

  final rapportController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    rapportController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page de formulaire'),
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
                      'Formulaire',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Rapport',
                    hintText: 'Entrez le statu du rapport de l\'ANSM',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter rapport';
                    }
                    return null;
                  },
                  controller: rapportController,
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
                            final etudName = rapportController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Ajout de l'étude en cours...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                            print(
                                "la date est $selectedDate"); //Permet que le clavier se ferme direct automatiquement près validation
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
}

class FormePage5 extends StatefulWidget {
  const FormePage5({super.key});

  @override
  State<FormePage5> createState() => _FormePageState5();
}

class _FormePageState5 extends State<FormePage5> {
  final _formKey = GlobalKey<FormState>();

  final rapportController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    rapportController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page de formulaire'),
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
                      'Formulaire',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Rapport',
                    hintText: 'Entrez le statu du rapport de l\'ANSM',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter rapport';
                    }
                    return null;
                  },
                  controller: rapportController,
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
                            final etudName = rapportController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Ajout de l'étude en cours...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                            print(
                                "la date est $selectedDate"); //Permet que le clavier se ferme direct automatiquement près validation
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
}

class FormePage6 extends StatefulWidget {
  const FormePage6({super.key});

  @override
  State<FormePage6> createState() => _FormePageState6();
}

class _FormePageState6 extends State<FormePage6> {
  final _formKey = GlobalKey<FormState>();

  final rapportController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();

    rapportController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page de formulaire'),
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
                      'Formulaire',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Rapport',
                    hintText: 'Entrez le statu du rapport de l\'ANSM',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter rapport';
                    }
                    return null;
                  },
                  controller: rapportController,
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
                            final etudName = rapportController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Ajout de l'étude en cours...")));
                            FocusScope.of(context).requestFocus(FocusNode());
                            print(
                                "la date est $selectedDate"); //Permet que le clavier se ferme direct automatiquement près validation
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
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

//void main() {
// runApp(MaterialApp(
//   home: const AjoutEtude(),
//));
//}
class AjoutEtude extends StatefulWidget {
  const AjoutEtude({super.key});
  @override
  State<AjoutEtude> createState() => _AjoutEtudeState();
}

class _AjoutEtudeState extends State<AjoutEtude> {
  final _formKey = GlobalKey<FormState>();
  final etudNameController = TextEditingController();
  final etudNumController = TextEditingController();
  final etudCategorieController = TextEditingController();
  final investNameController = TextEditingController();
  final promoteNameController = TextEditingController();
  final etudTitleController = TextEditingController();
  final etudTimeController = TextEditingController();

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
    super.dispose();
    etudNameController.dispose();
    etudNumController.dispose();
    etudCategorieController.dispose();
    investNameController.dispose();
    promoteNameController.dispose();
    etudTitleController.dispose();
    etudTimeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(80),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Nom de l\'étude',
                      hintText: 'Entrez le nom de l\'étude',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter le nom de l\'étude';
                    }
                    return null;
                  },
                  controller: etudNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Numéro de l\'étude',
                      hintText: 'Entrez le numéro de l\'étude',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter le numéro de l\'étude';
                    }
                    return null;
                  },
                  controller: etudNumController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Catégorie de l\'étude',
                      hintText: 'Entrez la catégorie de l\'étude',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter la catégorie de l\'étude';
                    }
                    return null;
                  },
                  controller: etudCategorieController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Nom de l\'investigateur',
                      hintText: 'Entrez le nom de l\'investigateur',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter le nom de l\'investigateur';
                    }
                    return null;
                  },
                  controller: investNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Nom du promoteur',
                      hintText: 'Entrez le nom du promoteur',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter le nom du promoteur';
                    }
                    return null;
                  },
                  controller: promoteNameController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Titre de l\'étude',
                      hintText: 'Entrez le titre de l\'étude',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter le titre de l\'étude';
                    }
                    return null;
                  },
                  controller: etudTitleController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Durée de l\'étude',
                      hintText: 'Entrez la durée de l\'étude',
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Compléter la durée de l\'étude';
                    }
                    return null;
                  },
                  controller: etudTimeController,
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
                    labelText: 'Choisir une date de début d\'étude',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return 'Inserez une date de début d\'étude';
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
                    labelText: 'Choisir une date de fin d\'étude',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null) {
                      return 'Inserez une date de fin d\'étude';
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

              // Ajoutez d'autres champs du formulaire ici
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  //<=Contient par défaut OnPressed et child qui est generalemnt le text du bouton
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final etudName = etudNameController.text;
                      final etudNum = etudNameController.text;
                      final etudCategorie = etudCategorieController.text;
                      final investName = investNameController.text;
                      final promoteName = promoteNameController.text;
                      final etudTitle = etudTitleController.text;
                      final etudTime = etudTimeController.text;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Ajout de l'étude en cours...")));
                      FocusScope.of(context).requestFocus(FocusNode());

                      //ajout bdd
                      CollectionReference etudeRef =
                          FirebaseFirestore.instance.collection("Etude");
                      /*etudeRef.add({
                        'Nom' = etudName,
                        'Numero' = etudNum,
                        'Categorie' = etudCategorie,
                        'Investigateur' = investName,
                        'Promoteur' = promoteName,
                        'Titre_Complet' = etudTitle,
                        'Duree_Totale' = etudTime,
                        'Date_Debut' = selectedtimeDebut,
                        'Date_Fin' = selectedtimeFin
                      });*/
                    }
                  },
                  child: const Text(
                    'Valider',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
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

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const IconButton(
        //Ce qui sera dedans se trouvera à gauche de l'appBar (spé à l'appBar)
        icon: Icon(Icons.house, color: Colors.white, size: 40),
        onPressed: null,
      ),
      title: const Text(
        'Ajout d\'une étude',
        style: TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
      actions: const [
        IconButton(
          icon: Icon(Icons.help, color: Colors.white, size: 40),
          onPressed: null,
        ),
      ],
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 255, 126, 126),
    );
  }
}

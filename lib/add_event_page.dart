import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: AddEventPage(),
  ));
}

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: Container(
          margin: const EdgeInsets.all(20),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Envoi en cours...")));
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
          ),
        ),
        backgroundColor: Colors.white);
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

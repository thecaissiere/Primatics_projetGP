import 'package:flutter/material.dart';
import 'package:name_app/Administration.dart';
import 'package:name_app/Financement.dart';
import 'package:name_app/deroulement_recherche.dart';
import 'package:name_app/my_drawer_head.dart';
import 'package:fl_chart/fl_chart.dart'; // Importation de fl_chart

void main() {
  runApp(const SchemaEtude());
}

class SchemaEtude extends StatelessWidget {
  const SchemaEtude({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _comment2Controller = TextEditingController();

  final String _titleText = "Titre complet";
  final String _objectiveText = "Objectif principal";
  String _commentText = "Commentaire";
  String _commentText2 = "Commentaire";

  final TextStyle titleStyle = const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: Colors.purple,
  );
  final TextStyle objectiveStyle = const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 147, 74, 98),
  );
  final TextStyle commentStyle = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  void _editComment() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Modifier le commentaire"),
          content: TextField(
            controller: _commentController,
            decoration: const InputDecoration(hintText: "Nouveau commentaire"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Annuler"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Enregistrer"),
              onPressed: () {
                setState(() {
                  _commentText = _commentController.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _editComment2() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Modifier le commentaire"),
          content: TextField(
            controller: _comment2Controller,
            decoration: const InputDecoration(hintText: "Nouveau commentaire"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Annuler"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Enregistrer"),
              onPressed: () {
                setState(() {
                  _commentText2 = _comment2Controller.text;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      Diagramme("En cours de suivi", 12, Colors.green),
      Diagramme("Suivi complet", 14, const Color.fromARGB(255, 8, 103, 11)),
      Diagramme(
          "Sortis prématurément", 18, const Color.fromARGB(255, 236, 68, 124)),
      Diagramme(
          "Reste à inclure", 21, const Color.fromARGB(255, 225, 153, 153)),
    ];

    var chart1 = PieChart(
      PieChartData(
        sections: data.map((diagramme) {
          return PieChartSectionData(
            value: diagramme.personneinclus.toDouble(),
            color: diagramme.color,
            title: '${diagramme.inclusion}: ${diagramme.personneinclus}',
            radius: 60,
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        }).toList(),
        borderData: FlBorderData(show: false),
        sectionsSpace: 0,
        centerSpaceRadius: 0,
      ),
    );

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEditableText(_titleText, titleStyle),
                  const SizedBox(height: 20),
                  _buildEditableText(_commentText, commentStyle,
                      onPressed: _editComment),
                  const SizedBox(height: 20),
                  _buildEditableText(_objectiveText, objectiveStyle),
                  const SizedBox(height: 20),
                  _buildEditableText(_commentText2, commentStyle,
                      onPressed: _editComment2),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    MyTimeLineTile(
                      isFirst: true,
                      isLast: false,
                      isPast: true,
                      eventCard: Text("Order placed"),
                      child: Text("Details about order placement"),
                    ),
                    MyTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      eventCard: Text("Order processed"),
                      child: Text("Details about order processing"),
                    ),
                    MyTimeLineTile(
                      isFirst: false,
                      isLast: true,
                      isPast: false,
                      eventCard: Text("Order shipped"),
                      child: Text("Details about order shipping"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Etat d'avancement de l'étude",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 275, child: _createLineChart()),
                  const Text(
                    "Inclusion",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 300, child: chart1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableText(String text, TextStyle style,
      {VoidCallback? onPressed}) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: style,
            ),
          ),
        ),
        if (onPressed != null)
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onPressed,
          ),
      ],
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

  Widget _createLineChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 5),
              FlSpot(1, 25),
              FlSpot(2, 100),
              FlSpot(3, 125),
            ],
            isCurved: true,
            color: Colors.blue,
            belowBarData: BarAreaData(show: true),
          ),
        ],
      ),
    );
  }
}

class Diagramme {
  final String inclusion;
  final int personneinclus;
  final Color color;

  Diagramme(this.inclusion, this.personneinclus, this.color);
}

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget eventCard;
  final Widget child;

  const MyTimeLineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventCard,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color.fromARGB(150, 100, 180, 246),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

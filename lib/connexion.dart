import 'package:postgres/postgres.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  late Connection _connection; // Utilisation de Connection pour postgres ^3.x.x

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._internal();

  /// Connexion à la base de données PostgreSQL
  Future<void> connect() async {
    _connection = await Connection.open(
      Endpoint(
        host: 'localhost', // Adresse du serveur
        port: 5432, // Port
        database: 'Prismatics', // Nom de la base de données
        username: 'postgres', // Nom d'utilisateur
        password: 'Prismatics', // Mot de passe
      ),
      settings: const ConnectionSettings(sslMode: SslMode.disable),
    );
    print('Connexion établie.');
  }

  /// Exécution d'une requête SQL
  Future<List<Map<String, dynamic>>> executeQuery(String query) async {
    final results = await _connection.execute(query);
    return results
        .map((row) => row.toColumnMap())
        .toList(); // Retourner les résultats sous forme de liste de maps
  }

  /// Fermeture de la connexion
  Future<void> close() async {
    await _connection.close();
    print('Connexion fermée.');
  }
}

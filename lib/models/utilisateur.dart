class Utilisateur {
  final String id;
  final String nom;
  final String email;
  final String? ville;

  Utilisateur({
    required this.id,
    required this.nom,
    required this.email,
    this.ville,
  });

  Utilisateur.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        nom = json['nom'] as String,
        email = json['email'] as String,
        ville = json['ville'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'email': email,
        'ville': ville,
      };

  @override
  String toString() => 'Utilisateur($nom, $email)';
}
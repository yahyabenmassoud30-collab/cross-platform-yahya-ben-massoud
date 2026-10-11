import 'utilisateur.dart';

enum CategorieAnnonce { objet, service, covoiturage }

enum StatutAnnonce { disponible, reservee, terminee }

class Annonce {
  final String id;
  final String titre;
  final String description;
  final CategorieAnnonce categorie;
  final StatutAnnonce statut;
  final Utilisateur proprietaire;
  final DateTime dateCreation;

  Annonce({
    required this.id,
    required this.titre,
    required this.description,
    required this.categorie,
    required this.proprietaire,
    DateTime? dateCreation,
    this.statut = StatutAnnonce.disponible,
  }) : dateCreation = dateCreation ?? DateTime.now();

  Annonce.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        titre = json['titre'] as String,
        description = json['description'] as String,
        categorie = CategorieAnnonce.values.byName(json['categorie'] as String),
        statut = StatutAnnonce.values.byName(json['statut'] as String),
        proprietaire =
            Utilisateur.fromJson(json['proprietaire'] as Map<String, dynamic>),
        dateCreation = DateTime.parse(json['dateCreation'] as String);

  Map<String, dynamic> toJson() => {
        'id': id,
        'titre': titre,
        'description': description,
        'categorie': categorie.name,
        'statut': statut.name,
        'proprietaire': proprietaire.toJson(),
        'dateCreation': dateCreation.toIso8601String(),
      };

  Annonce copyWith({StatutAnnonce? statut}) => Annonce(
        id: id,
        titre: titre,
        description: description,
        categorie: categorie,
        proprietaire: proprietaire,
        dateCreation: dateCreation,
        statut: statut ?? this.statut,
      );

  @override
  String toString() => '[${categorie.name}] $titre (${statut.name})';
}
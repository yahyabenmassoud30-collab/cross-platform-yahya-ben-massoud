import 'annonce.dart';
import 'utilisateur.dart';

class Echange {
  final String id;
  final Annonce annonce;
  final Utilisateur demandeur;
  final DateTime dateEchange;
  final String? message;

  Echange({
    required this.id,
    required this.annonce,
    required this.demandeur,
    DateTime? dateEchange,
    this.message,
  }) : dateEchange = dateEchange ?? DateTime.now();

  Echange.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        annonce = Annonce.fromJson(json['annonce'] as Map<String, dynamic>),
        demandeur =
            Utilisateur.fromJson(json['demandeur'] as Map<String, dynamic>),
        dateEchange = DateTime.parse(json['dateEchange'] as String),
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'annonce': annonce.toJson(),
        'demandeur': demandeur.toJson(),
        'dateEchange': dateEchange.toIso8601String(),
        'message': message,
      };

  @override
  String toString() => 'Echange(${demandeur.nom} -> ${annonce.titre})';
}
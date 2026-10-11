import 'models/models.dart';

/// Simule le chargement de 5 annonces de test (accès réseau fictif).
Future<List<Annonce>> chargerAnnonces() async {
  await Future.delayed(const Duration(seconds: 2));

  final amine = Utilisateur(
      id: 'u1', nom: 'Amine', email: 'amine@mail.com', ville: 'Tunis');
  final sara = Utilisateur(
      id: 'u2', nom: 'Sara', email: 'sara@mail.com', ville: 'Sfax');

  return [
    Annonce(
        id: 'a1',
        titre: 'Perceuse électrique',
        description: 'À prêter pour le week-end',
        categorie: CategorieAnnonce.objet,
        proprietaire: amine),
    Annonce(
        id: 'a2',
        titre: 'Cours de maths',
        description: 'Soutien niveau lycée',
        categorie: CategorieAnnonce.service,
        proprietaire: sara,
        statut: StatutAnnonce.reservee),
    Annonce(
        id: 'a3',
        titre: 'Tunis → Sousse',
        description: '3 places disponibles vendredi',
        categorie: CategorieAnnonce.covoiturage,
        proprietaire: amine),
    Annonce(
        id: 'a4',
        titre: 'Vélo de ville',
        description: 'Bon état',
        categorie: CategorieAnnonce.objet,
        proprietaire: sara,
        statut: StatutAnnonce.terminee),
    Annonce(
        id: 'a5',
        titre: 'Aide au déménagement',
        description: 'Samedi matin',
        categorie: CategorieAnnonce.service,
        proprietaire: amine),
  ];
}

/// Fonction pure : true uniquement si l'annonce est disponible.
bool peutReserver(Annonce annonce) =>
    annonce.statut == StatutAnnonce.disponible;

Future<void> main() async {
  print('Chargement des annonces...');
  final annonces = await chargerAnnonces();
  print('${annonces.length} annonces chargées.\n');

  for (final a in annonces) {
    print('$a -> réservable : ${peutReserver(a)}');
  }

  // Test de sérialisation
  final json = annonces.first.toJson();
  final copie = Annonce.fromJson(json);
  print('\nJSON OK : ${copie.titre == annonces.first.titre}');

  // Un échange
  final echange = Echange(
      id: 'e1',
      annonce: annonces.first,
      demandeur: annonces[1].proprietaire,
      message: 'Bonjour, est-elle encore disponible ?');
  print(echange);
}
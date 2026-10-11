import 'package:flutter_test/flutter_test.dart';
import 'package:localswap/main.dart';
import 'package:localswap/models/models.dart';

void main() {
  test('chargerAnnonces loads the expected list and availability states', () async {
    final annonces = await chargerAnnonces();

    expect(annonces, hasLength(5));
    expect(annonces.first.titre, 'Perceuse électrique');
    expect(annonces[1].statut, StatutAnnonce.reservee);
    expect(peutReserver(annonces.first), isTrue);
    expect(peutReserver(annonces[1]), isFalse);
    expect(peutReserver(annonces[3]), isFalse);
  });

  test('Annonce JSON round trip keeps the same values', () async {
    final annonces = await chargerAnnonces();
    final json = annonces.first.toJson();
    final copie = Annonce.fromJson(json);

    expect(copie.id, annonces.first.id);
    expect(copie.titre, annonces.first.titre);
    expect(copie.description, annonces.first.description);
    expect(copie.proprietaire.nom, annonces.first.proprietaire.nom);
    expect(copie.categorie, annonces.first.categorie);
  });
}

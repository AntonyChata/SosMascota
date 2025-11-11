import 'package:cloud_firestore/cloud_firestore.dart';
import '../modelo/colaborador_model.dart';

class ColaboradorViewModel {
  final _db = FirebaseFirestore.instance;
  final String coleccion = 'colaboradores';

  // Obtener la lista completa una vez
  Future<List<Colaborador>> obtenerColaboradores() async {
    final snapshot = await _db.collection(coleccion).get();
    return snapshot.docs
        .map((doc) => Colaborador.fromMap(doc.data(), doc.id))
        .toList();
  }

  // Stream para escuchar cambios en tiempo real
  Stream<List<Colaborador>> streamColaboradores() {
    return _db.collection(coleccion).snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Colaborador.fromMap(doc.data(), doc.id))
          .toList();
    });
  }
}

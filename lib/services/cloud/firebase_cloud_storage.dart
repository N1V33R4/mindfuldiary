import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mindfuldiary/services/cloud/cloud_note.dart';
import 'package:mindfuldiary/services/cloud/cloud_storage_constants.dart';
import 'package:mindfuldiary/services/cloud/cloud_storage_exceptions.dart';

class FirebaseCloudStorage {
  final notes = FirebaseFirestore.instance.collection('notes');

  static final FirebaseCloudStorage _shared = FirebaseCloudStorage._sharedInstance();
  FirebaseCloudStorage._sharedInstance();
  factory FirebaseCloudStorage() => _shared;

  Stream<Iterable<CloudNote>> allNotes({required String ownerUserId}) =>
      notes.snapshots().map(
            (event) => event.docs
                .map(
                  (doc) => CloudNote.fromSnapshot(doc),
                )
                .where((note) => note.ownerUserId == ownerUserId),
          );

  void createNewNote({required String ownerUserId}) async {
    await notes.add({
      ownerUserIdFieldName: ownerUserId,
      titleFieldName: '',
      textFieldName: '',
    });
  }

  Future<Iterable<CloudNote>> getNotes({required String ownerUserId}) async {
    try {
      return await notes
          .where(
            ownerUserIdFieldName,
            isEqualTo: ownerUserId,
          )
          .get()
          .then(
            (value) => value.docs.map(
              (doc) => CloudNote(
                documentId: doc.data()[ownerUserIdFieldName],
                ownerUserId: ownerUserId,
                title: doc.data()[titleFieldName],
                text: doc.data()[textFieldName],
              ),
            ),
          );
    } catch (e) {
      throw CouldNotGetAllNotesException();
    }
  }

  Future<void> updateNote({
    required String documentId,
    required String title,
    required String text,
  }) async {
    try {
      await notes.doc(documentId).update({
        titleFieldName: title,
        textFieldName: text,
      });
    } catch (e) {
      throw CouldNotUpdateNoteException();
    }
  }

  Future<void> deleteNote({required String documentId}) async {
    try {
      await notes.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteNoteException();
    }
  }
}

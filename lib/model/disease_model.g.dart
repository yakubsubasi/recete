// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disease_model.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class DiseaseCollectionReference
    implements
        DiseaseQuery,
        FirestoreCollectionReference<DiseaseQuerySnapshot> {
  factory DiseaseCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$DiseaseCollectionReference;

  static Disease fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Disease.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Disease value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  DiseaseDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<DiseaseDocumentReference> add(Disease value);
}

class _$DiseaseCollectionReference extends _$DiseaseQuery
    implements DiseaseCollectionReference {
  factory _$DiseaseCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$DiseaseCollectionReference._(
      firestore.collection('diseases2').withConverter(
            fromFirestore: DiseaseCollectionReference.fromFirestore,
            toFirestore: DiseaseCollectionReference.toFirestore,
          ),
    );
  }

  _$DiseaseCollectionReference._(
    CollectionReference<Disease> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Disease> get reference =>
      super.reference as CollectionReference<Disease>;

  @override
  DiseaseDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return DiseaseDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<DiseaseDocumentReference> add(Disease value) {
    return reference.add(value).then((ref) => DiseaseDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$DiseaseCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class DiseaseDocumentReference
    extends FirestoreDocumentReference<DiseaseDocumentSnapshot> {
  factory DiseaseDocumentReference(DocumentReference<Disease> reference) =
      _$DiseaseDocumentReference;

  DocumentReference<Disease> get reference;

  /// A reference to the [DiseaseCollectionReference] containing this document.
  DiseaseCollectionReference get parent {
    return _$DiseaseCollectionReference(reference.firestore);
  }

  @override
  Stream<DiseaseDocumentSnapshot> snapshots();

  @override
  Future<DiseaseDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? id,
    String? name,
  });

  Future<void> set(Disease value);
}

class _$DiseaseDocumentReference
    extends FirestoreDocumentReference<DiseaseDocumentSnapshot>
    implements DiseaseDocumentReference {
  _$DiseaseDocumentReference(this.reference);

  @override
  final DocumentReference<Disease> reference;

  /// A reference to the [DiseaseCollectionReference] containing this document.
  DiseaseCollectionReference get parent {
    return _$DiseaseCollectionReference(reference.firestore);
  }

  @override
  Stream<DiseaseDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return DiseaseDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<DiseaseDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return DiseaseDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? id = _sentinel,
    Object? name = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as String?,
      if (name != _sentinel) "name": name as String?,
    };

    return reference.update(json);
  }

  Future<void> set(Disease value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is DiseaseDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class DiseaseDocumentSnapshot extends FirestoreDocumentSnapshot {
  DiseaseDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Disease> snapshot;

  @override
  DiseaseDocumentReference get reference {
    return DiseaseDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Disease? data;
}

abstract class DiseaseQuery implements QueryReference<DiseaseQuerySnapshot> {
  @override
  DiseaseQuery limit(int limit);

  @override
  DiseaseQuery limitToLast(int limit);

  DiseaseQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  DiseaseQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  DiseaseQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  DiseaseQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    DiseaseDocumentSnapshot? startAtDocument,
    DiseaseDocumentSnapshot? endAtDocument,
    DiseaseDocumentSnapshot? endBeforeDocument,
    DiseaseDocumentSnapshot? startAfterDocument,
  });

  DiseaseQuery orderById({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    DiseaseDocumentSnapshot? startAtDocument,
    DiseaseDocumentSnapshot? endAtDocument,
    DiseaseDocumentSnapshot? endBeforeDocument,
    DiseaseDocumentSnapshot? startAfterDocument,
  });

  DiseaseQuery orderByName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    DiseaseDocumentSnapshot? startAtDocument,
    DiseaseDocumentSnapshot? endAtDocument,
    DiseaseDocumentSnapshot? endBeforeDocument,
    DiseaseDocumentSnapshot? startAfterDocument,
  });
}

class _$DiseaseQuery extends QueryReference<DiseaseQuerySnapshot>
    implements DiseaseQuery {
  _$DiseaseQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Disease> reference;

  DiseaseQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Disease> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return DiseaseQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<DiseaseDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: DiseaseDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return DiseaseQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<DiseaseQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<DiseaseQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  DiseaseQuery limit(int limit) {
    return _$DiseaseQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  DiseaseQuery limitToLast(int limit) {
    return _$DiseaseQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  DiseaseQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$DiseaseQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  DiseaseQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$DiseaseQuery(
      reference.where(
        "id",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  DiseaseQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$DiseaseQuery(
      reference.where(
        "name",
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  DiseaseQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DiseaseDocumentSnapshot? startAtDocument,
    DiseaseDocumentSnapshot? endAtDocument,
    DiseaseDocumentSnapshot? endBeforeDocument,
    DiseaseDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DiseaseQuery(query, _collection);
  }

  DiseaseQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DiseaseDocumentSnapshot? startAtDocument,
    DiseaseDocumentSnapshot? endAtDocument,
    DiseaseDocumentSnapshot? endBeforeDocument,
    DiseaseDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("id", descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DiseaseQuery(query, _collection);
  }

  DiseaseQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DiseaseDocumentSnapshot? startAtDocument,
    DiseaseDocumentSnapshot? endAtDocument,
    DiseaseDocumentSnapshot? endBeforeDocument,
    DiseaseDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy("name", descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DiseaseQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$DiseaseQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class DiseaseQuerySnapshot
    extends FirestoreQuerySnapshot<DiseaseQueryDocumentSnapshot> {
  DiseaseQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Disease> snapshot;

  @override
  final List<DiseaseQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<DiseaseDocumentSnapshot>> docChanges;
}

class DiseaseQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements DiseaseDocumentSnapshot {
  DiseaseQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Disease> snapshot;

  @override
  DiseaseDocumentReference get reference {
    return DiseaseDocumentReference(snapshot.reference);
  }

  @override
  final Disease data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Disease _$DiseaseFromJson(Map<String, dynamic> json) => Disease(
      id: json['id'] as String?,
      name: json['name'] as String?,
      specialities: (json['specialities'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$SpecialityEnumMap, e))
          .toList(),
      prescriptions: (json['prescriptions'] as List<dynamic>?)
          ?.map((e) => Prescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiseaseToJson(Disease instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'specialities':
          instance.specialities?.map((e) => _$SpecialityEnumMap[e]).toList(),
      'prescriptions': instance.prescriptions?.map((e) => e.toJson()).toList(),
    };

const _$SpecialityEnumMap = {
  Speciality.internalMedicine: 'internalMedicine',
  Speciality.pediatric: 'pediatric',
  Speciality.orthopedic: 'orthopedic',
  Speciality.cardiology: 'cardiology',
  Speciality.neurology: 'neurology',
  Speciality.oncology: 'oncology',
  Speciality.psychiatry: 'psychiatry',
  Speciality.generalSurgery: 'generalSurgery',
  Speciality.gynecology: 'gynecology',
  Speciality.urology: 'urology',
  Speciality.emergency: 'emergency',
  Speciality.ent: 'ent',
  Speciality.dental: 'dental',
  Speciality.ophtalmology: 'ophtalmology',
  Speciality.dermatology: 'dermatology',
  Speciality.pulmonaryDisease: 'pulmonaryDisease',
  Speciality.familyMedicine: 'familyMedicine',
};

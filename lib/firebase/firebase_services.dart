import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/category_model.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/models/login_request.dart';
import 'package:evently_app/models/register_request.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  static Future<UserCredential> register(RegisterRequest request) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: request.email,
          password: request.password,
        );
    return userCredential;
  }

  static Future<UserCredential> login(LoginRequest request) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: request.email,
          password: request.password,
        );
    return userCredential;
  }

  static CollectionReference<UserModel> getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollection = db
        .collection("users")
        .withConverter(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return usersCollection;
  }

  static Future<void> addUserToFirestore(UserModel user) async {
    // FirebaseFirestore database = FirebaseFirestore.instance;
    // CollectionReference<Map<String, dynamic>> usersCollection = database
    //     .collection("users");
    // DocumentReference<Map<String, dynamic>> userDocument = usersCollection.doc(
    //   user.id,
    // );
    // return userDocument.set({
    //   "id": user.id,
    //   "name": user.name,
    //   "email": user.email,
    // });
    CollectionReference<UserModel> usersCollection = getUsersCollection();

    DocumentReference<UserModel> userDocument = usersCollection.doc(user.id);
    return await userDocument.set(user);
  }

  static Future<UserModel> getUserFromFireStore(String uid) async {
    CollectionReference<UserModel> usersCollection = getUsersCollection();

    DocumentReference<UserModel> userDocument = usersCollection.doc(uid);

    DocumentSnapshot<UserModel> snapshot = await userDocument.get();
    return snapshot.data()!;
  }

  static CollectionReference<EventModel> getEventsCollection(
    BuildContext context,
  ) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = db
        .collection("events")
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) =>
              EventModel.fromJson(snapshot.data()!, context),
          toFirestore: (event, _) => event.toJson(),
        );
    return eventsCollection;
  }

  static Future<void> addEventToFireStore(
    EventModel event,
    BuildContext context,
  ) {
    CollectionReference eventsCollection = getEventsCollection(context);
    DocumentReference eventDocument = eventsCollection.doc();
    event.eventID = eventDocument.id;
    return eventDocument.set(event);
  }

  static Future<List<EventModel>> getEventsFromFirestore(
    BuildContext context,
   [ CategoryModel? category]
  ) async {
    CollectionReference<EventModel> eventsCollection = getEventsCollection(
      context,
    );
    QuerySnapshot<EventModel> querySnapshot = await eventsCollection
        .where("categoryID", isEqualTo: category?.id == "0" ? null : category?.id)
        .orderBy("dateTime")
        .get();
    List<EventModel> events = querySnapshot.docs
        .map((document) => document.data())
        .toList();
    return events;
  }

  static Stream<List<EventModel>> getEventsFromFirestoreRealTime(
    BuildContext context,
    CategoryModel category,
  ) async* {
    CollectionReference<EventModel> eventsCollection = getEventsCollection(
      context,
    );
    Stream<QuerySnapshot<EventModel>> streamSnapshots = eventsCollection
        .where("categoryID", isEqualTo: category.id == "0" ? null : category.id)
        .orderBy("dateTime")
        .snapshots();

    Stream<List<EventModel>> events = streamSnapshots.map(
      (querySnapshot) => querySnapshot.docs
          .map((documentSnapshot) => documentSnapshot.data())
          .toList(),
    );
    yield* events;
  }

  static Future<void> addFavoriteEvents(EventModel event) {
    UserModel currentUser = UserModel.user!;
    currentUser.favoriteEventsListIds.add(event.eventID);
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(
      currentUser.id,
    );
    return userDocument.set(currentUser);
  }

  static Future<void> removeEventFromFavorites(EventModel event) {
    UserModel currentUser = UserModel.user!;
    currentUser.favoriteEventsListIds.remove(event.eventID);
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(
      currentUser.id,
    );
    return userDocument.set(currentUser);
  }

  static Future<List<EventModel>> getFavoriteEvents(BuildContext context)async{
    List<EventModel> events = await getEventsFromFirestore(context);
    List<EventModel> favoriteEvents = events.where((event)=> UserModel.user!.favoriteEventsListIds.contains(event.eventID)).toList();

    return favoriteEvents;

}

 static Stream<List<EventModel>> getFavoriteEventsRealTime(
    BuildContext context,
  ) {
    String currentUserId = UserModel.user!.id;
    Stream<DocumentSnapshot<UserModel>> userDocStream = getUsersCollection()
        .doc(currentUserId)
        .snapshots();

    return userDocStream.asyncMap((userSnapshot) async {
      UserModel.user = userSnapshot.data();       
      List<EventModel> allFavoriteEvents = await getFavoriteEvents(context);
      return allFavoriteEvents;
    });
  }

  static Future<void> removeEventsFromFirestore(String eventId,BuildContext context){
   CollectionReference<EventModel> eventsCollection = getEventsCollection(context);
   DocumentReference<EventModel> documentReference = eventsCollection.doc(eventId);
   return  documentReference.delete();
  }

  static Future<void> updateEventInFirestore(EventModel event,BuildContext context){
    CollectionReference<EventModel> eventsCollection = getEventsCollection(context);
    DocumentReference<EventModel> eventDocument = eventsCollection.doc(event.eventID);

  return  eventDocument.update({
     "categoryID": event.category.id,
      "title": event.title,
      "description": event.description,
      "dateTime": event.dateTime,
    });

  }
}

















////List<String> favoriteEventsIds = UserModel.user!.favoriteEventsListIds;
/// // List<EventModel> favoriteEvents = allEvents
      //     .where((event) => favoriteEventsIds.contains(event.eventID))
      //     .toList();
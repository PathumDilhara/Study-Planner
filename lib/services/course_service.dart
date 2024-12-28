import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_planner/models/course_model.dart';

class CourseService {
  // create the firestore collection reference
  final CollectionReference courseCollection =
      FirebaseFirestore.instance.collection("courses");

  // Add a new course
  Future<void> createNewCourse(CourseModel course) async {
    try {
      // concert course into dart
      final Map<String, dynamic> data = course.toJson();

      // add data to the fire store
      await courseCollection.add(data).then((docRef) {
        docRef.update({"id": docRef.id});
      });
    } catch (err) {
      print("####################Error $err");
    }
  }

  // get all data from firestore
  Stream<List<CourseModel>> get courses {
    try {
      return courseCollection.snapshots().map((snapshot) {
        return snapshot.docs
            .map((elt) =>
                CourseModel.fromJson(elt.data() as Map<String, dynamic>))
            .toList();
      });
    } catch (err) {
      print("Stream error $err");
      return Stream.empty();
    }
  }
}

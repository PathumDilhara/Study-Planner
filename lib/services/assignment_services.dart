import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_planner/models/assignment_model.dart';

class AssignmentServices {
  // crate fire store collection reference
  final CollectionReference courseCollection =
      FirebaseFirestore.instance.collection("courses");

  // create a new assignment in to a course
  Future<void> createAssignment(
      String courseId, AssignmentModel assignment) async {
    try {
      final Map<String, dynamic> data = assignment.toJson();

      final CollectionReference assignmentCollection =
          courseCollection.doc(courseId).collection("assignments");

      await assignmentCollection.add(data).then(
            (docRef) => docRef.update(
              {"id": docRef.id},
            ),
          );
      print("Assignment saved");
    } catch (err) {
      print(err);
    }
  }
}

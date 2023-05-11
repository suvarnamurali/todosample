import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late CollectionReference _todosRef;

  @override
  void initState() {
    super.initState();
    // Get a reference to the "todos" collection
    _todosRef = _firestore.collection('todos');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Todo Demo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
              ),
            ),
          ),
          TextButton(
            child: Text('Add'),
            onPressed: () async {
              // Add a new document with a generated ID
              await _todosRef.add({
                'title': _titleController.text,
                'description': _descriptionController.text,
                'completed': false,
                'userid': _auth.currentUser!.uid, // Add the user ID
              });

              // Clear the text fields
              _titleController.clear();
              _descriptionController.clear();
            },
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _todosRef
                  .where('userid', isEqualTo: _auth.currentUser!.uid) // Query the tasks by user ID
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final List<DocumentSnapshot> documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    final document = documents[index];
                    return ListTile(
                      title: Text(document['title']),
                      subtitle: Text(document['description']),
                      trailing: Checkbox(
                        value: document['completed'],
                        onChanged: (bool? value) async {
                          if (value != null) {
                            // Update the document
                            final docRef = _todosRef.doc(document.id);
                            await docRef.update({
                              'completed': value,
                            });
                          }
                        },
                      ),
                      onLongPress: () async {
                        // Delete the document
                        final docRef = _todosRef.doc(document.id);
                        await docRef.delete();
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

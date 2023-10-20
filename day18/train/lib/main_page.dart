import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List items = [];
  var instance = FirebaseFirestore.instance;

  readFromCloudFireStore() async {
    var res = await instance.collection('memo').get();

    setState(() {
      items = res.docs.map((e) => e.data()).toList();
      print('items : ${items}');
    });
  }

  getDocument(String documentId) async {
    // var instance = FirebaseFirestore.instance;
    var res = await instance.collection('memo').doc(documentId).get();
    print(res.data());
  }

  readFinishedDocument() async {
    var res = await instance
        .collection('memo')
        .where('isFinished', isEqualTo: true)
        .get();
    print(res.docs);
    print(res.size);
  }

  createDocument(String title) async {
    var res = await instance
        .collection('memo')
        .add({'title': title, 'isFinished': false});
  }

  createDocumentById(String docId, String title) async {
    var res = await instance
        .collection('memo')
        .doc(docId)
        .set({'title': title, 'isFinished': false});
  }

  updateDocument(String docId, Map<String, dynamic> data) {
    instance.collection('memo').doc(docId).update(data);
  }

  deleteDocument(String docId) {
    instance.collection('memo').doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
            onPressed: readFromCloudFireStore,
            child: const Text('가져오기'),
          ),
          TextButton(
            onPressed: () => getDocument('rO76rZr34JOomUktTO4S'),
            child: const Text('하나만 가져오기'),
          ),
          TextButton(
            onPressed: () {
              readFinishedDocument();
            },
            child: const Text('isFinished만 가져오기'),
          ),
          TextButton(
            onPressed: () {
              createDocument('책방가서 책읽기');
            },
            child: const Text('문서 추가'),
          ),
          TextButton(
            onPressed: () {
              createDocumentById('123456789', '노래방가서 노래부르기');
            },
            child: const Text('문서 추가( 지정아이디)'),
          ),
          TextButton(
            onPressed: () {
              updateDocument('123456789', {'isFinished': true});
            },
            child: const Text('문서 수정'),
          ),
          TextButton(
            onPressed: () {
              deleteDocument('123456789');
            },
            child: const Text('문서 삭제'),
          ),
          if (items.isNotEmpty)
            //... : spread 문법
            //리스트의 결과 값을 추가
            ...items.map((e) => Text(e['title'])).toList()
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:note_app/provider/notes_provider.dart';
import 'package:note_app/screenes/notes_detail.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
     context.read<NotesProvider>().initialData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [Text("Notes"), Icon(Icons.search)],
        ),
        backgroundColor: Colors.black,
      ),
      body:context.watch<NotesProvider>().arrData.isEmpty?
      Container(height: double.infinity,width: double.infinity,color: Colors.black,
      child: Center(child:Image.asset('assets/images/background.jpg',height:75,width: 75  ) ,),):
      Container(
          color: Colors.black,
          child: Consumer<NotesProvider>(builder: (_, provider, __) {
            notes = provider.arrData;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: gridBulderUI(),
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotesDetail(),
              ));
        },

       backgroundColor: Colors.white,
        child: const Icon(Icons.add,color: Colors.black,),
      ),
    );
  }
  Widget containerUi(var index){
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Color((math.Random().nextDouble() * 0xffffff).toInt()).withOpacity(1.0),
          borderRadius: BorderRadius.circular(10),
          ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
        children: [
          Text('${index+1}.',style: const TextStyle(fontSize: 15),),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


          Text('${notes[index]['tittle']}',style: const TextStyle(fontSize: 20),),

        ],),
        gap(height: 10),
        const Divider(height: 4,thickness: 4,),
        gap(height: 15),
        Text('${notes[index]['des']}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  context.read<NotesProvider>().deletNotes(notes[index]['note_id']);
                },
                child: const Icon(Icons.delete),
              ),
            ],
          )
      ]
        ),
      ),

    );
  }


  Widget gap({double height = 0, double width = 0}){
    return SizedBox(
      height: height,
      width: width,
    );
  }


  Widget gridBulderUI(){
    return GridView.builder(

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:  2,
      ),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onLongPress: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotesDetail(
                      title: '${notes[index]['tittle']}',
                      des: '${notes[index]['des']}',
                      index: notes[index]['note_id'],
                    ),
                  )
              );
            },
            child: containerUi(index),
          ),
        );
      },
    );
  }
}

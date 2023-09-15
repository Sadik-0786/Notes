
import 'package:flutter/material.dart';
import 'package:note_app/provider/notes_provider.dart';
import 'package:provider/provider.dart';

class NotesDetail extends StatefulWidget {
  final int index ;
  final String title;
  final String des ;

  const NotesDetail({super.key,  this.index=0,this.title='',this.des=''});
  @override
  State<NotesDetail> createState() => _NotesDetailState();
}

class _NotesDetailState extends State<NotesDetail> {

  final TextEditingController _controller1=TextEditingController();

  final TextEditingController _controller2=TextEditingController();

 @override
  void initState() {
    super.initState();
    if(widget.index>0) {
      _controller1.text = widget.title;
      _controller2.text = widget.des;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: (){
              if(_controller1.text.toString()!="" || _controller2.text.toString()!="")
              {
                if(widget.index>0){
             context.read<NotesProvider>().updateNotes(widget.index, _controller1.text.toString() ,_controller2.text.toString());
                Navigator.pop(context);
              } else {
                    context.read<NotesProvider>().addData(_controller1.text.toString(), _controller2.text.toString());
                    Navigator.pop(context);
                  }
                }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: Text(widget.index>0?'Update':'Add',style: const TextStyle(color: Colors.black),),)
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child:ListView(
          children: [
            tittleTextField(),
            gap(height: 20),
            descriptionTextField(),
          ],
        ),
      ),
      ),
    );
  }
  Widget descriptionTextField(){
   return  TextFormField(
     maxLines: null,
     controller: _controller2,
     style: const TextStyle(fontSize: 20,color: Colors.grey),
     decoration:  const InputDecoration(
       hintText:"Type something.....",
       hintStyle: TextStyle(color: Colors.grey,fontSize: 25),
       border: OutlineInputBorder(
         borderSide: BorderSide.none,
       ),
     ),
     cursorColor: Colors.grey,

   );
  }

  Widget gap({double height = 0, double width = 0}){
   return SizedBox(
     height: height,
     width: width,
   );
 }

  Widget tittleTextField(){
   return TextField(
     maxLines: null,
     controller: _controller1,
     style: const TextStyle(fontSize: 35,color: Colors.grey),
     decoration: const InputDecoration(
       hintText: "Enter Title",
       hintStyle: TextStyle(color: Colors.grey,fontSize: 35),
       border: OutlineInputBorder(
         borderSide: BorderSide.none,
       ),
     ),
     cursorColor: Colors.grey,

   ) ;
  }
}

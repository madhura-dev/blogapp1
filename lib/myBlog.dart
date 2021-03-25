import 'package:blogapp1/displayPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class MyBlogs extends StatefulWidget {

  @override
  _MyBlogsState createState() => _MyBlogsState();
}

class _MyBlogsState extends State<MyBlogs> {
  final ref = Firestore.instance.collection("myblogs");
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  TextEditingController Imgcontroller = TextEditingController();

  ScrollController controller = ScrollController();


  Map<String, dynamic>addToBlog;
  addData(){
    addToBlog={
      'title':titlecontroller.text,
      'image':Imgcontroller.text,
      'description':desccontroller.text,

    };
    ref.add(addToBlog).whenComplete(() => Navigator.pop(context));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          elevation:0,

          title: Text("Travel Blog",style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        actions: [
          Padding(padding: EdgeInsets.all(10.0),
          child: Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

            ),
            child: Icon(Icons.favorite),
          ),)
        ],


        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                  colors: [
                    Colors.white,
                    Colors.blueAccent,
                    Colors.white12,
                    Colors.blueGrey,
                    Colors.white12,
                    Colors.blueAccent,
                    Colors.white,

                  ]
              )
            ),
            child: SingleChildScrollView(
              child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20.0)

               ),
                child: StreamBuilder(
                    stream: ref.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData){
                        return Column(
                          children: [
                            Container(
                              child: ListView.builder(
                                controller: controller,
                                scrollDirection: Axis.vertical,

                                shrinkWrap: true,
                                itemCount: snapshot.data.documents.length ,
                                itemBuilder: (context, index){
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=> DisplayPage(
                                        snapshot.data.documents[index].data["title"],
                                        snapshot.data.documents[index].data["image"],
                                        snapshot.data.documents[index].data["description"],

                                      )));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60.0),
                                      ),
                                      child: Card(

                                        shadowColor: Colors.grey,


                                        child: Material(
                                          elevation: 14.0,
                                          borderRadius: BorderRadius.circular(30.0),

                                          shadowColor: Colors.black12,
                                          child: FittedBox(
                                            child: Container(



                                              child: Material(

                                                color: Colors.white24,
                                                elevation: 14.0,
                                                borderRadius: BorderRadius.circular(50.0),
                                                shadowColor: Colors.grey,


                                                child: Row(

                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Container(

                                                      child:
                                                      IconButton(icon: Icon(Icons.edit),
                                                          onPressed: () {
                                                            titlecontroller.text = snapshot.data.documents[index].data['title'];
                                                            Imgcontroller.text = snapshot.data.documents[index].data['image'];
                                                            desccontroller.text = snapshot.data.documents[index].data['description'];

                                                            showDialog(context: context, builder: (context) => Dialog(
                                                              child: Container(
                                                                height: 300,
                                                                width: 400,
                                                                color: Colors.white,
                                                                child: Container(
                                                                  child: ClipRRect(

                                                                      borderRadius: new BorderRadius.circular(24.0),
                                                                    child: Column(
                                                                      children: [

                                                                        Padding(

                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: TextFormField(
                                                                            controller: titlecontroller,
                                                                            decoration: InputDecoration(
                                                                                labelText: 'Title',
                                                                                hintText: 'Enter title'
                                                                            ),
                                                                            style: TextStyle(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                            ),

                                                                          ),
                                                                        ),
                                                                        Padding(

                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: TextFormField(
                                                                            controller: Imgcontroller,
                                                                            decoration: InputDecoration(
                                                                                labelText: 'Image',
                                                                                hintText: 'ImageUrl'
                                                                            ),
                                                                            style: TextStyle(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                            ),

                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: TextFormField(
                                                                            controller: desccontroller,
                                                                            decoration: InputDecoration(
                                                                                labelText: 'Description',
                                                                                hintText: 'Enter Description'
                                                                            ),
                                                                            style: TextStyle(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: Colors.black,
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        Container(
                                                                          height: 40,
                                                                          width: 100,
                                                                          color: Colors.yellow,
                                                                          child: TextButton(
                                                                            onPressed: (){
                                                                              snapshot.data.documents[index].reference.updateData({
                                                                                'title':titlecontroller.text,
                                                                                'image':Imgcontroller.text,
                                                                                'description':desccontroller.text,

                                                                              }
                                                                              );
                                                                            },
                                                                            child: Text('update',style: TextStyle(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w700,
                                                                              color: Colors.black,
                                                                            ),),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),);

                                                          }),
                                                    ),


                                                    Text(snapshot.data.documents[index].data['title'],style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.w500
                                                    ),),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Image.network(snapshot.data.documents[index].data['image'],
                                                      height: 120,
                                                      width: 110,
                                                        fit: BoxFit.cover,
                                                      alignment: Alignment.centerLeft,),
                                                    ),


                                                    InkWell(
                                                        onTap: (){
                                                          snapshot.data.documents[index].reference.delete();
                                                        },
                                                        child: Icon(Icons.delete)),

                                                  ],

                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                      ),
                                    ),
                                  );

                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.yellowAccent,


                              ),



                              height: 40,
                              width: 60,




                              child: IconButton(

                                 icon: Icon(Icons.add_a_photo_rounded),







                                onPressed: (){
                                  showDialog(context: context, builder: (context) => Dialog(
                                    child: Container(
                                      height: 300,
                                      width: 400,
                                      color: Colors.white,
                                      child: Column(
                                        children: [

                                          Padding(

                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: titlecontroller,
                                              decoration: InputDecoration(
                                                  labelText: 'Title',
                                                  hintText: 'Enter title'
                                              ),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),

                                            ),
                                          ),
                                          Padding(

                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: Imgcontroller,
                                              decoration: InputDecoration(
                                                  labelText: 'Image',
                                                  hintText: 'ImageUrl'
                                              ),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),

                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: desccontroller,
                                              decoration: InputDecoration(
                                                  labelText: 'Description',
                                                  hintText: 'Enter Description'
                                              ),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),

                                          Container(
                                            height: 40,
                                            width: 100,
                                            color: Colors.deepPurpleAccent,
                                            child: TextButton(
                                              onPressed: (){
                                                addData();
                                              },
                                              child: Text('submit',style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.black
                                              ),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),);
                                },


                              ),

                            ),
                          ],
                        );
                      }
                      else return CircularProgressIndicator();

                    }
                ),
              ),
            ),
          ),
        ),
    );

  }
}

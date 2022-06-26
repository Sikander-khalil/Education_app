import 'package:edu_flex/Dashboard2.dart';
import 'package:edu_flex/screens/HomeScreen.dart';

import 'package:flutter/material.dart';
import 'add.dart';
import 'dbhelper.dart';
import 'model.dart';

class ListScreen extends StatefulWidget {
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
   DatabaseHandler handler;
   Future<List<todo>> _todo;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        _todo = getList();
      });
    });
  }

  Future<List<todo>> getList() async {
    return await handler.todos();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _todo = getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(' Time table'),
        leading: new IconButton(onPressed:(){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));

        }, icon: new Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      body: FutureBuilder<List<todo>>(
        future: _todo,
        builder: (BuildContext context, AsyncSnapshot<List<todo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return new Center(
              child: new CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return new Text('Error: ${snapshot.error}');
          } else {
            final items = snapshot.data ?? <todo>[];
            return new Scrollbar(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Icon(Icons.delete_forever),
                      ),
                      key: ValueKey<int>(items[index].id),
                      onDismissed: (DismissDirection direction) async {
                        await handler.deletetodo(items[index].id);
                        setState(() {
                          items.remove(items[index]);
                        });
                      },
                      child: Table(
                        border: TableBorder.all(),
                        columnWidths: const <int, TableColumnWidth>{
                          1: FixedColumnWidth(140),
                        },
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                         TableRow(

                           children: [
                             TableCell(
                                 child: Center(
                                   child: ListTile(
                                     contentPadding: const EdgeInsets.all(8.0),
                                     title: Text(items[index].title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                     subtitle: Text(items[index].description.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                   ),
                                 )),
                           ]
                         ),
                        ],

                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

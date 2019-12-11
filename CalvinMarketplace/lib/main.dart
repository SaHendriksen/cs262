//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//
//import 'classes/record.dart';
//
//void main() => runApp(MyApp());
//
//final dummySnapshot = [
//  {"name": "Filip", "votes": 15},
//  {"name": "Abraham", "votes": 14},
//  {"name": "Richard", "votes": 11},
//  {"name": "Ike", "votes": 10},
//  {"name": "Justin", "votes": 1},
//];
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Baby Names',
//      home: MyHomePage(),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() {
//    return _MyHomePageState();
//  }
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Baby Name Votes')),
//      body: _buildBody(context),
//    );
//  }
//
//  Widget getNameWithCountry(Record record) {
//    return FutureBuilder<String>(
//      future: getNameCountryText(record),
//      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//        if(snapshot.connectionState == ConnectionState.none && snapshot.hasData == null) {
//          return Text(record.name);
//        }
//
//        return Text('${snapshot.data}');
//      }
//    );
//  }
//
//  Future<String> getNameCountryText(Record record) async {
//    Country country = Country.fromSnapshot(await Firestore.instance.collection('countries').document(record.countryId).get());
//
//    return "${record.name} - ${country.name} (${country.continent})";
//  }
//
//  Widget _buildBody(BuildContext context) {
//    return StreamBuilder<QuerySnapshot>(
//      stream: Firestore.instance.collection('baby').snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) return LinearProgressIndicator();
//
//        return _buildList(context, snapshot.data.documents);
//      },
//    );
//  }
//
//  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
//    return ListView(
//      padding: const EdgeInsets.only(top: 20.0),
//      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
//    );
//  }
//
//
//  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//    final record = Record.fromSnapshot(data);
//
//    return Padding(
//      key: ValueKey(record.name),
//      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//      child: Container(
//        decoration: BoxDecoration(
//          border: Border.all(color: Colors.grey),
//          borderRadius: BorderRadius.circular(5.0),
//        ),
//        child: ListTile(
//          title: getNameWithCountry(record),
//          trailing: Text(record.votes.toString()),
//          onTap: () => record.reference.updateData({'votes': FieldValue.increment(1)})
//        ),
//      ),
//    );
//  }
//}
//
//
//

/*
Main - provides a framework for the app that includes the app bar containing the menu
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lab09/pages/home_page.dart';
//import 'package:lab03/pages/edit_item.dart';
//import 'package:lab03/pages/home_page.dart';
//import 'package:lab03/pages/login_page.dart';
//
//import 'package:lab03/pages/filter_list.dart';

import 'package:lab09/types/item.dart';

import 'shared/globals.dart' as globals;
import 'shared/colors.dart' as colors;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {

  List<Widget> menuTabs(BuildContext context) {
    List<Widget> tabs = [
      DrawerHeader(
          decoration: BoxDecoration(
            color: colors.grayBlue,
          ),
          child: Stack(children: <Widget>[
            Align(alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.0,
                )
            ),
            Text(globals.appName,
                style: TextStyle(fontSize: 30) ),
          ],)
      ),
      ListTile(
        leading: Icon(Icons.bookmark_border),
        title: Text('All Items'),
        onTap: (){
//          Navigator.pop(context);
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new FilterList(filter: "All Items")),
//          );
        },
      ),
      ListTile(
        leading: Icon(FontAwesomeIcons.bookOpen),
        title: Text('Textbooks'),
        onTap: (){
//          Navigator.pop(context);
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new FilterList(filter: "Textbook")),
//          );
        },
      ),
      ListTile(
        leading: Icon(FontAwesomeIcons.tshirt),
        title: Text('Clothing'),
        onTap: (){
//          Navigator.pop(context);
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new FilterList(filter: "Clothing")),
//          );
        },
      ),
      ListTile(
        leading: Icon(FontAwesomeIcons.heart),
        title: Text('Favorited Items'),
        onTap: (){
//          Navigator.pop(context);
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new FilterList(filter: "Favorited")),
//          );
        },
      ),
      ListTile(
        leading: Icon(FontAwesomeIcons.shirtsinbulk),
        title: Text('My Items'),
        onTap: (){
//          Navigator.pop(context);
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new FilterList(filter: "My Items")),
//          );
        },
      ),
      ListTile(
        leading: Icon(Icons.add),
        title: Text('Add Item'),
        onTap: (){
//          Navigator.pop(context);
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new ItemForm( item: null )),
//          );
        },
      ),
    ];

//    if (globals.isLoggedIn) {
    tabs.add(
      ListTile(
        leading: Icon(FontAwesomeIcons.userCircle),
        title: Text('Login'),
        onTap: () {
//          Navigator.pop(context);
//          Navigator.push(
//            context,
//            new MaterialPageRoute(builder: (context) => new LoginPage()),
//          );
        },
      ),
    );
//    } else {
//      tabs.add(
//        ListTile(
//          leading: Icon(FontAwesomeIcons.userCircle),
//          title: Text('My Account'),
//          onTap: (){//fucntion we need
//          },
//        ),
//      );
//
//      tabs.add(
//        ListTile(
//          leading: Icon(FontAwesomeIcons.doorOpen),
//          title: Text('Logout'),
//          onTap: (){//fucntion we need
//            globals.isLoggedIn = false;
//          },
//        ),
//      );
//    }

    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: colors.grayBlue,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.search),
//            onPressed: () {
//              showSearch(
//                context: context,
//  //                      delegate: CustomSearchDelegate()
//              );
//            },
//          ),
//        ],
//      ),
      drawer: Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: menuTabs(context)
        ) ,
      ),

      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('items').snapshots(),
      builder: (context, snapshot) {
        globals.items = [];
        if (!snapshot.hasData) return LinearProgressIndicator();
          snapshot.data.documents.forEach((snap) {
            Item item = Item.fromSnapshot(snap);
            globals.items.add(item);
          });
        return HomePage();
      },
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      drawer: Drawer(
//        child: ListView(
//            padding: EdgeInsets.zero,
//            children: menuTabs(context)
//        ) ,
//      ),
//      body: HomePage(),
//    );
//  }
}

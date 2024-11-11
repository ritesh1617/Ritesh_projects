import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];

  // Function to display a dialog for edit/delete confirmation
  void _showActionDialog(String action, String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(action),
          content: Text("Are you sure you want to $action $item?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (action == "Delete") {
                  setState(() {
                    items.remove(item);
                  });
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$action $item completed")),
                );
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Context Menu Example"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Viewing ${items[index]}")),
              );
            },
            onLongPress: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Wrap(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.edit),
                        title: Text("Edit"),
                        onTap: () {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Editing ${items[index]}")),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.delete),
                        title: Text("Delete"),
                        onTap: () {
                          Navigator.of(context).pop();
                          _showActionDialog("Delete", items[index]);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.visibility),
                        title: Text("View"),
                        onTap: () {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Viewing ${items[index]}")),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

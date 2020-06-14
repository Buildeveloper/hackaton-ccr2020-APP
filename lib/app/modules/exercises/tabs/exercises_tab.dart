import 'package:flutter/material.dart';
import './item_card.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class ExercisesTab extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return ListView.builder(
            padding: EdgeInsets.all(15.0),
            itemBuilder: (BuildContext context, int index) =>
                EntryItem(data[index]),
            itemCount: data.length,
        );
    }
}

// One entry in the multilevel list displayed by this app.
class Entry {
    Entry(this.title, [this.children = const <Entry>[]]);
    
    final String title;
    final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
    Entry(
        'Para pequenos espaços',
        <Entry>[
            Entry('Série 1'),
            Entry('Série 2'),
        ],
    ),
    Entry(
        'Em até 30 min',
        <Entry>[
            Entry('Série 1'),
            Entry('Série 2'),
        ],
    ),
    Entry(
        'Alongamentos',
        <Entry>[
            Entry('Série 1'),
            Entry('Série 2'),
        ],
    ),
    Entry(
        'Respiração de relaxamento',
        <Entry>[
            Entry('Série 1'),
            Entry('Série 2'),
        ],
    ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
    const EntryItem(this.entry);
    
    final Entry entry;
    
    Widget _buildTiles(Entry root) {
        if (root.children.isEmpty) return ListTile(title: Text(root.title));
        return Container(
            width: double.infinity,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: ExpansionTile(
                        key: PageStorageKey<Entry>(root),
                        title: Text(root.title),
                        children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.all(15),
                                child: ItemCard(),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(15),
                                child: ItemCard(),
                            )
                        ],
                    ),
                ),
            ),
            
        );
    }
//    root.children.map(_buildTiles).toList()
    @override
    Widget build(BuildContext context) {
        return _buildTiles(entry);
    }
}
import 'package:memorize/shared/entity_listing_service.dart';
import 'package:flutter/material.dart';


abstract class ItemsListState<T, S extends EntityListingService>
    extends State {
  final S _service;
  final String title;
  final _itemForm;

  StatelessWidget toItem(T entity);

  ItemsListState(this._service, this.title, this._itemForm);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<T>>(
        initialData: List(),
        future: _service.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
              break;
            case ConnectionState.done:
              final List<T> _entitites = snapshot.data;
              return ListView.builder(
                  itemCount: _entitites.length,
                  itemBuilder: (context, index) {
                    final entity = _entitites[index];
                    return toItem(entity);
                  });
              break;
          }
          return null;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => _itemForm,
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}


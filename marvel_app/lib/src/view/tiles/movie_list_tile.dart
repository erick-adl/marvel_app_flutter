import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:marvel_app/src/models/characters.dart';
import 'package:marvel_app/src/view/widgets/rounded_model.dart';

class CharaterListViewTile extends StatelessWidget {
  CharaterListViewTile(this.result);

  final Result result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 0, 16),
      height: 180,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 70, spreadRadius: -80, offset: Offset(0, 40))
      ]),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(30)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: new CachedNetworkImageProvider(
                          "${result.thumbnail.path}.${result.thumbnail.extension}",
                          errorListener: () => Icon(Icons.error)))),
              width: 130,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Text('${result.name}',
                          style: Theme.of(context).textTheme.headline),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: result.description != ''
                            ? Text(
                                '${result.description}',
                                style: Theme.of(context).textTheme.body1,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              )
                            : Text('No description'),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      onTap: () {
                        _buildDetailsOfCharacter(context, result);
                      },
                      title: Text(
                        'More info',
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _buildDetailsOfCharacter(context, Result result) async {
    showRoundedModalBottomSheet(
        radius: 25,
        color: Colors.white,
        context: context,
        builder: (BuildContext bc) {
          return ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                    image: DecorationImage(
                        image: NetworkImage(
                            '${result.thumbnail.path}.${result.thumbnail.extension}'),
                        fit: BoxFit.cover)),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  result.name,
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: result.description != ""
                    ? Text(
                        result.description,
                        style: Theme.of(context).textTheme.body1,
                      )
                    : Text('No description'),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: result.comics.items.length > 0
                    ? ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                      onTap: () {
                        _buildListOfComics(context, result);
                      },
                      title: Text(
                        'Click here to show comics list',
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      trailing: Icon(Icons.navigate_next),
                    )
                    : Text('No comics avaiable'),
              ),
            ],
          );
        });
  }

  Future<void> _buildListOfComics(context, Result result) async {
    showRoundedModalBottomSheet(
        builder: (BuildContext context) {
          return ListView.builder(
              physics: ScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(6, 6, 0, 5),
              itemCount: result.comics.items.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        result.comics.items[index].name,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ));
              });
        },
        context: context);
  }
}

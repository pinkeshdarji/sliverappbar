import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarStatus extends StatefulWidget {
  const SliverAppBarStatus() : super();

  @override
  _SliverAppBarStatusState createState() => _SliverAppBarStatusState();
}

class _SliverAppBarStatusState extends State<SliverAppBarStatus> {
  late ScrollController _scrollController;
  Color _textColor = Colors.white;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.blue;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Goa',
                //textScaleFactor: 1,
                style: TextStyle(
                    color: _textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              background: Image.asset(
                'assets/images/beach.png',
                fit: BoxFit.fill,
              ),
              stretchModes: [StretchMode.zoomBackground],
            ),
            //collapsedHeight: 100,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: EdgeInsets.all(8),
                      width: 100,
                      child: Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

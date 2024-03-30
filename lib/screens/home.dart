import 'package:event_home/screens/custom_classes/circular_progres.dart';
import 'package:flutter/material.dart';
import 'body_grid.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final List<Map<String, dynamic>> listOfItems = [
    {
      'image': 'assets/office.jpg',
      'title': 'Coding Fest 1',
      'subtitle': 'Coding Event'
    },
    {
      'image': 'assets/office.jpg',
      'title': 'Coding Fest 2',
      'subtitle': 'Coding Event'
    },
    {
      'image': 'assets/office.jpg',
      'title': 'Coding Fest 3',
      'subtitle': 'Coding Event'
    },
    {
      'image': 'assets/office.jpg',
      'title': 'Coding Fest 4',
      'subtitle': 'Coding Event'
    },
    {
      'image': 'assets/office.jpg',
      'title': 'Coding Fest 5',
      'subtitle': 'Coding Event'
    },
    {
      'image': 'assets/office.jpg',
      'title': 'Coding Fest 6',
      'subtitle': 'Coding Event'
    },
  ];

  late AnimationController _controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.indigoAccent,
            fontWeight: FontWeight.w700,
          ),
        ),
        titleSpacing: 0,
        centerTitle: true,
        toolbarHeight: 100,
        leading: const Icon(Icons.arrow_back, color: Colors.indigoAccent),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 80,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });
                  Future.delayed(Duration(seconds: 10), () {
                    setState(() {
                      _isLoading = false;
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Create',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgress(
                controller: _controller,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth > 600) {
                    return MyGridView(
                      items: listOfItems,
                      crossAxisCount: 4,
                    );
                  } else {
                    return MyGridView(
                      items: listOfItems,
                      crossAxisCount: 2,
                    );
                  }
                },
              ),
            ),
    );
  }
}

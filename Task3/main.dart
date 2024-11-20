// ignore_for_file: unused_import, must_be_immutable

import 'package:firebase_test/Pages/BreakFast.dart';
import 'package:firebase_test/Pages/Dessert.dart';
import 'package:firebase_test/Pages/Dinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          title: Text(
            "Liceria & Co.",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .apply(color: Colors.white),
          ),
          backgroundColor: Colors.pink[300],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  "https://www.specialitybreads.co.uk/wp-content/uploads/2013/12/iStock_000010433657Medium-1024x682.jpg",
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              PageContainer("Dessert"),
              SizedBox(
                height: 15,
              ),
              PageContainer("Dinner"),
              SizedBox(
                height: 15,
              ),
              PageContainer("Breakfast"),
            ],
          ),
        ),
      ),
      routes: {
        "desserts/": (context) => Dessert_Page(),
        "dinner/": (context) => Dinner_Page(),
        "breakfast/": (context) => Breakfast_Page(),
      },
    );
  }
}

class PageContainer extends StatefulWidget {
  String title;
  PageContainer(this.title, {super.key});

  @override
  State<PageContainer> createState() => PageContainerState();
}

class PageContainerState extends State<PageContainer> {
  String? getroute(String title) {
    switch (widget.title) {
      case "Dessert":
        return "desserts/";
        break;
      case "Dinner":
        return "dinner/";
        break;
      case "Breakfast":
        return "breakfast/";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, getroute(widget.title)!);
      },
      child: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.pink[300]),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/image.jpg"),
              radius: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              widget.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .apply(fontWeightDelta: 10),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Dinner_Page extends StatefulWidget {
  const Dinner_Page({super.key});

  @override
  State<Dinner_Page> createState() => _Dinner_PageState();
}

class _Dinner_PageState extends State<Dinner_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Text(
          "Dinner",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .apply(color: Colors.white),
        ),
        backgroundColor: Colors.pink[300],
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 6.0, crossAxisSpacing: 6.0),
            itemCount: 12,
            itemBuilder: (BuildContext context, i) {
              return CustomCard("Dinner ${i}", (i + 1) % 3 == 0);
            }),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  String name;

  bool liked;
  CustomCard(this.name, this.liked, {super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.pink[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(widget.name),
          Image.network(
            // width: ,
            "https://www.specialitybreads.co.uk/wp-content/uploads/2013/12/iStock_000010433657Medium-1024x682.jpg",
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.liked = !widget.liked;
              });
            },
            child: Icon(widget.liked ? Icons.favorite : Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}

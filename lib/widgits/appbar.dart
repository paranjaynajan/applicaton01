import 'package:flutter/material.dart';

class MovieAppBar extends StatelessWidget with PreferredSizeWidget {
  String zero(item) {
    if (item == 1)
      return "Streaming....";
    else
      return "Downloading.....";
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.yellowAccent),
      title: const Center(
        child: Text(
          "MOVIES",
          style: TextStyle(color: Colors.yellowAccent),
        ),
      ),
      backgroundColor: Colors.black,
      actions: [
        PopupMenuButton(
          icon: const Icon(
            Icons.more_vert,
            color: Colors.yellowAccent,
          ),
          itemBuilder: (context) => const [
            PopupMenuItem(
                value: 1,
                child: Text(
                  "Stream",
                  style: TextStyle(
                    color: Colors.yellowAccent,
                  ),
                )),
            PopupMenuItem(
              value: 2,
              child: Text("Download",
                  style: TextStyle(
                    color: Colors.yellowAccent,
                  )),
            )
          ],
          onSelected: (item) =>
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.black,
            content: Text(
              zero(item),
              style: TextStyle(color: Colors.yellowAccent),
            ),
          )),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trains_rapidapi/Provider.dart';

class Train_Screen extends StatefulWidget {
  const Train_Screen({Key? key}) : super(key: key);

  @override
  State<Train_Screen> createState() => _Train_ScreenState();
}

class _Train_ScreenState extends State<Train_Screen> {
  Train_Provider? T_train;
  Train_Provider? F_train;

  @override
  Widget build(BuildContext context) {
    T_train = context.watch<Train_Provider>();
    F_train = context.read<Train_Provider>();
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.teal.shade800,
              title: Text(
                "Rapid Train Search ",
                style: GoogleFonts.lato(),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            preferredSize: Size(0, 50)),
        body: FutureBuilder(
          future: F_train!.get_Train(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List? list = snapshot.data;

              return ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.red.shade900,
                    thickness: 2,
                  );
                },
                itemCount: list!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey,
                    child: ListTile(
                      title: Text(
                        "${list[index].name}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            wordSpacing: 0.5,
                            fontWeight: FontWeight.normal),
                      ),
                      subtitle: Text(
                        "${list[index].data.days.sun}",
                        style: TextStyle(
                            color: Colors.red.shade900,
                            fontSize: 15,
                            wordSpacing: 0.5,
                            fontWeight: FontWeight.normal),
                      ),
                      leading: Text(
                        "${list[index].trainNum}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            wordSpacing: 0.5,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        "${list[index].data.classes[2]}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            wordSpacing: 0.5,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

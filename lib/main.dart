import 'package:cat_tasks/api/cartoon_model.dart';
import 'package:cat_tasks/api/service_model.dart';
import 'package:cat_tasks/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // @override
  // void initState() {
  //   getAllCartoons();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<CartoonModel>(
            future: getAllCartoons(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasData){
                return ListView.separated(
                    itemCount: snapshot.data.results.length,
                    itemBuilder: (context, index) {
                      var result = snapshot.data.results[index];
                      var infoResult = snapshot.data.info;
                      return Container(
                        color: Colors.green.shade300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network("${result.image}"),
                            Text("${result.name}"),
                            Text("${result.gender}"),
                            Text("${infoResult.count}"),
                            Text("${infoResult.pages}"),
                            Text("${result.status}"),
                            Text("${result.species}"),
                            Text("${result.created}"),
                          ],
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10.0,);
                },);
              }else{
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

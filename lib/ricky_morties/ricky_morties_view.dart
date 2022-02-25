import 'package:flutter/material.dart';

import 'ricky_morties_view_model.dart';

class RickyMortiesView extends RickyMortiesViewModel {
  final String nullImage =
      "https://rickandmortyapi.com/api/character/avatar/1.jpeg";

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchAllData();
          changeLoading();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Ricky And Morty"),
        centerTitle: true,
      ),
      body: isLoading
          ? ListView.builder(
              itemCount: models.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: const Color.fromARGB(255, 206, 236, 245),
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(models[index].image ?? nullImage),
                      ),
                      title: Text(models[index].name ?? ""),
                      subtitle: Text(
                          "Status: ${models[index].status ?? "Null value"}"),
                    ),
                  ),
                );
              },
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

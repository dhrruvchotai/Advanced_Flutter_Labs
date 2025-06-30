import 'package:advance_flutter_lab/Lab-7/controllers/list_view_example_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactiveListExampleView extends StatelessWidget {
  ReactiveListExampleView({super.key});

  ListViewExampleController _listViewExampleController = Get.put(
    ListViewExampleController(),
  );
  TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: TextFormField(
              controller: _valueController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              if (!_listViewExampleController.isEditActive.value) {
                _listViewExampleController.addElementInList(
                  _valueController.text,
                );
                _valueController.clear();
              } else {
                _listViewExampleController.editItemInList(
                  _valueController.text,
                );
                _listViewExampleController.update();
                _valueController.clear();
                _listViewExampleController.isEditActive.value = false;
              }
            },
            child: Obx(
              () => Text(
                _listViewExampleController.isEditActive.value ? "Edit" : "Add",
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _listViewExampleController.lst.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "${_listViewExampleController.lst[index]["name"]}",
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _listViewExampleController.deleteItemsFromList(
                              index,
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            _listViewExampleController.editIndex = index;
                            _valueController.text =
                                _listViewExampleController.lst[index]["name"];
                            _listViewExampleController.isEditActive.value =
                                true;
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            _listViewExampleController.editIndex = index;
                            _listViewExampleController.updateFavStatus(
                              !_listViewExampleController.lst[index]["isFav"],
                            );
                          },
                          icon: Icon(
                            _listViewExampleController.lst[index]["isFav"]
                                ? Icons.favorite
                                : Icons.favorite_outline_rounded,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

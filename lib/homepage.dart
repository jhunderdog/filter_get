import 'package:filter_get/list_controller.dart';
import 'package:filter_get/main.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  var controller = Get.put(ListController());
  void openFilterDialog(context) async {
    await FilterListDialog.display<String>(context,
        listData: defaultList,
        selectedListData: controller.selectedList(),
        headlineText: 'Your Skills',
        closeIconColor: Colors.redAccent,
        backgroundColor: Colors.orange,
        applyButtonTextStyle: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
        searchFieldHintText: 'Search Here',
        choiceChipLabel: (item) => item,
        validateSelectedItem: (list, val) => list!.contains(val),
        onItemSearch: (list, text) {
          if (list!.any((element) =>
              element.toLowerCase().contains(text.toLowerCase()))) {
            return list
                .where((element) =>
                    element.toLowerCase().contains(text.toLowerCase()))
                .toList();
          } else {
            return [];
          }
        },
        onApplyButtonClick: (list) {
          controller.selectedList.value = (List<String>.from(list!));
          Navigator.of(context).pop();
        });
  }

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          title: const Text('Filter List Application GetX'),
        ),
        body: Center(
          child: Obx(
            () => controller.selectedList().isEmpty
                ? const Text(
                    "Nothing Selected Yet",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                : Wrap(
                    children: controller
                        .selectedList()
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Chip(label: Text(e)),
                          ),
                        )
                        .toList(),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => openFilterDialog(context),
        ),
      ),
    );
  }
}

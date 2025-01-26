import 'package:flutter/material.dart';
import 'package:searchsimple/modules/search/controller/search_controller.dart';


PreferredSizeWidget? searchAppBar(BuildContext context) {
  final MySearchController searchController =
      MySearchController(context: context);
  return PreferredSize(
    preferredSize: const Size(double.infinity, 65),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
            color: Colors.grey.withOpacity(0.4),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 70,
            child: TextField(
              keyboardType: TextInputType.multiline,
              onChanged: (value) => searchController.onChange(value),
              onTapOutside: (event) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.7),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

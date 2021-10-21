import 'package:flutter/material.dart';
import 'package:sign_in_file/cubit/document/document_cubit.dart';
import 'package:provider/provider.dart';

import '../../../app_localizations.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

// Our Category List need StateFullWidget
// I can use Provider on it, Then we dont need StatefulWidget

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["all", "waiting", "last"];
  // By default first one is selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize * 2),
      child: SizedBox(
        height: SizeConfig.defaultSize * 3.5, // 35
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategoriItem(index),
        ),
      ),
    );
  }

  Widget buildCategoriItem(int index) {
    final String Function(String key) t =
        AppLocalizations.of(context).translate;
    return GestureDetector(
      onTap: () {
        final DocumentCubit documentCubit = context.read<DocumentCubit>();
        print(index);
        switch (index) {
          case 0:
            documentCubit.fetchDocuments();
            break;
          case 1:
            documentCubit.fetchWaitingDocuments();
            break;
          case 2:
            documentCubit.fetchLastDocuments();
            break;
          default:
            documentCubit.fetchDocuments();
            break;
        }
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: SizeConfig.defaultSize * 2),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.defaultSize * 2, //20
          vertical: SizeConfig.defaultSize * 0.5, //5
        ),
        decoration: BoxDecoration(
            color:
                selectedIndex == index ? Color(0xFFe3e6fc) : Colors.transparent,
            borderRadius: BorderRadius.circular(
              SizeConfig.defaultSize * 1.6, // 16
            )),
        child: Text(
          t(categories[index]),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? kPrimaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}

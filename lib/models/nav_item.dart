import 'package:flutter/material.dart';
import 'package:sign_in_file/screens/clients/clients_list.dart';
import 'package:sign_in_file/screens/document/document_list_screen.dart';
import 'package:sign_in_file/screens/home/home_screen.dart';
import 'package:sign_in_file/screens/invoices/invoices_list_screen.dart';
import 'package:sign_in_file/screens/login_success/login_success_screen.dart';

class NavItem {
  final int id;
  final IconData icon;
  final String destination;

  NavItem({this.id, this.icon, this.destination});

// If there is no destination then it help us
  bool destinationChecker() {
    if (destination != null) {
      return true;
    }
    return false;
  }
}

// If we made any changes here Provider package rebuid those widget those use this NavItems
class NavItems extends ChangeNotifier {
  // By default first one is selected
  int selectedIndex = 0;

  void chnageNavIndex({int index}) {
    selectedIndex = index;
    // if any changes made it notify widgets that use the value
    notifyListeners();
  }

  List<NavItem> items = [
    NavItem(
      id: 1,
      icon: Icons.home,
      destination: HomeScreen.routeName,
    ),
    NavItem(
      id: 2,
      icon: Icons.search,
      destination: LoginSuccessScreen.routeName,
    ),
    NavItem(
      id: 3,
      icon: Icons.description,
      destination: DocumentListScreen.routeName,
    ),
    NavItem(
      id: 4,
      icon: Icons.receipt_long,
      destination: InvoiceListScreen.routeName,
    ),
    NavItem(
      id: 5,
      icon: Icons.group,
      destination: ClientsListScreen.routeName,
    ),
  ];
}

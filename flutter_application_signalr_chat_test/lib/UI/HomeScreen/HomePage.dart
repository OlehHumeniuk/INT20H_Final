import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:schedule_t/UI/HomeScreen/DeviceTypeCard.dart';
import 'package:schedule_t/DataLayer/DevicesProvider.dart';
import 'package:schedule_t/Entities/DeviceTypes.dart';

import 'package:schedule_t/UI/DeviceTypePage/DeviceTypePage.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreen createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePageScreen> {

  final TextEditingController searchController = TextEditingController();
  List<DeviceTypes> deviceTypesList = []; // List to keep all products
  List<DeviceTypes> filteredDeviceTypes = []; // List to keep filtered products

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchTextChanged);
    searchController.dispose();
    super.dispose();
  }
  void _onSearchTextChanged() {
    String searchText = searchController.text.toLowerCase();

    List<DeviceTypes> typeFilteredDevices = deviceTypesList.toList();

    setState(() {
      // Then, filter by search text, if there is any
      filteredDeviceTypes = searchText.isEmpty
          ? typeFilteredDevices
          : typeFilteredDevices.where((device) {
              return device.deviceTypeName.toLowerCase().contains(searchText);
            }).toList();
    });
  }

  
  Widget getSearchLine({
    required String hintText,
    required Color fontColor, // Default to the darkest amber color if not specified
    required Color hintColor, // Default to a light grey color if not specified
    String searchIconPath = 'lib/UI/Icons/LineEditIcons/Search.png',
    String filterIconPath = 'lib/UI/Icons/LineEditIcons/LockIcon.png',
    double iconWidth = 24.0,
    double iconHeight = 24.0,
    Color borderColor = Colors.grey,
    Color focusedBorderColor = const Color.fromRGBO(255, 111, 0, 1),
    Color fillColor = Colors.white,
    double borderRadius = 10.0,
     EdgeInsets? edgeInsets,
  }) {
    edgeInsets ??= EdgeInsets.fromLTRB(12, 12, 0, 12); // Assign a default value if null
    
    return TextField(
      controller: searchController,//додаємо контролер для пошуку інформації в 
      style: TextStyle(
        fontSize: 16,
        color: fontColor ?? focusedBorderColor, // Fallback to amber[900] if the index is invalid
      ),
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: TextStyle(
          color: hintColor ?? borderColor, // Fallback to grey[200] if the index is invalid
        ),
        prefixIcon: Padding(
          padding: edgeInsets,
          child: Image.asset(
            searchIconPath,
            width: iconWidth,
            height: iconHeight,
          ),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            filterIconPath,
            width: iconWidth,
            height: iconHeight,
          ),
        ),
        filled: true,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    //Отримаємо інформацію про список продуктів який в нас є
    final devicesProvider = Provider.of<DevicesProvider>(context);
    deviceTypesList = devicesProvider.deviceTypes ?? [];
    final productListCl = devicesProvider.deviceTypes;

    // If there's no search or selected type, use the full list
    if (searchController.text.isEmpty) {
      filteredDeviceTypes = deviceTypesList;
    }

    // Calculate the padding and spacing
    double padding = 16.0; // Padding on all sides
    double cardSpacing = 8.0; // Spacing between cards

    // Calculate the number of cross-axis columns
    int crossAxisCount = 2;

    // Calculate the width of the cards based on the screen size, padding, and spacing
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardWidth = (screenWidth - padding * 2 - cardSpacing * (crossAxisCount - 1)) / crossAxisCount;
    double cardHeight = screenHeight/ 3.2; // Adjust the height as needed for aspect ratio

    return Scaffold(
      body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Зменшено вертикальний відступ
              child: getSearchLine(
                      hintText: 'Search coffee',
                      fontColor: Color.fromRGBO(255, 111, 0, 1), // Dark amber for the text
                      hintColor: Color.fromRGBO(158, 158, 158, 1), // Light grey for the hint
                    )),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(padding),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: cardSpacing,
                  mainAxisSpacing: cardSpacing,
                  childAspectRatio: cardWidth / cardHeight,
                ),
                  itemBuilder: (context, index) {
                    final deviceType = filteredDeviceTypes[index];
                    DeviceTypes item = DeviceTypes(
                      deviceTypeID: deviceType.deviceTypeID,
                      deviceTypeName: deviceType.deviceTypeName,
                      imagePath: deviceType.imagePath,
                    );
                  // Wrap ItemCard in GestureDetector
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DeviceTypePage(deviceTypeID: deviceType.deviceTypeID)),
                      );
                    },
                    child: DeviceTypeCard(deviceType: item),
                  );
                },
                itemCount: filteredDeviceTypes.length, // Don't forget to set the item count
              ),
            ),
          ],
      ),
    );
  }
}

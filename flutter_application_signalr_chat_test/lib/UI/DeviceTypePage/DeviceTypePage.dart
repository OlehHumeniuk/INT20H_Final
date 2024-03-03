import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:schedule_t/DataLayer/DevicesProvider.dart';

// import 'package:myapp/DataLayer/LoadDataF.dart'; 
// import 'package:myapp/Entities/ProductListInfo.dart';

// import 'package:myapp/BusinessLogicLayer/AddEditOrderInfo.dart';
// import 'ToppingsView.dart';

import 'package:schedule_t/Entities/Device.dart';

import 'package:schedule_t/UI/DevicePage/DevicePage.dart';

class DeviceTypePage extends StatefulWidget {
  final int deviceTypeID;

  const DeviceTypePage({Key? key, required this.deviceTypeID}) : super(key: key);

  @override
  State<DeviceTypePage> createState() => _DeviceTypePageState();
}

class _DeviceTypePageState extends State<DeviceTypePage> {
  late Device selectedDevice;

  List<Device> typeDevicesList = []; // List to keep all devices
  List<Device> filteredTypeDevicesList = []; // List to keep filtered devices

  final TextEditingController searchController = TextEditingController();
  String? selectedDeviceModel;
  String? selectedDeviceBrand;

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
    setState(() {
      filteredTypeDevicesList = typeDevicesList
          .where((device) =>
              (selectedDeviceBrand == null || device.brandName == selectedDeviceBrand) &&
              (searchController.text.isEmpty || device.deviceModel.toLowerCase().contains(searchController.text.toLowerCase())))
          .toList();
    });
  }

  void _onBrandSelected(String? brand) {
    setState(() {
      selectedDeviceBrand = brand;
      _onSearchTextChanged(); // Refilter the list based on the selected brand
    });
  }

  void _showErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Помилка вибору моделі'),
        content: Text('Пристрій з вибраною моделлю не знайдено.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Закрити діалогове вікно
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

  void _onModelSelected(String? pDeviceModel) {
    Device? ldevice = typeDevicesList.firstWhere(
      (device) => device.deviceModel == pDeviceModel,
    );

    if (ldevice != null) {
      setState(() {
        selectedDevice = ldevice;
        selectedDeviceModel = ldevice.deviceModel;
      });
    } else {
      // Виклик вікна нотифікації про помилку вибору моделі
      _showErrorDialog(context);
    }
  }


  void _onConfirm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DeviceDetailsWidget(device: selectedDevice)),
    );
  }

  Widget _buildDropdownButton(List<String> items, String? value, ValueChanged<String?> onChanged) {
    return DropdownButton<String>(
      value: value,
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildDeviceModelDropdown() {
    // This method should return a dropdown button for selecting a device model
    // It should list only the models from the filteredTypeDevicesList
    return _buildDropdownButton(
      filteredTypeDevicesList.map((device) => device.deviceModel).toList(),
      selectedDeviceModel,
      (newValue) => _onModelSelected(newValue),
    );
  }

  Widget _buildDeviceBrandDropdown() {
    // This method should return a dropdown button for selecting a device brand
    return _buildDropdownButton(
      typeDevicesList.map((device) => device.brandName).toSet().toList(), // Use toSet to remove duplicates
      selectedDeviceBrand,
      _onBrandSelected,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the devices list and brand names from the provider
    final devicesProvider = Provider.of<DevicesProvider>(context, listen: false);
    typeDevicesList = devicesProvider.device ?? [];
    List<String> brandNames = devicesProvider.brands;

    // Build UI
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Device'),
      ),
      body: Column(
        children: <Widget>[
          // Search bar for device models
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search Device Model',
            ),
          ),
          // Dropdown for selecting device brand
          _buildDeviceBrandDropdown(),
          // Dropdown for selecting device model
          _buildDeviceModelDropdown(),
          // Confirm button
          ElevatedButton(
            onPressed: _onConfirm,
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
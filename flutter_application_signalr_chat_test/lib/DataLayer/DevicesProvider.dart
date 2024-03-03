// import 'package:objectbox/objectbox.dart';
import 'package:flutter/material.dart';
import 'package:schedule_t/Entities/Device.dart';

import 'package:signalr_core/signalr_core.dart';
import 'dart:convert';

import 'package:schedule_t/Entities/DeviceTypes.dart';

import 'package:schedule_t/Entities/DeviceTypes/AutomotiveDevices.dart';
import 'package:schedule_t/Entities/DeviceTypes/ComputingDevices.dart';
import 'package:schedule_t/Entities/DeviceTypes/EducationalDevices.dart';
import 'package:schedule_t/Entities/DeviceTypes/EntertainmentSystems.dart';
import 'package:schedule_t/Entities/DeviceTypes/HealthcareDevices.dart';
import 'package:schedule_t/Entities/DeviceTypes/IndustrialControlSystems.dart';
import 'package:schedule_t/Entities/DeviceTypes/IoTDevices.dart';
import 'package:schedule_t/Entities/DeviceTypes/MobileDevices.dart';
import 'package:schedule_t/Entities/DeviceTypes/NetworkingEquipment.dart';
import 'package:schedule_t/Entities/DeviceTypes/OfficeEquipment.dart';
import 'package:schedule_t/Entities/DeviceTypes/SmartHomeDevices.dart';
import 'package:schedule_t/Entities/DeviceTypes/WearableTechnology.dart';


typedef ProcessJSONFunction = void Function(String);

class DevicesProvider with ChangeNotifier {

  List<DeviceTypes> _DeviceTypes = [];

  List<Device> _Devices = [];

  List<String> _Brands = ['Samsung', 'Apple', 'Sony', 'HP', 'Dell', 'Lenovo', 'Cisco','Netgear' ,'Ubiquiti'];

  List<AutomotiveDevice> _AutomotiveDevices = [];
  List<ComputingDevice> _ComputingDevices = [];
  List<EducationalDevice> _EducationalDevices = [];
  List<EntertainmentSystem> _EntertainmentSystems = [];
  List<HealthcareDevice> _HealthcareDevices = [];
  List<IndustrialControlSystem> _IndustrialControlSystems = [];
  List<IoTDevice> _IoTDevices = [];
  List<MobileDevice> _MobileDevices = [];
  List<NetworkingEquipment> _NetworkingEquipments = [];
  List<OfficeEquipment> _OfficeEquipments = [];
  List<SmartHomeDevice> _SmartHomeDevices = [];
  List<WearableTechnology> _WearableTechnologies = [];

  late HubConnection _hubConnection;

  List<DeviceTypes> get deviceTypes => _DeviceTypes;

  List<Device> get device => _Devices;

  List<String> get brands => _Brands;

  List<AutomotiveDevice> get automotiveDevice => _AutomotiveDevices;
  List<ComputingDevice> get computingDevice => _ComputingDevices;
  List<EducationalDevice> get educationalDevice => _EducationalDevices;
  List<EntertainmentSystem> get entertainmentSystem => _EntertainmentSystems;
  List<HealthcareDevice> get healthcareDevice => _HealthcareDevices;
  List<IndustrialControlSystem> get industrialControlSystem => _IndustrialControlSystems;
  List<IoTDevice> get ioTDevice => _IoTDevices;
  List<MobileDevice> get mobileDevice => _MobileDevices;
  List<NetworkingEquipment> get networkingEquipment => _NetworkingEquipments;
  List<OfficeEquipment> get officeEquipment => _OfficeEquipments;
  List<SmartHomeDevice> get smartHomeDevice => _SmartHomeDevices;
  List<WearableTechnology> get wearableTechnology => _WearableTechnologies;

  HubConnection get hubConnection => _hubConnection;
  
  void initState() {
    _hubConnection = HubConnectionBuilder().withUrl("https://192.168.32.254:443/programhub").build();
   
    _hubConnection.onclose( (error) => print("Connection Closed"));
    startConnection();
  }

  Future<void> GetAllSelectedDevices(String pAPIFunction, ProcessJSONFunction pProcessJSONFunction, {List<dynamic>? args}) async {
    if (_hubConnection.state == HubConnectionState.connected) {
      await _hubConnection.invoke(pAPIFunction, args: args);
    }
    else {
      print('Connection is not ready for method invocation');
      // Handle the error state appropriately, maybe by retrying connection
    }
  }

  Future<void> processJsonListResponseAutomotiveDevices(List<String> jsonResponseList) async {
    List<AutomotiveDevice> devices = jsonResponseList
      .map((jsonString) => AutomotiveDevice.fromJson(json.decode(jsonString)))
      .toList();
    _AutomotiveDevices = devices;
    notifyListeners();
  }

    // Метод для завантаження даних про типи девайсів
  Future<void> fetchAllDevices() async {
    GetAllSelectedDevices('GetAllDevices', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<Device> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return Device.fromJson(jsonMap);
      }).toList();
      _Devices = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про типи девайсів
  Future<void> fetchDeviceTypes() async {
    GetAllSelectedDevices('GetAllDeviceTypes', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<DeviceTypes> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return DeviceTypes.fromJson(jsonMap);
      }).toList();
      _DeviceTypes = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про автомобільні пристрої
  Future<void> fetchAutomotiveDevices() async {
    GetAllSelectedDevices('GetAllAutomotiveDevices', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<AutomotiveDevice> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return AutomotiveDevice.fromJson(jsonMap);
      }).toList();
      _AutomotiveDevices = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про обчислювальні пристрої
  Future<void> fetchComputingDevices() async {
    GetAllSelectedDevices('GetAllComputingDevices', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<ComputingDevice> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return ComputingDevice.fromJson(jsonMap);
      }).toList();
      _ComputingDevices = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про навчальні пристрої
  Future<void> fetchEducationalDevices() async {
    GetAllSelectedDevices('GetAllEducationalDevices', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<EducationalDevice> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return EducationalDevice.fromJson(jsonMap);
      }).toList();
      _EducationalDevices = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про розважальні системи
  Future<void> fetchEntertainmentSystems() async {
    GetAllSelectedDevices('GetAllEntertainmentSystems', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<EntertainmentSystem> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return EntertainmentSystem.fromJson(jsonMap);
      }).toList();
      _EntertainmentSystems = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про медичні пристрої
  Future<void> fetchHealthcareDevices() async {
    GetAllSelectedDevices('GetAllHealthcareDevices', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<HealthcareDevice> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return HealthcareDevice.fromJson(jsonMap);
      }).toList();
      _HealthcareDevices = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про промислові контрольні системи
  Future<void> fetchIndustrialControlSystems() async {
    GetAllSelectedDevices('GetAllIndustrialControlSystems', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<IndustrialControlSystem> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return IndustrialControlSystem.fromJson(jsonMap);
      }).toList();
      _IndustrialControlSystems = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про IoT пристрої
  Future<void> fetchIoTDevices() async {
    GetAllSelectedDevices('GetAllIoTDevices', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<IoTDevice> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return IoTDevice.fromJson(jsonMap);
      }).toList();
      _IoTDevices = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про мобільні пристрої
  Future<void> fetchMobileDevices() async {
    GetAllSelectedDevices('GetAllMobileDevices', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<MobileDevice> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return MobileDevice.fromJson(jsonMap);
      }).toList();
      _MobileDevices = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про мережеве обладнання
  Future<void> fetchNetworkingEquipment() async {
    GetAllSelectedDevices('GetAllNetworkingEquipment', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<NetworkingEquipment> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return NetworkingEquipment.fromJson(jsonMap);
      }).toList();
      _NetworkingEquipments = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про офісне обладнання
  Future<void> fetchOfficeEquipment() async {
    GetAllSelectedDevices('GetAllOfficeEquipment', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<OfficeEquipment> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return OfficeEquipment.fromJson(jsonMap);
      }).toList();
      _OfficeEquipments = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про розумний домашній пристрій
  Future<void> fetchSmartHomeDevices() async {
    GetAllSelectedDevices('GetAllSmartHomeDevices', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<SmartHomeDevice> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return SmartHomeDevice.fromJson(jsonMap);
      }).toList();
      _SmartHomeDevices = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  // Метод для завантаження даних про пристрій зносуваної технології
  Future<void> fetchWearableTechnologies() async {
    GetAllSelectedDevices('GetAllWearableTechnologies', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<WearableTechnology> devices = data.map((item) {
        Map<String, dynamic> jsonMap = json.decode(item);
        return WearableTechnology.fromJson(jsonMap);
      }).toList();
      _WearableTechnologies = devices;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }

  Future<void> fetchBrands() async {
    GetAllSelectedDevices('GetAllBrands', (String jsonString) {
      List<dynamic> data = json.decode(jsonString);
      List<String> brands = data.map((dynamic item) => item.toString()).toList(); // Перетворення кожного елемента в рядок
      _Brands = brands;
      notifyListeners(); // Повідомте прослуховувачів, що дані змінилися
    });
  }


  // Методи для завантаження даних з сервера
  Future<void> fetchDevices() async {
    fetchAllDevices();
    fetchDeviceTypes();
    // fetchBrands();
    
    // fetchAutomotiveDevices();
    fetchComputingDevices();
    // fetchEducationalDevices();
    // fetchEntertainmentSystems();
    // fetchHealthcareDevices();
    // fetchIndustrialControlSystems();
    // fetchIoTDevices();
    fetchMobileDevices();
    fetchNetworkingEquipment();
    // fetchOfficeEquipment();
    // fetchSmartHomeDevices();
    // fetchWearableTechnologies();
  }

  Future<void> _addHubHandler(String pHandlerName) async {
    _hubConnection.on(pHandlerName, (List<dynamic>? parameters) {
      if (parameters != null && parameters.isNotEmpty) {
        final jsonInfo = parameters.first;
        // Оскільки ви отримали JSON-рядок, спершу його потрібно десеріалізувати
        List<dynamic> jsonList = json.decode(jsonInfo);

        switch (pHandlerName) {
          case 'ReceiveAllBrands':
              _Brands = jsonList.map((json) => json.toString()).toList();
          case 'ReceiveAllDevices':
              _Devices = jsonList.map((json) => Device.fromJson(json)).toList();
          case 'ReceiveAllDeviceTypes':
            _DeviceTypes = jsonList.map((json) => DeviceTypes.fromJson(json)).toList();
            break;
          case 'ReceiveAutomotiveDeviceInfo':
          case 'ReceiveAllAutomotiveDevices':
            _AutomotiveDevices = jsonList.map((json) => AutomotiveDevice.fromJson(json)).toList();
            break;
          case 'ReceiveComputingDeviceInfo':
          case 'ReceiveAllComputingDevices':
            _ComputingDevices = jsonList.map((json) => ComputingDevice.fromJson(json)).toList();
            break;
          case 'ReceiveEducationalDeviceInfo':
          case 'ReceiveAllEducationalDevices':
            _EducationalDevices = jsonList.map((json) => EducationalDevice.fromJson(json)).toList();
            break;
          case 'ReceiveEntertainmentSystemInfo':
          case 'ReceiveAllEntertainmentSystems':
            _EntertainmentSystems = jsonList.map((json) => EntertainmentSystem.fromJson(json)).toList();
            break;
          case 'ReceiveHealthcareDeviceInfo':
          case 'ReceiveAllHealthcareDevices':
            _HealthcareDevices = jsonList.map((json) => HealthcareDevice.fromJson(json)).toList();
            break;
          case 'ReceiveIndustrialControlSystemInfo':
          case 'ReceiveAllIndustrialControlSystems':
            _IndustrialControlSystems = jsonList.map((json) => IndustrialControlSystem.fromJson(json)).toList();
            break;
          case 'ReceiveIoTDeviceInfo':
          case 'ReceiveAllIoTDevices':
            _IoTDevices = jsonList.map((json) => IoTDevice.fromJson(json)).toList();
            break;
          case 'ReceiveMobileDeviceInfo':
          case 'ReceiveAllMobileDevices':
            _MobileDevices = jsonList.map((json) => MobileDevice.fromJson(json)).toList();
            break;
          case 'ReceiveNetworkingEquipmentInfo':
          case 'ReceiveAllNetworkingEquipment':
            _NetworkingEquipments = jsonList.map((json) => NetworkingEquipment.fromJson(json)).toList();
            break;
          case 'ReceiveOfficeEquipmentInfo':
          case 'ReceiveAllOfficeEquipment':
            _OfficeEquipments = jsonList.map((json) => OfficeEquipment.fromJson(json)).toList();
            break;
          case 'ReceiveSmartHomeDeviceInfo':
          case 'ReceiveAllSmartHomeDevices':
            _SmartHomeDevices = jsonList.map((json) => SmartHomeDevice.fromJson(json)).toList();
            break;
          case 'ReceiveWearableTechnologyInfo':
          case 'ReceiveAllWearableTechnologies':
            _WearableTechnologies = jsonList.map((json) => WearableTechnology.fromJson(json)).toList();
            break;
          // Можливо будуть інші case блоки для інших типів подій
        }
        notifyListeners(); // Повідомляємо слухачів, що дані оновилися
        print('Received $pHandlerName: $jsonInfo');
      }
    });
  }

  Future<void> installTheHandler() async {
    final List<String> events = [
      'ReceiveAllBrands',
      'ReceiveAllDevices',
      'ReceiveAllDeviceTypes',
      'ReceiveAutomotiveDeviceInfo',
      'ReceiveAllAutomotiveDevices',
      'ReceiveComputingDeviceInfo',
      'ReceiveAllComputingDevices',
      'ReceiveEducationalDeviceInfo',
      'ReceiveAllEducationalDevices',
      'ReceiveEntertainmentSystemInfo',
      'ReceiveAllEntertainmentSystems',
      'ReceiveHealthcareDeviceInfo',
      'ReceiveAllHealthcareDevices',
      'ReceiveIndustrialControlSystemInfo',
      'ReceiveAllIndustrialControlSystems',
      'ReceiveIoTDeviceInfo',
      'ReceiveAllIoTDevices',
      'ReceiveMobileDeviceInfo',
      'ReceiveAllMobileDevices',
      'ReceiveNetworkingEquipmentInfo',
      'ReceiveAllNetworkingEquipment',
      'ReceiveOfficeEquipmentInfo',
      'ReceiveAllOfficeEquipment',
      'ReceiveSmartHomeDeviceInfo',
      'ReceiveAllSmartHomeDevices',
      'ReceiveWearableTechnologyInfo',
      'ReceiveAllWearableTechnologies',
    ];

    events.forEach((event) {
      _addHubHandler(event);
    });
  }

  Future<void> startConnection() async {
  try {
    if (_hubConnection.state == HubConnectionState.disconnected) {
      await _hubConnection.start();
      print('Hub Connection Started');
      await installTheHandler();
      await fetchDevices();
    } else if (_hubConnection.state == HubConnectionState.connected) {
      print('Hub Connection is already in a connected state');
      // If already connected, there's no need to start the connection again
      // You can directly invoke your methods here
    } else {
      print('Waiting for Hub Connection to be ready...');
      // You may want to implement a retry logic here or inform the user to try again later
    }
  } catch (e) {
    print('Error starting connection: $e');
    // Implement a retry logic or notify the user about the connection issue
  }
}

}
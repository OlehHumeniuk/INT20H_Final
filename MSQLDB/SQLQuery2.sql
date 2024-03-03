INSERT INTO Languages(LanguageName,LanguageisoCode,LanguageIconPath)
VALUES('Ukrainian','ua','assets/Ukrainian.png'),('English','en','assets/English.png'),('Spanish','es','assets/Spanish.png')

--Brrands
INSERT INTO Brands (BrandName) VALUES ('Samsung');
INSERT INTO Brands (BrandName) VALUES ('Apple');
INSERT INTO Brands (BrandName) VALUES ('Sony');
INSERT INTO Brands (BrandName) VALUES ('HP');
INSERT INTO Brands (BrandName) VALUES ('Dell');
INSERT INTO Brands (BrandName) VALUES ('Lenovo');
INSERT INTO Brands (BrandName) VALUES ('Cisco');
INSERT INTO Brands (BrandName) VALUES ('Netgear');
INSERT INTO Brands (BrandName) VALUES ('Ubiquiti');
--TransmissionProtocols
INSERT INTO TransmissionProtocols (ProtocolName) VALUES ('HTTP');
INSERT INTO TransmissionProtocols (ProtocolName) VALUES ('FTP');
INSERT INTO TransmissionProtocols (ProtocolName) VALUES ('SMTP');
INSERT INTO TransmissionProtocols (ProtocolName) VALUES ('SSH');
INSERT INTO TransmissionProtocols (ProtocolName) VALUES ('TLS');
INSERT INTO TransmissionProtocols (ProtocolName) VALUES ('UDP');


--EncryptionTypes

INSERT INTO EncryptionTypes (EncryptionName) VALUES ('AES');
INSERT INTO EncryptionTypes (EncryptionName) VALUES ('RSA');
INSERT INTO EncryptionTypes (EncryptionName) VALUES ('Blowfish');
INSERT INTO EncryptionTypes (EncryptionName) VALUES ('3DES');
INSERT INTO EncryptionTypes (EncryptionName) VALUES ('Twofish');
INSERT INTO EncryptionTypes (EncryptionName) VALUES ('Serpent');


--SignalTypes
INSERT INTO SignalTypes (SignalTypeName) VALUES ('2.4GHz');
INSERT INTO SignalTypes (SignalTypeName) VALUES ('5GHz');
INSERT INTO SignalTypes (SignalTypeName) VALUES ('Bluetooth');
INSERT INTO SignalTypes (SignalTypeName) VALUES ('Analog');
INSERT INTO SignalTypes (SignalTypeName) VALUES ('Digital');
INSERT INTO SignalTypes (SignalTypeName) VALUES ('Wireless');


--OperatingSystemsTypes
INSERT INTO OperatingSystemsTypes (OSName) VALUES ('Windows');
INSERT INTO OperatingSystemsTypes (OSName) VALUES ('macOS');
INSERT INTO OperatingSystemsTypes (OSName) VALUES ('Linux');
INSERT INTO OperatingSystemsTypes (OSName) VALUES ('iOS');
INSERT INTO OperatingSystemsTypes (OSName) VALUES ('Android');
INSERT INTO OperatingSystemsTypes (OSName) VALUES ('Cisco IOS');

INSERT INTO DeviceTypes (DeviceTypeName, ImagePath) 
VALUES 
('Automotive Devices', 'assets/categories/DevicesTypes/AutomotiveDevice.jpg'),
('Computing Devices', 'assets/categories/DevicesTypes/ComputingDevices.jpeg'),
('Educational Devices', 'assets/categories/DevicesTypes/EducationalDevice.jpg'),
('Entertainment Systems', 'assets/categories/DevicesTypes/EntertainmentSystem.jpeg'),
('Healthcare Devices', 'assets/categories/DevicesTypes/HealthcareDevices.jpg'),
('Industrial Control Systems', 'assets/categories/DevicesTypes/IndustrialControlSystem.jpeg'),
('IoT Devices', 'assets/categories/DevicesTypes/IoTDevice.png'),
('Mobile Devices', 'assets/categories/DevicesTypes/MobileDevices.jpg'),
('Network Equipment', 'assets/categories/DevicesTypes/NetworkEquipment.jpg'),
('Office Equipments', 'assets/categories/DevicesTypes/OfficeEquipments.jpg'),
('Smart Home Devices', 'assets/categories/DevicesTypes/SmartHomeDevices.jpg'),
('Wearable Technologies', 'assets/categories/DevicesTypes/WearableTechnology.jpg');



--OperatingSystems

-- Для Windows
INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (1, 'Windows 10', 1, 'Various security patches released regularly by Microsoft.');

INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (1, 'Windows 11', 1, 'Newest version with enhanced security features.');

INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (1, 'Windows Server 2019', 1, 'Regular security updates provided by Microsoft for server environments.');

-- Для macOS
INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (2, 'macOS Big Sur', 1, 'Generally considered secure, but occasional vulnerabilities are discovered.');

INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (2, 'macOS Monterey', 1, 'Latest macOS version with security improvements and bug fixes.');

INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (2, 'macOS High Sierra', 0, 'Older version with known vulnerabilities, users advised to update.');

-- Для Linux
INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (3, 'Ubuntu 20.04 LTS', 1, 'Frequent security updates provided by Canonical.');

INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (3, 'CentOS 8', 1, 'Regular security patches provided by CentOS.');

INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (3, 'Fedora 35', 1, 'Community-supported distribution with frequent updates and security fixes.');

-- Для iOS
INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (4, 'iOS 15', 1, 'Typically regarded as secure, but occasional security flaws are addressed by Apple.');

INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (4, 'iOS 14', 1, 'Stable release with security updates and bug fixes.');

INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (4, 'iOS 13', 0, 'Older version with known vulnerabilities, users recommended to upgrade.');

-- Для Android

INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (5, 'Android 12', 0, 'Known for security concerns due to fragmentation and delayed updates.');

INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (5, 'Android 11', 1, 'Recent version with security enhancements and privacy improvements.');

INSERT INTO OperatingSystems (OSTypeID, OSVersion, OSIsSecure, KnownVulnerabilities)
VALUES (5, 'Android 10', 0, 'Previous version with reported security vulnerabilities, users urged to update.');


-- Insert for Computing Device (Samsung Galaxy Book Pro)
INSERT INTO Devices (DeviceTypeID, BrandID, SecurityProtocol, EncryptionTypeID, DeviceImagePath, DeviceModel, Video, WiFi, DeviceIsSecure, DeviceInfoLink, Comments)
SELECT 
    (SELECT DeviceTypeID FROM DeviceTypes WHERE DeviceTypeName = 'Computing Devices'), 
    (SELECT BrandID FROM Brands WHERE BrandName = 'Samsung'), 
    (SELECT ProtocolID FROM TransmissionProtocols WHERE ProtocolName = 'TLS'), 
    (SELECT EncryptionTypeID FROM EncryptionTypes WHERE EncryptionName = 'AES'),
    'assets/devices/ComputingDevices/SamsungGalaxyBookPro.jpg', 
    'Samsung Galaxy Book Pro', 
    1, 1, 'True', 
    'https://www.samsung.com/laptops/galaxy-book-pro/', 
    'High-performance laptop for professional use.'
WHERE NOT EXISTS (SELECT * FROM Devices WHERE DeviceModel = 'Samsung Galaxy Book Pro');

INSERT INTO DeviceSignalTypes (DeviceID, SignalTypeID)
SELECT IDENT_CURRENT('Devices'), SignalTypeID FROM SignalTypes WHERE SignalTypeName IN ('2.4GHz', '5GHz', 'Bluetooth');

INSERT INTO ComputingDevices (DeviceID, OSID, RAMSize, StorageSize, HasAntivirus)
SELECT IDENT_CURRENT('Devices'), 
       (SELECT OSID FROM OperatingSystems WHERE OSVersion = 'Windows 10'), 
       16, -- RAM size in GB
       512, -- Storage size in GB
       1 -- Has Antivirus
WHERE NOT EXISTS (SELECT * FROM ComputingDevices WHERE DeviceID = IDENT_CURRENT('Devices'));

-- Вставка 2 для пристрою (Apple Desktop)
INSERT INTO Devices (DeviceTypeID, BrandID, SecurityProtocol, EncryptionTypeID, DeviceImagePath, DeviceModel, Video, WiFi, DeviceIsSecure, DeviceInfoLink, Comments)
SELECT 
    (SELECT DeviceTypeID FROM DeviceTypes WHERE DeviceTypeName = 'Computing Devices'), -- ID типу пристрою для обчислювальних пристроїв
    (SELECT BrandID FROM Brands WHERE BrandName = 'Apple'), -- ID бренду для Apple
    (SELECT ProtocolID FROM TransmissionProtocols WHERE ProtocolName = 'TLS'), -- ID протоколу для TLS
    (SELECT EncryptionTypeID FROM EncryptionTypes WHERE EncryptionName = 'RSA'), -- ID типу шифрування для RSA
    'assets/devices/ComputingDevices/IMAC.jpeg', -- Шлях до зображення
    'Apple iMac', -- Модель пристрою
    1, -- Підтримка відео
    1, -- Підтримка WiFi
    'False', -- Процедура безпеки
    'https://www.apple.com/imac/', -- Посилання на інформацію про пристрій
    'Elegant desktop computer with impressive display.'
WHERE NOT EXISTS (SELECT * FROM Devices WHERE DeviceModel = 'Apple iMac');

INSERT INTO DeviceSignalTypes (DeviceID, SignalTypeID)
VALUES (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = '2.4GHz')),
	   (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = '5GHz')),
       (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = 'Bluetooth'));

INSERT INTO ComputingDevices (DeviceID, OSID, RAMSize, StorageSize, HasAntivirus)
SELECT IDENT_CURRENT('Devices'), 
       (SELECT OSID FROM OperatingSystems WHERE OSVersion = 'macOS High Sierra'), 
       8, -- RAM size in GB
       256, -- Storage size in GB
       1 -- Has Antivirus
WHERE NOT EXISTS (SELECT * FROM ComputingDevices WHERE DeviceID = IDENT_CURRENT('Devices'));

-- Вставка 3 для пристрою (Dell Tablet)
INSERT INTO Devices (DeviceTypeID, BrandID, SecurityProtocol, EncryptionTypeID, DeviceImagePath, DeviceModel, Video, WiFi, DeviceIsSecure, DeviceInfoLink, Comments)
SELECT 
    (SELECT DeviceTypeID FROM DeviceTypes WHERE DeviceTypeName = 'Computing Devices'), -- ID типу пристрою для обчислювальних пристроїв
    (SELECT BrandID FROM Brands WHERE BrandName = 'Dell'), -- ID бренду для Apple
    (SELECT ProtocolID FROM TransmissionProtocols WHERE ProtocolName = 'TLS'), -- ID протоколу для TLS
    (SELECT EncryptionTypeID FROM EncryptionTypes WHERE EncryptionName = 'RSA'), -- ID типу шифрування для RSA
    'assets/devices/ComputingDevices/DELL.jpg', -- Шлях до зображення
    'Dell Venue 11 Pro', -- Модель пристрою
    1, -- Підтримка відео
    1, -- Підтримка WiFi
    'False', -- Процедура безпеки
    'https://www.dell.com/', -- Посилання на інформацію про пристрій
    'Elegant desktop computer with impressive display.'
WHERE NOT EXISTS (SELECT * FROM Devices WHERE DeviceModel = 'Dell Venue 11 Pro');

INSERT INTO DeviceSignalTypes (DeviceID, SignalTypeID)
VALUES (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = '2.4GHz')),
       (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = 'Bluetooth'));

INSERT INTO ComputingDevices (DeviceID, OSID, RAMSize, StorageSize, HasAntivirus)
SELECT IDENT_CURRENT('Devices'), 
       (SELECT OSID FROM OperatingSystems WHERE OSVersion = 'Windows 10'), 
       4, -- RAM size in GB
       128, -- Storage size in GB
       0 -- Has Antivirus
WHERE NOT EXISTS (SELECT * FROM ComputingDevices WHERE DeviceID = IDENT_CURRENT('Devices'));

----------------Mobile Device----------------
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insert for Mobile Device (Samsung Galaxy S21)
INSERT INTO Devices (DeviceTypeID, BrandID, SecurityProtocol, EncryptionTypeID, DeviceImagePath, DeviceModel, Video, WiFi, DeviceIsSecure, DeviceInfoLink, Comments)
VALUES ((SELECT DeviceTypeID FROM DeviceTypes WHERE DeviceTypeName = 'Mobile Devices'), 
        (SELECT BrandID FROM Brands WHERE BrandName = 'Samsung'), 
        (SELECT ProtocolID FROM TransmissionProtocols WHERE ProtocolName = 'TLS'), 
        (SELECT EncryptionTypeID FROM EncryptionTypes WHERE EncryptionName = 'AES'),
        'assets/devices/MobileDevices/SamsungGalaxyS21.webp', 
        'Samsung Galaxy S21', 
        1, 1, 'True', 
        'https://www.samsung.com/mobile/galaxy-s21/', 
        'Latest flagship smartphone with advanced features.');

INSERT INTO DeviceSignalTypes (DeviceID, SignalTypeID)
VALUES (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = '5GHz')),
       (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = 'Bluetooth'));

INSERT INTO MobileDevices (DeviceID, OSID, ScreenSize, BatteryLife, BiometricSecurity)
VALUES (IDENT_CURRENT('Devices'), 
        (SELECT OSID FROM OperatingSystems WHERE OSVersion = 'Android 11'), 
        6.2, -- Screen size in inches
        4800, -- Battery life in mAh
        1); -- Biometric security available

-- Insert for Mobile Device (Apple iPhone 12)
INSERT INTO Devices (DeviceTypeID, BrandID, SecurityProtocol, EncryptionTypeID, DeviceImagePath, DeviceModel, Video, WiFi, DeviceIsSecure, DeviceInfoLink, Comments)
VALUES ((SELECT DeviceTypeID FROM DeviceTypes WHERE DeviceTypeName = 'Mobile Devices'), 
        (SELECT BrandID FROM Brands WHERE BrandName = 'Apple'), 
        (SELECT ProtocolID FROM TransmissionProtocols WHERE ProtocolName = 'TLS'), 
        (SELECT EncryptionTypeID FROM EncryptionTypes WHERE EncryptionName = 'AES'),
        'assets/devices/MobileDevices/AppleiPhone12.jpeg', 
        'Apple iPhone 12', 
        1, 1, 'True', 
        'https://www.apple.com/iphone-12/', 
        'Innovative smartphone with A14 Bionic chip.');

INSERT INTO DeviceSignalTypes (DeviceID, SignalTypeID)
VALUES (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = '5GHz')),
       (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = 'Bluetooth'));

INSERT INTO MobileDevices (DeviceID, OSID, ScreenSize, BatteryLife, BiometricSecurity)
VALUES (IDENT_CURRENT('Devices'), 
        (SELECT OSID FROM OperatingSystems WHERE OSVersion = 'iOS 14'), 
        6.1, -- Screen size in inches
        2815, -- Battery life in mAh
        1); -- Biometric security available

-- Insert for Mobile Device (Apple iPhone 12)
INSERT INTO Devices (DeviceTypeID, BrandID, SecurityProtocol, EncryptionTypeID, DeviceImagePath, DeviceModel, Video, WiFi, DeviceIsSecure, DeviceInfoLink, Comments)
VALUES ((SELECT DeviceTypeID FROM DeviceTypes WHERE DeviceTypeName = 'Mobile Devices'), 
        (SELECT BrandID FROM Brands WHERE BrandName = 'Apple'), 
        (SELECT ProtocolID FROM TransmissionProtocols WHERE ProtocolName = 'TLS'), 
        (SELECT EncryptionTypeID FROM EncryptionTypes WHERE EncryptionName = 'AES'),
        'assets/devices/MobileDevices/AppleiPhone13.jpeg', 
        'Apple iPhone 13', 
        1, 1, 'True', 
        'https://www.apple.com/iphone-13/', 
        'Innovative smartphone with A14 Bionic chip.');

INSERT INTO DeviceSignalTypes (DeviceID, SignalTypeID)
VALUES (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = '5GHz')),
       (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = 'Bluetooth'));

-- Вставка для мобільного пристрою (Apple iPhone)
INSERT INTO MobileDevices (DeviceID, OSID, ScreenSize, BatteryLife, BiometricSecurity)
VALUES ((SELECT DeviceID FROM Devices WHERE DeviceModel = 'Apple iPhone 13'), 
        (SELECT OSID FROM OperatingSystems WHERE OSVersion = 'iOS 15'), 
        6.1, -- ScreenSize в дюймах
        3095, -- BatteryLife в міліампер-годинах
        1); -- BiometricSecurity як BIT, де 1 означає 'True'

----------------Networking Equipment----------------
--------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Devices (DeviceTypeID, BrandID, SecurityProtocol, EncryptionTypeID, DeviceImagePath, DeviceModel, Video, WiFi, DeviceIsSecure, DeviceInfoLink, Comments)
VALUES ((SELECT DeviceTypeID FROM DeviceTypes WHERE DeviceTypeName = 'Network Equipment'), 
        (SELECT BrandID FROM Brands WHERE BrandName = 'Cisco'), 
        (SELECT ProtocolID FROM TransmissionProtocols WHERE ProtocolName = 'SSH'), 
        (SELECT EncryptionTypeID FROM EncryptionTypes WHERE EncryptionName = 'RSA'),
        'assets/devices/NetworkingEquipment/CiscoRouter.jpeg', 
        'Cisco RV340', 
        0, 1, 'True', 
        'https://www.cisco.com/c/en/us/products/routers/rv340-dual-gigabit-wan-vpn-router/index.html', 
        'Reliable router designed for small businesses.');

-- Після вставки девайсу, ми вставляємо типи сигналів, які він підтримує
INSERT INTO DeviceSignalTypes (DeviceID, SignalTypeID)
VALUES (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = '2.4GHz')),
       (IDENT_CURRENT('Devices'), (SELECT SignalTypeID FROM SignalTypes WHERE SignalTypeName = '5GHz'));

-- Вставка для NetworkingEquipment (Cisco Router)
INSERT INTO NetworkingEquipment (DeviceID, OSID, SupportsVPN, MaxDataRate, PortCount, FirewallCapabilities)
VALUES (IDENT_CURRENT('Devices'), 
        (SELECT OSID FROM OperatingSystems WHERE OSVersion = 'Cisco IOS'), 
        1, 1000, 4, 'Advanced firewall with VPN support, intrusion prevention and advanced security services');

-- Вставка для мережевого обладнання (Netgear Switch)
INSERT INTO Devices (DeviceTypeID, BrandID, SecurityProtocol, EncryptionTypeID, DeviceImagePath, DeviceModel, Video, WiFi, DeviceIsSecure, DeviceInfoLink, Comments)
SELECT 
    (SELECT DeviceTypeID FROM DeviceTypes WHERE DeviceTypeName = 'Network Equipment'), 
    (SELECT BrandID FROM Brands WHERE BrandName = 'Netgear'), 
    (SELECT ProtocolID FROM TransmissionProtocols WHERE ProtocolName = 'SSH'), 
    (SELECT EncryptionTypeID FROM EncryptionTypes WHERE EncryptionName = 'RSA'),
    'assets/devices/NetworkingEquipment/NetgearSwitch.jpg', 
    'Netgear GS308', 
    0, 1, 'True', 
    'https://www.netgear.com/support/product/GS308.aspx', 
    'Reliable switch for business networks.'
WHERE NOT EXISTS (SELECT * FROM Devices WHERE DeviceModel = 'Netgear GS308');

INSERT INTO NetworkingEquipment (DeviceID, OSID, SupportsVPN, MaxDataRate, PortCount, FirewallCapabilities)
SELECT 
    IDENT_CURRENT('Devices'), 
    (SELECT OSID FROM OperatingSystems WHERE OSVersion = 'Netgear Switch OS'), 
    0, 1000, 8, 'Basic firewall capabilities without VPN support'
WHERE NOT EXISTS (SELECT * FROM NetworkingEquipment WHERE DeviceID = IDENT_CURRENT('Devices'));

-- Вставка для мережевого обладнання (Ubiquiti Access Point)
INSERT INTO Devices (DeviceTypeID, BrandID, SecurityProtocol, EncryptionTypeID, DeviceImagePath, DeviceModel, Video, WiFi, DeviceIsSecure, DeviceInfoLink, Comments)
SELECT 
    (SELECT DeviceTypeID FROM DeviceTypes WHERE DeviceTypeName = 'Network Equipment'), 
    (SELECT BrandID FROM Brands WHERE BrandName = 'Ubiquiti'), 
    (SELECT ProtocolID FROM TransmissionProtocols WHERE ProtocolName = 'SSH'), 
    (SELECT EncryptionTypeID FROM EncryptionTypes WHERE EncryptionName = 'RSA'),
    'assets/devices/NetworkingEquipment/UbiquitiAP.jpg', 
    'Ubiquiti UniFi AP', 
    0, 1, 'True', 
    'https://www.ui.com/unifi/unifi-ap/', 
    'High-performance access point for large areas.'
WHERE NOT EXISTS (SELECT * FROM Devices WHERE DeviceModel = 'Ubiquiti UniFi AP');

INSERT INTO NetworkingEquipment (DeviceID, OSID, SupportsVPN, MaxDataRate, PortCount, FirewallCapabilities)
SELECT 
    IDENT_CURRENT('Devices'), 
    (SELECT OSID FROM OperatingSystems WHERE OSVersion = 'Ubiquiti UniFi OS'), 
    0, 1300, 1, 'Firewall capabilities with advanced traffic management and security features'
WHERE NOT EXISTS (SELECT * FROM NetworkingEquipment WHERE DeviceID = IDENT_CURRENT('Devices'));


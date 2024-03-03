IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[Languages]')
				AND		
				OBJECTPROPERTY(id,N'IsLanguagesTable')=1) 
BEGIN
	CREATE TABLE Languages
	(
		LanguagesID BIGINT PRIMARY KEY IDENTITY(1,1)
		,LanguageName VARCHAR(100)
		,LanguageisoCode VARCHAR(3)
		,LanguageIconPath VARCHAR(MAX)
	)
END
ELSE
BEGIN
	PRINT 'Languages Table Exists'
END
--------------------------------------------------------------
-- Створення таблиці брендів
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[Brands]')
				AND		
				OBJECTPROPERTY(id,N'IsBrandsTable')=1) 
BEGIN
	CREATE TABLE Brands (
		BrandID BIGINT PRIMARY KEY IDENTITY(1,1)
		,BrandName VARCHAR(50)
	);
END
ELSE
BEGIN
	PRINT 'Brands Table Exists'
END
--------------------------------------------------------------
-- Створення таблиці протоколів передачі даних
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[TransmissionProtocols]')
				AND		
				OBJECTPROPERTY(id,N'IsTransmissionProtocolsTable')=1) 
BEGIN
	CREATE TABLE TransmissionProtocols (
		ProtocolID BIGINT PRIMARY KEY IDENTITY(1,1)
		,ProtocolName VARCHAR(50)
	);
END
ELSE
BEGIN
	PRINT 'TransmissionProtocols Table Exists'
END
--------------------------------------------------------------
-- Створення таблиці типів шифрування
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[EncryptionTypes]')
				AND		
				OBJECTPROPERTY(id,N'IsEncryptionTypesTable')=1) 
BEGIN
	CREATE TABLE EncryptionTypes (
		EncryptionTypeID BIGINT PRIMARY KEY IDENTITY(1,1)
		,EncryptionName VARCHAR(50)
	);
END
ELSE
BEGIN
	PRINT 'EncryptionTypes Table Exists'
END
--------------------------------------------------------------
-- Створення таблиці сигналу
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[SignalTypes]')
				AND		
				OBJECTPROPERTY(id,N'IsSignalTypesTable')=1) 
BEGIN
	CREATE TABLE SignalTypes (
		SignalTypeID BIGINT PRIMARY KEY IDENTITY(1,1)
		,SignalTypeName VARCHAR(50)
	);
END
ELSE
BEGIN
	PRINT 'SignalTypes Table Exists'
END
--------------------------------------------------------------
-- Створення таблиці типів пристроїв
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceTypes]') AND type in (N'U'))
BEGIN
    CREATE TABLE DeviceTypes (
        DeviceTypeID BIGINT PRIMARY KEY IDENTITY(1,1)
        ,DeviceTypeName NVARCHAR(100)
        ,ImagePath NVARCHAR(MAX)
    );
END
ELSE
BEGIN
	PRINT 'DeviceTypes Table Exists'
END
--------------------------------------------------------------
-- Створення таблиці пристроїв
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[Devices]')
				AND		
				OBJECTPROPERTY(id,N'IsDevicesTable')=1) 
BEGIN
	CREATE TABLE Devices (
		DeviceID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceTypeID BIGINT FOREIGN KEY REFERENCES DeviceTypes(DeviceTypeID)
		,BrandID BIGINT FOREIGN KEY REFERENCES Brands(BrandID)
		,SecurityProtocol BIGINT FOREIGN KEY REFERENCES TransmissionProtocols(ProtocolID)
		,EncryptionTypeID BIGINT FOREIGN KEY REFERENCES EncryptionTypes(EncryptionTypeID)

		,DeviceImagePath VARCHAR(MAX)
		,DeviceModel VARCHAR(50)
		,Video BIT
		,WiFi BIT
		,DeviceIsSecure VARCHAR(5)
		,DeviceInfoLink VARCHAR(255)
		,Comments TEXT
	);
END
ELSE
BEGIN
	PRINT 'Devices Table Exists'
END
--------------------------------------------------------------
-- Створення таблиці, яка відображає зв'язок між пристроями та типами сигналу
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[DeviceSignalTypes]')
				AND		
				OBJECTPROPERTY(id,N'IsDeviceSignalTypesTable')=1) 
BEGIN
	CREATE TABLE DeviceSignalTypes (
		DeviceSignalTypes BIGINT PRIMARY KEY IDENTITY(1,1)

		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)
		,SignalTypeID BIGINT FOREIGN KEY REFERENCES SignalTypes(SignalTypeID)
	);
END
ELSE
BEGIN
	PRINT 'DeviceSignalTypes Table Exists'
END
--------------------------------------------------------------
-- Створення таблиці операційних систем
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[OperatingSystemsTypes]')
				AND		
				OBJECTPROPERTY(id,N'IsOperatingSystemsTypesTable')=1) 
BEGIN
	CREATE TABLE OperatingSystemsTypes (
		OSTypeID BIGINT PRIMARY KEY IDENTITY(1,1),
		OSName VARCHAR(50), -- імя операційної системи
	);
END
ELSE
BEGIN
	PRINT 'OperatingSystemsTypes Table Exists'
END
--------------------------------------------------------------
-- Таблиця для 'Operating Systems'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[OperatingSystems]')
				AND		
				OBJECTPROPERTY(id,N'IsOperatingSystemsTable')=1) 
BEGIN
	CREATE TABLE OperatingSystems (
		OSID BIGINT PRIMARY KEY IDENTITY(1,1)

		,OSTypeID BIGINT FOREIGN KEY REFERENCES OperatingSystemsTypes(OSTypeID)

		,OSVersion VARCHAR(50)
		,OSIsSecure BIT --версія
		,KnownVulnerabilities NVARCHAR(MAX) -- містить деталі про відомі вразливості або проблеми.
	);
END
ELSE
BEGIN
	PRINT 'OperatingSystems Table Exists'
END

--------------------------------------------------------------
-- Таблиця для 'Computing Devices'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[ComputingDevices]')
				AND		
				OBJECTPROPERTY(id,N'IsComputingDevicesTable')=1) 
BEGIN
	CREATE TABLE ComputingDevices (
		ComputingDeviceID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,RAMSize INT		-- Кількість оперативної пам'яті в пристрої
		,StorageSize INT	-- Об'єм вбудованого сховища
		,HasAntivirus BIT	-- Чи встановлено антивірусне програмне забезпечення
	);
END
ELSE
BEGIN
	PRINT 'ComputingDevices Table Exists'
END
--------------------------------------------------------------
-- Таблиця для 'Mobile Devices'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[MobileDevices]')
				AND		
				OBJECTPROPERTY(id,N'IsMobileDevicesTable')=1) 
BEGIN
	CREATE TABLE MobileDevices (
	
		MobileDeviceID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,ScreenSize DECIMAL(5, 2)
		,BatteryLife INT
		,BiometricSecurity BIT	-- Наявність біометричних методів аутентифікації
	);
END
ELSE
BEGIN
	PRINT 'MobileDevices Table Exists'
END
--------------------------------------------------------------
-- Таблиця для 'Networking Equipment'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[NetworkingEquipment]')
				AND		
				OBJECTPROPERTY(id,N'IsNetworkingEquipmentTable')=1) 
BEGIN
	CREATE TABLE NetworkingEquipment (
		NetworkingEquipmentID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,SupportsVPN BIT	-- Підтримка віртуальних приватних мереж (VPN)
		,MaxDataRate INT	-- Максимальна швидкість передачі даних
		,PortCount INT		-- Кількість мережевих портів
		,FirewallCapabilities VARCHAR(255)	-- Можливості брандмауера обладнання для захисту мережі
	);
END
ELSE
BEGIN
	PRINT 'NetworkingEquipment Table Exists'
END
--------------------------------------------------------------
-- Таблиця для 'Smart Home Devices'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[SmartHomeDevices]')
				AND		
				OBJECTPROPERTY(id,N'IsSmartHomeDevicesTable')=1) 
BEGIN
	CREATE TABLE SmartHomeDevices (
		SmartHomeDevicesID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,ConnectivityType VARCHAR(50)		-- Тип з'єднання, що використовується пристроєм
		,CompatibleAssistants VARCHAR(255)	-- Сумісність з голосовими асистентами
		,EnergyStarRated BIT				-- Чи відповідає пристрій стандартам Energy Star
		,RemoteAccess BIT					-- Можливість дистанційного доступу
	);
END
ELSE
BEGIN
	PRINT 'SmartHomeDevices Table Exists'
END
--------------------------------------------------------------
-- Таблиця для 'Office Equipment'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[OfficeEquipment]')
				AND		
				OBJECTPROPERTY(id,N'IsOfficeEquipmentTable')=1) 
BEGIN
	CREATE TABLE OfficeEquipment (
		OfficeEquipmentID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,NetworkConnectivity BIT -- Чи підключено обладнання до мережі, що вимагає захисту мережевих з'єднань
		,DocumentSecurityFeatures VARCHAR(255)	-- Функції безпеки для захисту документів.
		,UserAuthentication BIT	-- Механізми аутентифікації користувачів для доступу до обладнання
		,AccessLogs BIT			-- Ведення журналів доступу для моніторингу та аудиту
	);
END
ELSE
BEGIN
	PRINT 'OfficeEquipment Table Exists'
END
--------------------------------------------------------------
-- Таблиця для 'Entertainment Systems'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[EntertainmentSystems]')
				AND		
				OBJECTPROPERTY(id,N'IsEntertainmentSystemsTable')=1) 
BEGIN
	CREATE TABLE EntertainmentSystems (
		EntertainmentSystemsID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,ParentalControl BIT		-- Функції батьківського контролю
		,FirmwareIntegrityCheck BIT	-- Перевірка цілісності прошивки
		,NetworkSecurity BIT		-- Заходи безпеки для захисту мережевих з'єднань
		,ContentEncryption BIT		-- Шифрування контенту
	);
END
ELSE
BEGIN
	PRINT 'EntertainmentSystems Table Exists'
END
--------------------------------------------------------------
-- Таблиця для 'Wearable Technology' - Smart Glasses/VR Headsets
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[WearableTechnology]')
				AND		
				OBJECTPROPERTY(id,N'IsWearableTechnologyTable')=1) 
BEGIN
	CREATE TABLE WearableTechnology (
		WearableTechnologyID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,BiometricDataSecurity BIT	-- Безпека зберігання та передачі біометричних даних
		,DevicePairingSecurity BIT	-- Безпека при сполученні з іншими пристроями
		,LocationTrackingOption BIT	-- Опції відстеження місцезнаходження
		,EmergencySOS BIT			-- Можливість надсилати сигнал SOS 
	);
END
ELSE
BEGIN
	PRINT 'WearableTechnology Table Exists'
END
--------------------------------------------------------------
-- Таблиця для 'Educational Devices'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[EducationalDevices]')
				AND		
				OBJECTPROPERTY(id,N'IsEducationalDevicesTable')=1) 
BEGIN
	CREATE TABLE EducationalDevices (
		EducationalDeviceID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,EducationalContentSecurity BIT		-- Захист освітнього контенту
		,UserAgeVerification BIT			-- Верифікація віку користувачів
		,DeviceMonitoringCapabilities VARCHAR(255) -- Можливості моніторингу пристрою для відстеження використання.
		,RemoteManagement BIT	-- Можливість дистанційного керування 
	);
END
ELSE
BEGIN
	PRINT 'EducationalDevices Table Exists'
END
--------------------------------------------------------------
-- Table for 'Healthcare Devices'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[HealthcareDevices]')
				AND		
				OBJECTPROPERTY(id,N'IsHealthcareDevicesTable')=1) 
BEGIN
	CREATE TABLE HealthcareDevices (
		HealthcareDeviceID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,PatientDataSecurity BIT -- Безпека даних пацієнтів
		,RegulatoryCompliance VARCHAR(255) -- Дотримання регулятивних норм
		,DataEncryptionLevel VARCHAR(255)  -- Рівень шифрування даних
		,EmergencySupport BIT			   -- Функції аварійної підтримки
	);
END
ELSE
BEGIN
	PRINT 'HealthcareDevices Table Exists'
END
--------------------------------------------------------------
-- Table for 'Industrial Control Systems' 
--SCADA Systems/PLCs (Programmable Logic Controllers)/DCS (Distributed Control Systems)
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[IndustrialControlSystems]')
				AND		
				OBJECTPROPERTY(id,N'IsIndustrialControlSystemsTable')=1) 
BEGIN
	CREATE TABLE IndustrialControlSystems (
		IndustrialControlSystemID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,SCADASecurity BIT					 -- Заходи безпеки для SCADA
		,PhysicalSafetyFeatures VARCHAR(255) -- Фізичні заходи безпеки
		,NetworkIsolation BIT				 -- Ізоляція мережі
		,RegularUpdatesSupport BIT			 -- Підтримка регулярних оновлень
	);
END
ELSE
BEGIN
	PRINT 'IndustrialControlSystems Table Exists'
END
--------------------------------------------------------------
-- Table for 'Internet of Things (IoT) Devices'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[IoTDevices]')
				AND		
				OBJECTPROPERTY(id,N'IsIoTDevicesTable')=1) 
BEGIN
	CREATE TABLE IoTDevices (
		IoTDevicesID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,IoTSecurity BIT					-- Загальні заходи безпеки для IoT
		,ConnectivityProtocols VARCHAR(255)	-- Протоколи з'єднання
		,UpdateMechanism VARCHAR(Max)		-- Механізм оновлення
		,DataCollectionPolicy VARCHAR(Max)  -- Політика збору даних
	);
END
ELSE
BEGIN
	PRINT 'IoTDevices Table Exists'
END
--------------------------------------------------------------
-- Table for 'Automotive Devices'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[AutomotiveDevices]')
				AND		
				OBJECTPROPERTY(id,N'AutomotiveDevicesTable')=1) 
BEGIN
	CREATE TABLE AutomotiveDevices (
		AutomotiveDeviceID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,VehicleCybersecurity BIT		 -- Кібербезпека трапнспортних засобів
		,TelematicsFeatures VARCHAR(255) -- Функції телематики
		,ECUSecurity BIT				 -- Безпека електронних блоків управління
		,OverTheAirUpdates BIT			 -- Оновлення через "повітря"
	);
END
ELSE
BEGIN
	PRINT 'AutomotiveDevices Table Exists'
END
--------------------------------------------------------------
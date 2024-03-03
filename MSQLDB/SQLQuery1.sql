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
-- ��������� ������� ������
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
-- ��������� ������� ��������� �������� �����
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
-- ��������� ������� ���� ����������
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
-- ��������� ������� �������
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
-- ��������� ������� ���� ��������
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
-- ��������� ������� ��������
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
-- ��������� �������, ��� �������� ��'���� �� ���������� �� ������ �������
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
-- ��������� ������� ����������� ������
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[OperatingSystemsTypes]')
				AND		
				OBJECTPROPERTY(id,N'IsOperatingSystemsTypesTable')=1) 
BEGIN
	CREATE TABLE OperatingSystemsTypes (
		OSTypeID BIGINT PRIMARY KEY IDENTITY(1,1),
		OSName VARCHAR(50), -- ��� ���������� �������
	);
END
ELSE
BEGIN
	PRINT 'OperatingSystemsTypes Table Exists'
END
--------------------------------------------------------------
-- ������� ��� 'Operating Systems'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[OperatingSystems]')
				AND		
				OBJECTPROPERTY(id,N'IsOperatingSystemsTable')=1) 
BEGIN
	CREATE TABLE OperatingSystems (
		OSID BIGINT PRIMARY KEY IDENTITY(1,1)

		,OSTypeID BIGINT FOREIGN KEY REFERENCES OperatingSystemsTypes(OSTypeID)

		,OSVersion VARCHAR(50)
		,OSIsSecure BIT --�����
		,KnownVulnerabilities NVARCHAR(MAX) -- ������ ����� ��� ���� ���������� ��� ��������.
	);
END
ELSE
BEGIN
	PRINT 'OperatingSystems Table Exists'
END

--------------------------------------------------------------
-- ������� ��� 'Computing Devices'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[ComputingDevices]')
				AND		
				OBJECTPROPERTY(id,N'IsComputingDevicesTable')=1) 
BEGIN
	CREATE TABLE ComputingDevices (
		ComputingDeviceID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,RAMSize INT		-- ʳ������ ���������� ���'�� � �������
		,StorageSize INT	-- ��'�� ����������� �������
		,HasAntivirus BIT	-- �� ����������� ���������� ��������� ������������
	);
END
ELSE
BEGIN
	PRINT 'ComputingDevices Table Exists'
END
--------------------------------------------------------------
-- ������� ��� 'Mobile Devices'
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
		,BiometricSecurity BIT	-- �������� ����������� ������ ��������������
	);
END
ELSE
BEGIN
	PRINT 'MobileDevices Table Exists'
END
--------------------------------------------------------------
-- ������� ��� 'Networking Equipment'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[NetworkingEquipment]')
				AND		
				OBJECTPROPERTY(id,N'IsNetworkingEquipmentTable')=1) 
BEGIN
	CREATE TABLE NetworkingEquipment (
		NetworkingEquipmentID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,SupportsVPN BIT	-- ϳ������� ���������� ��������� ����� (VPN)
		,MaxDataRate INT	-- ����������� �������� �������� �����
		,PortCount INT		-- ʳ������ ��������� �����
		,FirewallCapabilities VARCHAR(255)	-- ��������� ����������� ���������� ��� ������� �����
	);
END
ELSE
BEGIN
	PRINT 'NetworkingEquipment Table Exists'
END
--------------------------------------------------------------
-- ������� ��� 'Smart Home Devices'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[SmartHomeDevices]')
				AND		
				OBJECTPROPERTY(id,N'IsSmartHomeDevicesTable')=1) 
BEGIN
	CREATE TABLE SmartHomeDevices (
		SmartHomeDevicesID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,ConnectivityType VARCHAR(50)		-- ��� �'�������, �� ��������������� ��������
		,CompatibleAssistants VARCHAR(255)	-- �������� � ���������� �����������
		,EnergyStarRated BIT				-- �� ������� ������� ���������� Energy Star
		,RemoteAccess BIT					-- ��������� ������������� �������
	);
END
ELSE
BEGIN
	PRINT 'SmartHomeDevices Table Exists'
END
--------------------------------------------------------------
-- ������� ��� 'Office Equipment'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[OfficeEquipment]')
				AND		
				OBJECTPROPERTY(id,N'IsOfficeEquipmentTable')=1) 
BEGIN
	CREATE TABLE OfficeEquipment (
		OfficeEquipmentID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,NetworkConnectivity BIT -- �� ��������� ���������� �� �����, �� ������ ������� ��������� �'������
		,DocumentSecurityFeatures VARCHAR(255)	-- ������� ������� ��� ������� ���������.
		,UserAuthentication BIT	-- �������� �������������� ������������ ��� ������� �� ����������
		,AccessLogs BIT			-- ������� ������� ������� ��� ���������� �� ������
	);
END
ELSE
BEGIN
	PRINT 'OfficeEquipment Table Exists'
END
--------------------------------------------------------------
-- ������� ��� 'Entertainment Systems'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[EntertainmentSystems]')
				AND		
				OBJECTPROPERTY(id,N'IsEntertainmentSystemsTable')=1) 
BEGIN
	CREATE TABLE EntertainmentSystems (
		EntertainmentSystemsID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,ParentalControl BIT		-- ������� ������������ ��������
		,FirmwareIntegrityCheck BIT	-- �������� �������� ��������
		,NetworkSecurity BIT		-- ������ ������� ��� ������� ��������� �'������
		,ContentEncryption BIT		-- ���������� ��������
	);
END
ELSE
BEGIN
	PRINT 'EntertainmentSystems Table Exists'
END
--------------------------------------------------------------
-- ������� ��� 'Wearable Technology' - Smart Glasses/VR Headsets
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[WearableTechnology]')
				AND		
				OBJECTPROPERTY(id,N'IsWearableTechnologyTable')=1) 
BEGIN
	CREATE TABLE WearableTechnology (
		WearableTechnologyID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,BiometricDataSecurity BIT	-- ������� ��������� �� �������� ����������� �����
		,DevicePairingSecurity BIT	-- ������� ��� ��������� � ������ ����������
		,LocationTrackingOption BIT	-- ����� ���������� ���������������
		,EmergencySOS BIT			-- ��������� ��������� ������ SOS 
	);
END
ELSE
BEGIN
	PRINT 'WearableTechnology Table Exists'
END
--------------------------------------------------------------
-- ������� ��� 'Educational Devices'
IF NOT EXISTS (	SELECT * FROM dbo.sysobjects WHERE 
				id=OBJECT_ID(N'[dbo].[EducationalDevices]')
				AND		
				OBJECTPROPERTY(id,N'IsEducationalDevicesTable')=1) 
BEGIN
	CREATE TABLE EducationalDevices (
		EducationalDeviceID BIGINT PRIMARY KEY IDENTITY(1,1)
		,DeviceID BIGINT FOREIGN KEY REFERENCES Devices(DeviceID)

		,OSID BIGINT FOREIGN KEY REFERENCES OperatingSystems(OSID)

		,EducationalContentSecurity BIT		-- ������ ��������� ��������
		,UserAgeVerification BIT			-- ����������� ��� ������������
		,DeviceMonitoringCapabilities VARCHAR(255) -- ��������� ���������� �������� ��� ���������� ������������.
		,RemoteManagement BIT	-- ��������� ������������� ��������� 
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

		,PatientDataSecurity BIT -- ������� ����� ��������
		,RegulatoryCompliance VARCHAR(255) -- ���������� ������������ ����
		,DataEncryptionLevel VARCHAR(255)  -- г���� ���������� �����
		,EmergencySupport BIT			   -- ������� ������� ��������
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

		,SCADASecurity BIT					 -- ������ ������� ��� SCADA
		,PhysicalSafetyFeatures VARCHAR(255) -- Գ���� ������ �������
		,NetworkIsolation BIT				 -- �������� �����
		,RegularUpdatesSupport BIT			 -- ϳ������� ���������� ��������
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

		,IoTSecurity BIT					-- ������� ������ ������� ��� IoT
		,ConnectivityProtocols VARCHAR(255)	-- ��������� �'�������
		,UpdateMechanism VARCHAR(Max)		-- ������� ���������
		,DataCollectionPolicy VARCHAR(Max)  -- ������� ����� �����
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

		,VehicleCybersecurity BIT		 -- ʳ���������� ������������� ������
		,TelematicsFeatures VARCHAR(255) -- ������� ����������
		,ECUSecurity BIT				 -- ������� ����������� ����� ���������
		,OverTheAirUpdates BIT			 -- ��������� ����� "������"
	);
END
ELSE
BEGIN
	PRINT 'AutomotiveDevices Table Exists'
END
--------------------------------------------------------------
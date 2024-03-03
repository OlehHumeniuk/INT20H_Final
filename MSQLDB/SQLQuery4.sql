
CREATE Proc GetAllDeviceTypes
AS
BEGIN
    SELECT * FROM DeviceTypes
END
GO

CREATE Proc GetAllDevices
AS
BEGIN
    SELECT * FROM Devices;
END
GO

CREATE Proc GetAllBrands
AS
BEGIN
    SELECT Brands.BrandName FROM Brands;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'ComputingDeviceDetails'
CREATE PROCEDURE GetComputingDeviceDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        cd.ComputingDeviceID,
		d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        cd.RAMSize,
        cd.StorageSize,
        cd.HasAntivirus,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        ComputingDevices cd
        INNER JOIN Devices d ON cd.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON cd.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        cd.DeviceID = @DeviceID
    GROUP BY
        cd.ComputingDeviceID,
		d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        cd.RAMSize,
        cd.StorageSize,
        cd.HasAntivirus,
        d.DeviceImagePath;
END
GO

CREATE Proc GetAllComputingDevices
AS
BEGIN
    SELECT
        cd.ComputingDeviceID,
		d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        cd.RAMSize,
        cd.StorageSize,
        cd.HasAntivirus,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        ComputingDevices cd
        INNER JOIN Devices d ON cd.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON cd.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        cd.ComputingDeviceID,
		d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        cd.RAMSize,
        cd.StorageSize,
        cd.HasAntivirus,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'Mobile Devices'
CREATE PROCEDURE GetMobileDeviceDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        md.MobileDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        md.ScreenSize,
        md.BatteryLife,
        md.BiometricSecurity,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        MobileDevices md
        INNER JOIN Devices d ON md.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON md.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        md.DeviceID = @DeviceID
    GROUP BY
        md.MobileDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        md.ScreenSize,
        md.BatteryLife,
        md.BiometricSecurity,
        d.DeviceImagePath;
END
GO

CREATE PROCEDURE GetAllMobileDeviceDetails
AS
BEGIN
    SELECT
        md.MobileDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        md.ScreenSize,
        md.BatteryLife,
        md.BiometricSecurity,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        MobileDevices md
        INNER JOIN Devices d ON md.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON md.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        md.MobileDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        md.ScreenSize,
        md.BatteryLife,
        md.BiometricSecurity,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'Automotive Devices'
CREATE PROCEDURE GetAutomotiveDeviceDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        ad.AutomotiveDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ad.VehicleCybersecurity,
        ad.TelematicsFeatures,
        ad.ECUSecurity,
        ad.OverTheAirUpdates,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        AutomotiveDevices ad
        INNER JOIN Devices d ON ad.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON ad.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        ad.DeviceID = @DeviceID
    GROUP BY
        ad.AutomotiveDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ad.VehicleCybersecurity,
        ad.TelematicsFeatures,
        ad.ECUSecurity,
        ad.OverTheAirUpdates,
        d.DeviceImagePath;
END
GO

CREATE PROCEDURE GetAllAutomotiveDeviceDetails
AS
BEGIN
    SELECT
        ad.AutomotiveDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ad.VehicleCybersecurity,
        ad.TelematicsFeatures,
        ad.ECUSecurity,
        ad.OverTheAirUpdates,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        AutomotiveDevices ad
        INNER JOIN Devices d ON ad.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON ad.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        ad.AutomotiveDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ad.VehicleCybersecurity,
        ad.TelematicsFeatures,
        ad.ECUSecurity,
        ad.OverTheAirUpdates,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'IoT Devices'
CREATE PROCEDURE GetIoTDeviceDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        iot.IoTDevicesID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        iot.IoTSecurity,
        iot.ConnectivityProtocols,
        iot.UpdateMechanism,
        iot.DataCollectionPolicy,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        IoTDevices iot
        INNER JOIN Devices d ON iot.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON iot.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        iot.DeviceID = @DeviceID
    GROUP BY
        iot.IoTDevicesID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        iot.IoTSecurity,
        iot.ConnectivityProtocols,
        iot.UpdateMechanism,
        iot.DataCollectionPolicy,
        d.DeviceImagePath;
END
GO

CREATE PROCEDURE GetAllIoTDeviceDetails
AS
BEGIN
    SELECT
        iot.IoTDevicesID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        iot.IoTSecurity,
        iot.ConnectivityProtocols,
        iot.UpdateMechanism,
        iot.DataCollectionPolicy,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        IoTDevices iot
        INNER JOIN Devices d ON iot.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON iot.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        iot.IoTDevicesID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        iot.IoTSecurity,
        iot.ConnectivityProtocols,
        iot.UpdateMechanism,
        iot.DataCollectionPolicy,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'Industrial Control Systems'
CREATE PROCEDURE GetIndustrialControlSystemDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        ics.IndustrialControlSystemID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ics.SCADASecurity,
        ics.PhysicalSafetyFeatures,
        ics.NetworkIsolation,
        ics.RegularUpdatesSupport,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        IndustrialControlSystems ics
        INNER JOIN Devices d ON ics.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON ics.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        ics.DeviceID = @DeviceID
    GROUP BY
        ics.IndustrialControlSystemID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ics.SCADASecurity,
        ics.PhysicalSafetyFeatures,
        ics.NetworkIsolation,
        ics.RegularUpdatesSupport,
        d.DeviceImagePath;
END
GO

CREATE PROCEDURE GetAllIndustrialControlSystemDetails
AS
BEGIN
    SELECT
        ics.IndustrialControlSystemID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ics.SCADASecurity,
        ics.PhysicalSafetyFeatures,
        ics.NetworkIsolation,
        ics.RegularUpdatesSupport,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        IndustrialControlSystems ics
        INNER JOIN Devices d ON ics.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON ics.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        ics.IndustrialControlSystemID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ics.SCADASecurity,
        ics.PhysicalSafetyFeatures,
        ics.NetworkIsolation,
        ics.RegularUpdatesSupport,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'Healthcare Devices'
CREATE PROCEDURE GetHealthcareDeviceDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        hd.HealthcareDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        hd.PatientDataSecurity,
        hd.RegulatoryCompliance,
        hd.DataEncryptionLevel,
        hd.EmergencySupport,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        HealthcareDevices hd
        INNER JOIN Devices d ON hd.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON hd.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        hd.DeviceID = @DeviceID
    GROUP BY
        hd.HealthcareDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        hd.PatientDataSecurity,
        hd.RegulatoryCompliance,
        hd.DataEncryptionLevel,
        hd.EmergencySupport,
        d.DeviceImagePath;
END
GO

CREATE PROCEDURE GetAllHealthcareDeviceDetails
AS
BEGIN
    SELECT
        hd.HealthcareDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        hd.PatientDataSecurity,
        hd.RegulatoryCompliance,
        hd.DataEncryptionLevel,
        hd.EmergencySupport,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        HealthcareDevices hd
        INNER JOIN Devices d ON hd.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON hd.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        hd.HealthcareDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        hd.PatientDataSecurity,
        hd.RegulatoryCompliance,
        hd.DataEncryptionLevel,
        hd.EmergencySupport,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'Educational Devices'
CREATE PROCEDURE GetEducationalDeviceDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        ed.EducationalDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ed.EducationalContentSecurity,
        ed.UserAgeVerification,
        ed.DeviceMonitoringCapabilities,
        ed.RemoteManagement,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        EducationalDevices ed
        INNER JOIN Devices d ON ed.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON ed.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        ed.DeviceID = @DeviceID
    GROUP BY
        ed.EducationalDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ed.EducationalContentSecurity,
        ed.UserAgeVerification,
        ed.DeviceMonitoringCapabilities,
        ed.RemoteManagement,
        d.DeviceImagePath;
END
GO

CREATE PROCEDURE GetAllEducationalDeviceDetails
AS
BEGIN
    SELECT
        ed.EducationalDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ed.EducationalContentSecurity,
        ed.UserAgeVerification,
        ed.DeviceMonitoringCapabilities,
        ed.RemoteManagement,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        EducationalDevices ed
        INNER JOIN Devices d ON ed.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON ed.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        ed.EducationalDeviceID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ed.EducationalContentSecurity,
        ed.UserAgeVerification,
        ed.DeviceMonitoringCapabilities,
        ed.RemoteManagement,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'Wearable Technology'
CREATE PROCEDURE GetWearableTechnologyDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        wt.WearableTechnologyID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        wt.BiometricDataSecurity,
        wt.DevicePairingSecurity,
        wt.LocationTrackingOption,
        wt.EmergencySOS,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        WearableTechnology wt
        INNER JOIN Devices d ON wt.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON wt.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        wt.DeviceID = @DeviceID
    GROUP BY
        wt.WearableTechnologyID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        wt.BiometricDataSecurity,
        wt.DevicePairingSecurity,
        wt.LocationTrackingOption,
        wt.EmergencySOS,
        d.DeviceImagePath;
END
GO

CREATE PROCEDURE GetAllWearableTechnologyDetails
AS
BEGIN
    SELECT
        wt.WearableTechnologyID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        wt.BiometricDataSecurity,
        wt.DevicePairingSecurity,
        wt.LocationTrackingOption,
        wt.EmergencySOS,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        WearableTechnology wt
        INNER JOIN Devices d ON wt.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON wt.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        wt.WearableTechnologyID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        wt.BiometricDataSecurity,
        wt.DevicePairingSecurity,
        wt.LocationTrackingOption,
        wt.EmergencySOS,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'Entertainment Systems'
CREATE PROCEDURE GetEntertainmentSystemDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        es.EntertainmentSystemsID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        es.ParentalControl,
        es.FirmwareIntegrityCheck,
        es.NetworkSecurity,
        es.ContentEncryption,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        EntertainmentSystems es
        INNER JOIN Devices d ON es.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON es.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        es.DeviceID = @DeviceID
    GROUP BY
        es.EntertainmentSystemsID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        es.ParentalControl,
        es.FirmwareIntegrityCheck,
        es.NetworkSecurity,
        es.ContentEncryption,
        d.DeviceImagePath;
END
GO

CREATE PROCEDURE GetAllEntertainmentSystemDetails
AS
BEGIN
    SELECT
        es.EntertainmentSystemsID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        es.ParentalControl,
        es.FirmwareIntegrityCheck,
        es.NetworkSecurity,
        es.ContentEncryption,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        EntertainmentSystems es
        INNER JOIN Devices d ON es.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON es.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        es.EntertainmentSystemsID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        es.ParentalControl,
        es.FirmwareIntegrityCheck,
        es.NetworkSecurity,
        es.ContentEncryption,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'Office Equipment'
CREATE PROCEDURE GetOfficeEquipmentDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        oe.OfficeEquipmentID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        oe.NetworkConnectivity,
        oe.DocumentSecurityFeatures,
        oe.UserAuthentication,
        oe.AccessLogs,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        OfficeEquipment oe
        INNER JOIN Devices d ON oe.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON oe.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        oe.DeviceID = @DeviceID
    GROUP BY
        oe.OfficeEquipmentID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        oe.NetworkConnectivity,
        oe.DocumentSecurityFeatures,
        oe.UserAuthentication,
        oe.AccessLogs,
        d.DeviceImagePath;
END
GO

CREATE PROCEDURE GetAllOfficeEquipmentDetails
AS
BEGIN
    SELECT
        oe.OfficeEquipmentID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        oe.NetworkConnectivity,
        oe.DocumentSecurityFeatures,
        oe.UserAuthentication,
        oe.AccessLogs,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        OfficeEquipment oe
        INNER JOIN Devices d ON oe.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON oe.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        oe.OfficeEquipmentID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        oe.NetworkConnectivity,
        oe.DocumentSecurityFeatures,
        oe.UserAuthentication,
        oe.AccessLogs,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'Smart Home Devices'
CREATE PROCEDURE GetSmartHomeDeviceDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        shd.SmartHomeDevicesID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        shd.ConnectivityType,
        shd.CompatibleAssistants,
        shd.EnergyStarRated,
        shd.RemoteAccess,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        SmartHomeDevices shd
        INNER JOIN Devices d ON shd.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON shd.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        shd.DeviceID = @DeviceID
    GROUP BY
        shd.SmartHomeDevicesID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        shd.ConnectivityType,
        shd.CompatibleAssistants,
        shd.EnergyStarRated,
        shd.RemoteAccess,
        d.DeviceImagePath;
END
GO

CREATE PROCEDURE GetAllSmartHomeDeviceDetails
AS
BEGIN
    SELECT
        shd.SmartHomeDevicesID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        shd.ConnectivityType,
        shd.CompatibleAssistants,
        shd.EnergyStarRated,
        shd.RemoteAccess,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        SmartHomeDevices shd
        INNER JOIN Devices d ON shd.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON shd.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        shd.SmartHomeDevicesID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        shd.ConnectivityType,
        shd.CompatibleAssistants,
        shd.EnergyStarRated,
        shd.RemoteAccess,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------
-- Таблиця для 'Networking Equipment'
CREATE PROCEDURE GetNetworkingEquipmentDetails
    @DeviceID BIGINT
AS
BEGIN
    SELECT
        ne.NetworkingEquipmentID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ne.SupportsVPN,
        ne.MaxDataRate,
        ne.PortCount,
        ne.FirewallCapabilities,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        NetworkingEquipment ne
        INNER JOIN Devices d ON ne.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON ne.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    WHERE
        ne.DeviceID = @DeviceID
    GROUP BY
        ne.NetworkingEquipmentID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ne.SupportsVPN,
        ne.MaxDataRate,
        ne.PortCount,
        ne.FirewallCapabilities,
        d.DeviceImagePath;
END
GO

CREATE PROCEDURE GetAllNetworkingEquipmentDetails
AS
BEGIN
    SELECT
        ne.NetworkingEquipmentID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ne.SupportsVPN,
        ne.MaxDataRate,
        ne.PortCount,
        ne.FirewallCapabilities,
        d.DeviceImagePath,
        SignalTypes = STRING_AGG(st.SignalTypeName, ', ') WITHIN GROUP (ORDER BY st.SignalTypeName ASC)
    FROM
        NetworkingEquipment ne
        INNER JOIN Devices d ON ne.DeviceID = d.DeviceID
        INNER JOIN OperatingSystems os ON ne.OSID = os.OSID
        INNER JOIN Brands b ON d.BrandID = b.BrandID
        INNER JOIN DeviceSignalTypes dst ON d.DeviceID = dst.DeviceID
        INNER JOIN SignalTypes st ON dst.SignalTypeID = st.SignalTypeID
    GROUP BY
        ne.NetworkingEquipmentID,
        d.DeviceID,
        b.BrandName,
        d.DeviceModel,
        d.DeviceIsSecure,
        os.OSVersion,
        os.OSIsSecure,
        os.KnownVulnerabilities,
        ne.SupportsVPN,
        ne.MaxDataRate,
        ne.PortCount,
        ne.FirewallCapabilities,
        d.DeviceImagePath;
END
GO
--------------------------------------------------------------------------






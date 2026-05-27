CREATE DATABASE ColdChain_Logistics_ESG;
GO

USE ColdChain_Logistics_ESG;
GO

CREATE TABLE Raw_Fleet_Activity (
    TripID INT IDENTITY(1,1) PRIMARY KEY,
    VehicleID VARCHAR(20),
    DeliveryDate DATE,
    MilesDriven INT,
    GallonsDiesel NUMERIC(8,2),
    CargoWeightTons NUMERIC(5,2)
);
GO
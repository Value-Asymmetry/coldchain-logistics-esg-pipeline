USE ColdChain_Logistics_ESG;
GO

-- =======================================================================
-- PART 1: The EPA Regulatory Reference Table
-- =======================================================================
CREATE TABLE Ref_EPA_Emission_Factors (
    FactorID INT IDENTITY(1,1) PRIMARY KEY,
    FuelType VARCHAR(50),
    Pollutant VARCHAR(50),
    FactorValue NUMERIC(10,4), 
    Unit VARCHAR(50)
);
GO

-- Insert standard EPA mass-balance factors for Diesel
INSERT INTO Ref_EPA_Emission_Factors (FuelType, Pollutant, FactorValue, Unit)
VALUES 
('Diesel', 'CO2e', 22.4600, 'lbs_per_gallon'),
('Diesel', 'NOx', 0.1320, 'lbs_per_gallon');
GO

-- =======================================================================
-- PART 2: Injecting Mock Fleet Data
-- =======================================================================
INSERT INTO Raw_Fleet_Activity (VehicleID, DeliveryDate, MilesDriven, GallonsDiesel, CargoWeightTons)
VALUES 
('TRK-014', '2026-05-01', 450, 65.50, 22.5), -- Heavy long-haul load
('TRK-014', '2026-05-02', 450, 58.20, 0.0),  -- Deadheading (empty return trip)
('TRK-033', '2026-05-01', 120, 15.00, 10.2), -- Short local route
('TRK-033', '2026-05-02', 85,  12.50, 18.0), -- Heavy local route
('TRK-099', '2026-05-01', 600, 85.00, 20.0); -- Regional haul
GO
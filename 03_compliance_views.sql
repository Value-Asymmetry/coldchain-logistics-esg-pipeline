USE ColdChain_Logistics_ESG;
GO

CREATE VIEW v_Fact_Fleet_Emissions AS
SELECT 
    r.TripID,
    r.VehicleID,
    r.DeliveryDate,
    r.MilesDriven,
    r.GallonsDiesel,
    r.CargoWeightTons,
    
    (r.GallonsDiesel * e.FactorValue) AS Total_CO2e_lbs,

    CAST(
        ((r.GallonsDiesel * e.FactorValue * 453.592) / 
        NULLIF((r.MilesDriven * r.CargoWeightTons), 0)) 
    AS NUMERIC(10,2)) AS Intensity_g_CO2e_per_TonMile

FROM Raw_Fleet_Activity r
INNER JOIN Ref_EPA_Emission_Factors e 
    ON e.FuelType = 'Diesel' AND e.Pollutant = 'CO2e';
GO
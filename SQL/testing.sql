-- Inspection Count VS Years
SELECT COUNT(Inspection_ID) as "Inspection Count", d.Inspection_Year as "Year" FROM [dbo].[InspectionFact] i
JOIN [dbo].[DimDate] d on d.Date_Sk = i.date_sk
GROUP BY d.Inspection_Year;

-- Inspection results VS Years
SELECT COUNT(*) as "Result Count", i.Inspection_Result as "Result", d.Inspection_Year FROM [dbo].[InspectionFact] i
JOIN [dbo].[DimDate] d on d.Date_Sk = i.date_sk
GROUP BY d.Inspection_Year, i.Inspection_Result
ORDER by d.Inspection_Year;

-- Inspection Result vs Location (TX)
SELECT d.Latitude, d.Longitude, t.Inspection_Type
FROM [dbo].[InspectionFact] i
JOIN [dbo].[AddressDim] d ON i.Address_Sk = d.Address_Sk
JOIN [dbo].[DimInspectionType] t on t.InspectionTypeID_Sk = i.InspectionTypeID_Sk
WHERE d.[State] = 'TX';

-- Inspection Result vs Location (IL)
SELECT d.Latitude, d.Longitude, t.Inspection_Type
FROM [dbo].[InspectionFact] i
JOIN [dbo].[AddressDim] d ON i.Address_Sk = d.Address_Sk
JOIN [dbo].[DimInspectionType] t on t.InspectionTypeID_Sk = i.InspectionTypeID_Sk
WHERE d.[State] = 'IL';

--
SELECT TOP 10 f.DBA_Name, i.Total_Violation_Score FROM [dbo].[InspectionFact] i
JOIN [dbo].[FacilityDim] f ON f.Facility_Sk = i.Facility_Sk
ORDER BY i.Total_Violation_Score DESC

--
SELECT COUNT(*) as "Result Count", i.Inspection_Result as "Result", d.Facility_Type FROM [dbo].[InspectionFact] i
JOIN [dbo].[FacilityDim] d on d.Facility_Sk = i.Facility_Sk
GROUP BY d.Facility_Type, i.Inspection_Result

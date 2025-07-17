SELECT
  ps.PatientId
  ,ps.Hospital
  ,ps.Ward
  ,ps.Ethnicity
  ,DATEADD (WEEK, -2, ps.AdmittedDate) AS ReminderDate
  ,ps.AdmittedDate 
  ,ps.DischargeDate
  ,DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
  ,ps.Tariff
FROM
  PatientStay AS ps
WHERE ps.Hospital IN ('kingston','PRUH')
  AND ps.Ward LIKE '%surgery'
  AND ps.AdmittedDate BETWEEN '2024-02-27' AND '2024-03-01'
  AND ps.tariff > 5
ORDER BY 
    ps.AdmittedDate DESC, 
    ps.PatientId DESC

SELECT
  ps.hospital
  ,ps.Ward
  ,COUNT(*) AS NumberOfPatients
  ,SUM (ps.tariff) AS TotalTariff
  ,AVG (ps.tariff) AS AvgTariff
FROM
  PatientStay AS ps
GROUP BY ps.Hospital
    , ps.Ward
ORDER BY
    NumberOfPatients DESC

SELECT
  *
FROM
  DimHospitalBad
SELECT
  ps.PatientId
  ,ps.AdmittedDate
  ,ps.Hospital
  ,H.Hospital
  ,h.HospitalSize
FROM
  patientStay ps LEFT JOIN DimHospitalBad h ON ps.Hospital = h.Hospital

SELECT
  ps.PatientId 
  ,ps.AdmittedDate
  ,h.Hospital 
  ,h.HospitalSize
FROM
  PatientStay ps
  LEFT JOIN DimHospitalBad h ON ps.Hospital = h.Hospital

  
SELECT 
      ps.PatientId
    , ps.Hospital
    , PS.Ward
    , PS.Ethnicity
    , DATEADD (WEEK, -2, ps.AdmittedDate) AS ReminderDate
    , ps.AdmittedDate 
    , ps.DischargeDate
    , DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
    , ps.Tariff
FROM PatientStay AS ps
WHERE ps.Hospital IN ('kingston','PRUH')
AND ps.Ward LIKE '%surgery'
ORDER BY 
    ps.AdmittedDate DESC, 
    ps.PatientId DESC


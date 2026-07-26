/*

Use this file to hold scripts that will be added to the database during the update process. 

Add to Website Update Console App

*/
  
ALTER view [dbo].[quoteEstimateDateQry] as
SELECT d.[estimateDateId]
      ,d.[quoteId]
      ,d.[dateTime]
      ,d.[typeOfEstimate]
      ,d.[estimatorId]
      ,d.[estimateJson]
      ,(case when d.[estimatorId] = 0 then 'Estimator not set' else 'Estimator: ' +  e.empFirstName + ' ' + e.empLastName end) as estimatorName
  FROM [quoteEstimateDateTbl] d
  left join EmpTbl e on d.estimatorId = e.empID
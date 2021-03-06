/****** Script for SelectTopNRows command from SSMS  **/

SELECT [NCTId], 
    COUNT(*) AS CNT
FROM [ClinicalTrials].[dbo].[IdentificationModule]
GROUP BY [NCTId]
HAVING COUNT(*) > 1;
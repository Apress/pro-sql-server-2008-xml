USE AdventureWorks;
GO

SELECT Resume.query('declare default element namespace
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";
  for $i in (/Resume/Employment)
  where ($i/Emp.JobTitle ne "Machinist")
  return ($i/Emp.JobTitle)')
FROM HumanResources.JobCandidate
WHERE JobCandidateId = 1;
GO
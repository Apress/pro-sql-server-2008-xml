USE AdventureWorks;
GO

SELECT Resume.query('declare default element namespace
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";
  for $i in (/Resume)
  let $j := $i/Employment
  return ($j/Emp.JobTitle)')
FROM HumanResources.JobCandidate
WHERE JobCandidateId = 1;
GO
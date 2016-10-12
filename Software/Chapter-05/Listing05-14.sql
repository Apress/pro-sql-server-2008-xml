USE AdventureWorks;
GO

SELECT Resume.query('declare default element namespace
  "http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/~CCC
    Resume";
  for $i in (/Resume/Employment)
  let $j := ($i/Emp.JobTitle)
  order by fn:string($j) descending
  return ($j)')
FROM HumanResources.JobCandidate
WHERE JobCandidateId = 1;
GO
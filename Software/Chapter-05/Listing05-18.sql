USE AdventureWorks;
GO

SELECT Resume.query ('declare namespace 
  ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";
  for $i in (/ns:Resume/ns:Education)
  return (
    element Education.History
    {
      element Level 
      {
        attribute School { fn:data($i/ns:Edu.School) },
        element Degree { fn:data($i/ns:Edu.Level) },
        element Date { fn:data($i/ns:Edu.EndDate) }
      }
    }
  )')
FROM HumanResources.JobCandidate
WHERE JobCandidateId = 2;
GO
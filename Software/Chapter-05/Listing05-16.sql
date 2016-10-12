USE AdventureWorks;
GO

SELECT Resume.query ('declare namespace
  ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";
<Education.History>
{
  for $i in (/ns:Resume/ns:Education)
  return 
  (
    <Level>
      <Degree>
        { fn:data($i/ns:Edu.Level) }
      </Degree>
      <Date>
        { fn:data($i/ns:Edu.EndDate) }
      </Date>
    </Level>
  ) 
}
</Education.History>')
FROM HumanResources.JobCandidate
WHERE JobCandidateId = 2;
GO
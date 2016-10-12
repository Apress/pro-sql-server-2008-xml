USE AdventureWorks;
GO

CREATE ENDPOINT AdvWorksProductBrowser 
STATE = STARTED 
AS HTTP 
(
  PATH = '/Browser',
  AUTHENTICATION = ( INTEGRATED ), 
  PORTS = ( CLEAR ), 
  SITE = '*',
  CLEAR_PORT = 888
)
FOR SOAP 
(
  WEBMETHOD 'GetProductHierarchy'
  ( 
    NAME = 'AdventureWorks.dbo.p_GetProductHierarchy',
    SCHEMA = STANDARD,
    FORMAT = ROWSETS_ONLY
  ),
  WEBMETHOD 'GetProductPhoto'
  (
    NAME = 'AdventureWorks.dbo.fn_GetProductPhoto',
    SCHEMA = STANDARD,
    FORMAT = ALL_RESULTS
  ),
  WEBMETHOD 'GetHtmlCatalogDescription'
  (
    NAME = 'AdventureWorks.dbo.fn_GetHtmlCatalogDescription',
    SCHEMA = STANDARD,
    FORMAT = ALL_RESULTS
  ),
  BATCHES = DISABLED,
  WSDL = DEFAULT,
  LOGIN_TYPE = WINDOWS,
  DATABASE = 'AdventureWorks'
);
GO
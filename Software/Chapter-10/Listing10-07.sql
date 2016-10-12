USE AdventureWorks;
GO

DECLARE @rss xml;

SET @rss = dbo.fn_GetRemoteXML('http://www.sqlservercentral.com/Xml/Rss/Articles/SQL+Server+2008');

SELECT Col.value('title[1]', 'varchar(200)') AS Title,
	Col.value('link[1]', 'varchar(200)') AS Link,
	Col.value('description[1]', 'varchar(800)') AS [Description],
	Col.value('language[1]', 'varchar(20)') AS Lang,
	Col.value('ttl[1]', 'int') AS TTL,
	Col.value('managingEditor[1]', 'varchar(100)') AS ManagingEditor
FROM @rss.nodes('/rss/channel') AS Feed(Col)

SELECT Col.value('title[1]', 'varchar(200)') AS Title,
	Col.value('description[1]', 'varchar(800)') AS [Description],
	Col.value('guid[1]', 'varchar(200)') AS [GUID],
	Col.value('pubDate[1]', 'datetime') AS [PubDate],
	Col.value('link[1]', 'varchar(200)') AS [Link]
FROM @rss.nodes('/rss/channel/item') FeedItems (Col);
GO
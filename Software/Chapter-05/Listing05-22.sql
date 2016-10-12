DECLARE @x xml;

SET @x = N'<?xml version = "1.0"?>
<music>
  <album name = "Fullmetal Alchemist Complete Best">
    <genre>Rap</genre>
    <song artist="L&apos;arc-en-Ciel">Ready Steady Go</song>
    <song artist="Nana Kitade">Indelible Sin</song>
    <song artist="Yellow Generation">To the Other Side of the Door</song>
  </album>
</music>';

SET @x.modify ('replace value of 
  (/music/album[ @name = "Fullmetal Alchemist Complete Best" ]/genre/text())[1]
with 
  "Anime &amp; Manga"');

SELECT @x;
GO      
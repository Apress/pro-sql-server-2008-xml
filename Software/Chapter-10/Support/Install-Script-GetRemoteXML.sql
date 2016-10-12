USE [AdventureWorks]
GO

/****** Object:  SqlAssembly [GetRemoteXML]    Script Date: 01/06/2008 02:16:32 ******/
CREATE ASSEMBLY [GetRemoteXML]
AUTHORIZATION [dbo]
FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C010300FB7F80470000000000000000E0000E210B0108000010000000200000000000007E2E0000002000000040000000004000002000000010000004000000000000000400000000000000008000000010000000000000030040050000100000100000000010000010000000000000100000000000000000000000242E000057000000004000008003000000000000000000000000000000000000006000000C0000008C2D00001C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E74657874000000840E0000002000000010000000100000000000000000000000000000200000602E7273726300000080030000004000000010000000200000000000000000000000000000400000402E72656C6F6300000C00000000600000001000000030000000000000000000000000000040000042000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000602E0000000000004800000002000500602200002C0B0000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000013300200350000000100001100730F00000A0A72010000700F00281000000A281100000A0B06076F1200000A0C08731300000A0D09731400000A13042B0011042A00000013300200270000000200001100730F00000A0A060F00281000000A6F1200000A0B07731300000A0C08731400000A0D2B00092A00133003003E0000000300001100730F00000A0A72A00000700B72EA0000700F00281000000A07281500000A0C06086F1200000A0D09731300000A13041104731400000A13052B0011052A0000133002002F0000000400001100731600000A0A026F1700000A16FE010C082D0600140A002B0F0006026F1800000A6F1900000A0000060B2B00072A00133002002C0000000400001100731600000A0A026F1700000A0C082D110006026F1800000A6F1900000A00002B0400140A00060B2B00072A133002002D0000000500001100731600000A0A281A00000A026F1B00000A6F1C00000A0B07731300000A0C06086F1D00000A00060D2B00092A000000133002002F0000000600001100281A00000A026F1E00000A6F1C00000A0A06731300000A0B07731F00000A0C08732000000A0D0913042B0011042A0013300200260000000700001100281A00000A026F1E00000A6F1C00000A0A06731300000A0B07731400000A0C080D2B00092A0000133001001500000008000011000228060000060A0628080000060B170C2B00082A1E02282100000A2A00000042534A4201000100000000000C00000076322E302E35303732370000000005006C00000064030000237E0000D00300004804000023537472696E67730000000018080000C401000023555300DC090000100000002347554944000000EC0900004001000023426C6F620000000000000002000001471502000900000000FA013300160000010000001B000000020000000A00000009000000210000000F00000008000000010000000400000000000A0001000000000006004E0047000A00760061000A007D0061000E00C800BD0006006D015B010600A50186010600B9015B010600D2015B010600ED015B01060008025B01060021025B0106003A025B01060059025B01060076025B010600A0028D023F00B40200000600E302C30206000303C3020A0049032E031200720367030600860347000600AB03A1030600B803A1030E00DB03BD0006000304F7030E002504BD000E003A04BD000000000001000000000001000100010010001B003000050001000100502000000000960087000A00010094200000000096009B000A000200C820000000009600AB000A0003001421000000009100D400110004005021000000009100E600110005008821000000009100FE0011000600C42100000000910017011800070000220000000091002F0118000800342200000000960048011F0009005522000000008618550125000A00000001005E0300000100BF0300000100C30300000100CC0300000100CC0300000100CC03000001001E04000001001E0400000100CC03290055012900310055012E00390055012900410055012900490055012900510055012900590055012900610055012900690055012900710055012900790055013300890055013900910055012500990055012500A1005501250019007C034300A9008D034700A10094034D00B10055015300110055015900A9008D0376002100550125001100D0038A001100E5038E002100F2039300C9000C04A10011007C034300C90015044D002100F2035900D1002D044300D90055015900110055019300090055012500200073003E002E003300F3002E003B0005012E00630018012E001300D1002E002300D1002E002B00D7002E006B0021012E004300D1002E004B00D1002E005300F3002E005B000F01400073003E00600073003E00200173003E005F006B007D009900A600B100BE00C90004800000010000006F0BD50F0000000000002103000002000000000000000000000001003E000000000002000000000000000000000001005500000000000200000000000000000000000100BD0000000000020000000000000000000000010047000000000000000000003C4D6F64756C653E0047657452656D6F7465584D4C2E646C6C0055736572446566696E656446756E6374696F6E73004170726573732E53616D706C65006D73636F726C69620053797374656D004F626A6563740053797374656D2E446174610053797374656D2E446174612E53716C54797065730053716C586D6C0053716C537472696E6700666E5F5961686F6F47656F636F64655265737400666E5F47657452656D6F7465584D4C00666E5F65426179536561726368524553540053797374656D2E586D6C00586D6C446F63756D656E74004361737453716C586D6C5F586D6C446F63004361737453716C586D6C546F586D6C446F63756D656E74004361737453716C586D6C546F586D6C446F63756D656E74320043617374586D6C446F63756D656E74546F53716C586D6C0043617374586D6C446F63756D656E74546F53716C586D6C3200666E5F47657453716C586D6C002E63746F720053797374656D2E5265666C656374696F6E00417373656D626C7956657273696F6E4174747269627574650053797374656D2E52756E74696D652E496E7465726F70536572766963657300436F6D56697369626C6541747472696275746500417373656D626C7943756C7475726541747472696275746500417373656D626C7954726164656D61726B41747472696275746500417373656D626C79436F7079726967687441747472696275746500417373656D626C7950726F6475637441747472696275746500417373656D626C79436F6D70616E7941747472696275746500417373656D626C79436F6E66696775726174696F6E41747472696275746500417373656D626C794465736372697074696F6E41747472696275746500417373656D626C795469746C654174747269627574650053797374656D2E446961676E6F73746963730044656275676761626C6541747472696275746500446562756767696E674D6F6465730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300436F6D70696C6174696F6E52656C61786174696F6E734174747269627574650052756E74696D65436F6D7061746962696C6974794174747269627574650047657452656D6F7465584D4C004D6963726F736F66742E53716C5365727665722E5365727665720053716C46756E6374696F6E417474726962757465006C6F636174696F6E0053797374656D2E4E657400576562436C69656E74006765745F56616C756500537472696E6700466F726D617400446F776E6C6F6164446174610053797374656D2E494F004D656D6F727953747265616D0053747265616D00757269006B6579776F72647300786D6C006765745F49734E756C6C00586D6C52656164657200437265617465526561646572004C6F61640053797374656D2E5465787400456E636F64696E67006765745F5554463800476574427974657300786D6C646F6300586D6C4E6F6465006765745F4F75746572586D6C00586D6C546578745265616465720000809D68007400740070003A002F002F006C006F00630061006C002E007900610068006F006F0061007000690073002E0063006F006D002F004D0061007000730053006500720076006900630065002F00560031002F00670065006F0063006F00640065003F00610070007000690064003D005900610068006F006F00440065006D006F0026006C006F0063006100740069006F006E003D007B0030007D0000494100700072006500730073006100640066002D0032003100640066002D0034003500320061002D0039006500650034002D00620036003900310033003500660033003200630039000180D568007400740070003A002F002F006F00700065006E002E006100700069002E0065006200610079002E0063006F006D002F00730068006F007000700069006E0067003F00630061006C006C006E0061006D0065003D00460069006E0064004900740065006D0073002600510075006500720079004B006500790077006F007200640073003D007B0030007D002600610070007000690064003D007B0031007D002600760065007200730069006F006E003D0035003100370026004D006100780045006E00740072006900650073003D0035003000000000004E6D42207C06964DB27DA9DBCCE2B8F30008B77A5C561934E0890600011209110D060001121112090600011209121105000108120903200001042001010E0420010102052001011141042001010804010000000320000E0500020E0E1C0520011D050E052001011D0505200101125D0B070512510E1D05125912090A070412511D05125912090600030E0E1C1C0C070612510E0E1D0512591209032000020420001261052001011261070703121112110204000012650A070412111D05125912110C07051D051259126D120912090A07041D0512591209120907070312111209080501000000001B010016436F7079726967687420C2A920486F6D65203230303700001101000C47657452656D6F7465584D4C000009010004486F6D6500000801000701000000000801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F77730100000000FB7F804700000000020000007B000000A82D0000A81D000052534453E558DF04ADAC824C8C1A5BDA8F3AC62803000000433A5C446F63756D656E747320616E642053657474696E67735C416C6C2055736572735C446F63756D656E74735C47657452656D6F7465584D4C5C47657452656D6F7465584D4C5C6F626A5C44656275675C47657452656D6F7465584D4C2E70646200004C2E000000000000000000006E2E0000002000000000000000000000000000000000000000000000602E00000000000000000000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF2500204000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100100000001800008000000000000000000000000000000100010000003000008000000000000000000000000000000100000000004800000058400000280300000000000000000000280334000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE0000010000000100D50F6F0B00000100D50F6F0B3F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B00488020000010053007400720069006E006700460069006C00650049006E0066006F0000006402000001003000300030003000300034006200300000002C000500010043006F006D00700061006E0079004E0061006D0065000000000048006F006D0065000000000044000D000100460069006C0065004400650073006300720069007000740069006F006E0000000000470065007400520065006D006F007400650058004D004C00000000003C000E000100460069006C006500560065007200730069006F006E000000000031002E0030002E0032003900320037002E003400300035003300000044001100010049006E007400650072006E0061006C004E0061006D0065000000470065007400520065006D006F007400650058004D004C002E0064006C006C00000000005000160001004C006500670061006C0043006F007000790072006900670068007400000043006F0070007900720069006700680074002000A900200048006F006D0065002000320030003000370000004C00110001004F0072006900670069006E0061006C00460069006C0065006E0061006D0065000000470065007400520065006D006F007400650058004D004C002E0064006C006C00000000003C000D000100500072006F0064007500630074004E0061006D00650000000000470065007400520065006D006F007400650058004D004C000000000040000E000100500072006F006400750063007400560065007200730069006F006E00000031002E0030002E0032003900320037002E003400300035003300000044000E00010041007300730065006D0062006C0079002000560065007200730069006F006E00000031002E0030002E0032003900320037002E00340030003500330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000C000000803E000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
WITH PERMISSION_SET = EXTERNAL_ACCESS
GO

/****** Object:  UserDefinedFunction [dbo].[fn_eBaySearchREST]    Script Date: 01/06/2008 02:16:49 ******/
CREATE FUNCTION [dbo].[fn_eBaySearchREST](@keywords [nvarchar](4000))
RETURNS [xml] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [GetRemoteXML].[Apress.Sample.UserDefinedFunctions].[fn_eBaySearchREST]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetRemoteXML]    Script Date: 01/06/2008 02:16:50 ******/
CREATE FUNCTION [dbo].[fn_GetRemoteXML](@uri [nvarchar](4000))
RETURNS [xml] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [GetRemoteXML].[Apress.Sample.UserDefinedFunctions].[fn_GetRemoteXML]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GetSqlXml]    Script Date: 01/06/2008 02:16:51 ******/
CREATE FUNCTION [dbo].[fn_GetSqlXml](@xml [xml])
RETURNS [int] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [GetRemoteXML].[Apress.Sample.UserDefinedFunctions].[fn_GetSqlXml]
GO

/****** Object:  UserDefinedFunction [dbo].[fn_YahooGeocodeRest]    Script Date: 01/06/2008 02:16:52 ******/
CREATE FUNCTION [dbo].[fn_YahooGeocodeRest](@location [nvarchar](4000))
RETURNS [xml] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [GetRemoteXML].[Apress.Sample.UserDefinedFunctions].[fn_YahooGeocodeRest]
GO

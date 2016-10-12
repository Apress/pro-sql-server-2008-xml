DECLARE @eContract nvarchar(max);
SET @eContract = N'<?xml version="1.0" encoding="UTF-16"?>
<!DOCTYPE contract 
SYSTEM "c:\eContracts-Reference.dtd">

<contract xmlns="urn:oasis:names:tc:eContracts:1:0" 
	xmlns:dc="http://purl.org/dc/elements/1.1/">
	<metadata>
		<dc:creator>The Law Firm of Dewey, Cheatham, and Howe</dc:creator>
		<dc:date>2007-12-01</dc:date>
	</metadata>
	<title>
		<text>Sample AdventureWorks Bicycle Sales Contract</text>
	</title>
	<contract-front>
		<date-block>
			<date>
				Agreement dated: <em>2007-12-01</em>
			</date>
		</date-block>
		<parties>
			<party id="Seller">
				<person-record>
					<name>AdventureWorks Bicycles, Inc.</name>, herafter referred to as "Seller"
				</person-record>
			</party>
			<party id="Buyer">
				<person-record>
					<name>XYZ Bike Sales and Repair</name>, hereafter referred to as "Buyer"
				</person-record>
			</party>
		</parties>
	</contract-front>
	<body>
		<block number-type="upperalpha">
			<item number="A">
				<title>
					<text>Identities of the Parties</text>
				</title>
				<block>
					<text>Seller, <em>AdventureWorks Bicycles, Inc.,</em> whose primary business address is 15600 Redmond Way, in the city of Redmond, state of Washington, is in the business of manufacturing, selling, and servicing bicycles and bicycle-related goods and service. Buyer, <em>XYZ Bike Sales and Repair,</em> whose business address is 42 Crescent Avenue, in the city of Newark, state of New Jersey, is in the business of retail sales of bicycles and bicycle service.</text>
				</block>
			</item>
			<item number="B">
				<block>
					<text>
						Seller agrees to transfer and deliver to Buyer, on or before the 3rd day of March, 2008, the below-described goods in the quantities specified:
						Thirty (30) Red Road-150, 44 inch bicycles, catalog item number BK-R93R-44
						Twenty-three (23) Red Road-450, 52 inch bicycles, catalog item number BK-R68R-52
						Nineteen (19) Black Road-650, 60 inch bicycles, catalog item number BK-R50B-60
						Thirty-six (36) Silver Mountain-200, 46 inch bicycles, catalog item number BK-M68S-46
				    </text>
				</block>
			</item>
			<item number="C">
				<block>
					<text>
						Buyer agrees to accept the goods and pay for them according to the terms further set out in the addendum to this contract.
					</text>
				</block>
			</item>
			<item number="D">
				<block>
					<text>
					Until received by Buyer, all risk of loss to the above-described goods is borne by Seller.
					
					Seller warrants that the goods are free from any and all security interests, liens, and encumbrances.
				</text>
				</block>
			</item>
		</block>
	</body>
</contract>';

select dbo.fn_ValidateDTD(@eContract);
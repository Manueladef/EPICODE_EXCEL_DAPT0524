/*Interrogare e filtrare le tabelle
Connettiti al db aziendale o esegui il restore del db
Esplora la tabelle dei prodotti (DimProduct) */

SELECT count(*)
FROM dimproduct;

/*Interroga la tabella dei prodotti (DimProduct) ed esponi in output i campi ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag.
Il result set deve essere parlante per cui assegna un alias se lo ritieni opportuno.*/

SELECT 
ProductKey
,ProductAlternateKey
,EnglishProductName
,Color 
,StandardCost
,FinishedGoodsFlag
FROM dimproduct;

/*Partendo dalla query scritta nel passaggio precedente,
esponi in output i soli prodotti finiti cioè quelli per cui il campo FinishedGoodsFlag è uguale a 1.*/

SELECT 
ProductKey
,ProductAlternateKey
,EnglishProductName
,Color 
,StandardCost
,FinishedGoodsFlag
FROM dimproduct
WHERE FinishedGoodsFlag=1;

/*Scrivi una nuova query al fine di esporre in output i prodotti il cui codice modello (ProductAlternateKey) comincia con FR oppure BK.
Il result set deve contenere il codice prodotto (ProductKey), il modello, il nome del prodotto, il costo standard (StandardCost) e il prezzo di listino (ListPrice).*/

SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    ModelName,
    StandardCost,
    ListPrice
FROM
    dimproduct
WHERE
	ProductAlternateKey like 'FR%'
OR  ProductAlternateKey like 'BK%';
    
/*Arricchisci il risultato della query scritta nel passaggio precedente 
del Markup applicato dall’azienda (ListPrice - StandardCost)*/

SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    ModelName,
    StandardCost,
    ListPrice,
    ListPrice - StandardCost AS 'Markup'
FROM
    dimproduct
WHERE
	ProductAlternateKey like 'FR%'
OR  ProductAlternateKey like 'BK%';

/*Scrivi un’altra query al fine di esporre l’elenco dei prodotti finiti il cui prezzo di listino 
è compreso tra 1000 e 2000.*/

SELECT 
	ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    ModelName,
    StandardCost,
    ListPrice,
    ListPrice -StandardCost AS 'Markup',
    FinishedGoodsFlag AS 'Prod finiti'
FROM
    dimproduct
WHERE
	FinishedGoodsFlag=1
AND ListPrice between 1000 AND 2000
ORDER BY ListPrice asc; 

/*Esplora la tabella degli impiegati aziendali (DimEmployee)
Esponi, interrogando la tabella degli impiegati aziendali, l’elenco dei soli agenti.
Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1.*/

SELECT 
    EmployeeKey,
    ParentEmployeeKey,
    LastName,
    Title,
    HireDate,
    EmailAddress,
    Phone,
    SalesPersonFlag
FROM
    dimemployee
WHERE
    SalesPersonFlag = 1;
    
/*Interroga la tabella delle vendite (FactResellerSales). Esponi in output l’elenco delle transazioni
registrate a partire dal 1 gennaio 2020 dei soli codici prodotto: 597, 598, 477, 214.*/

SELECT 
	SalesOrderNumber,
    SalesOrderLineNumber,
    ProductKey,
    UnitPrice,
    SalesAmount,
	OrderDate
FROM 
	factresellersales
WHERE ProductKey in (597,598,477,214) 
AND OrderDate>= '2020-01-01'
ORDER BY OrderDate asc;

/*Calcola per ciascuna transazione il profitto (SalesAmount - TotalProductCost).*/

SELECT 
	SalesOrderNumber,
    SalesOrderLineNumber,
    ProductKey,
    UnitPrice,
    SalesAmount,
    TotalProductCost,
	OrderDate,
    SalesAmount-TotalProductCost AS 'Profit'
FROM 
	factresellersales
WHERE ProductKey in (597,598,477,214) 
AND OrderDate>= '2020-01-01'
ORDER BY OrderDate asc;




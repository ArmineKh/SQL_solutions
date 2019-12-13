-- https://en.wikibooks.org/wiki/SQL_Exercises/Planet_Express
-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
SELECT * FROM Client
JOIN Packages ON Client.AccountNumber = Packages.Recipient
WHERE Package.Weight = 1.5;

-- 7.2 What is the total weight of all the packages that he sent?
SELECT SUM(Package.Weight) FROM Packages
WHERE Package.Sender =
(SELECT Client.AccountNumber FROM Client
JOIN Packages ON Client.AccountNumber = Packages.Recipient
WHERE Package.Weight = 1.5);

-- 10.1 Join table PEOPLE and ADDRESS, but keep only one address information for each person (we don't mind which record we take for each person).
    -- i.e., the joined table should have the same number of rows as table PEOPLE
SELECT PEOPLE.id, PEOPLE.Name, ADDRESS.address FROM PEOPLE
LEFT JOIN (SELECT id, address FROM ADDRESS GROUP BY id)
  ON PEOPLE.id = ADDRESS.id
-- 10.2 Join table PEOPLE and ADDRESS, but ONLY keep the LATEST address information for each person.
    -- i.e., the joined table should have the same number of rows as table PEOPLE
    SELECT PEOPLE.id, PEOPLE.Name, ADDRESS.address FROM PEOPLE
    LEFT JOIN (SELECT id, address, updatedate FROM ADDRESS GROUP BY updatedate)
      ON PEOPLE.id = ADDRESS.id

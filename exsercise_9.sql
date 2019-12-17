-- 9.1 give the total number of recordings in this table
SELECT count(*) FROM cran_logs_2015_01_01;

-- 9.2 the number of packages listed in this table?
SELECT count(DISTINCT package) FROM cran_logs_2015_01_01;

-- 9.3 How many times the package "Rcpp" was downloaded?
SELECT count(*) FROM cran_logs_2015_01_01
WHERE package = "Rcpp";

-- 9.4 How many recordings are from China ("CN")?
SELECT count(*) FROM cran_logs_2015_01_01
WHERE country = "CN";

-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
SELECT package, COUNT(*) FROM cran_logs_2015_01_01
GROUP BY package
ORDER BY 2 DESC;

-- 9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM

-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
SELECT COUNT(*) FROM cran_logs_2015_01_01
WHERE country = 'CN' OR country = 'JP' OR country = 'SG';

-- 9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
SELECT TEMP.country FROM
    (SELECT country, COUNT(*) AS downloads FROM cran_logs_2015_01_01
    GROUP BY country) AS TEMP
WHERE TEMP.downloads > (SELECT COUNT(*)  FROM cran_logs_2015_01_01
                        WHERE  country = 'CN');

-- 9.9 Print the average length of the package name of all the UNIQUE packages
SELECT AVG(LENGTH(temp.packages))
FROM (SELECT DISTINCT package as packages FROM cran_logs_2015_01_01);

-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
SELECT package, count(*) FROM
(SELECT package, count(*) FROM cran_logs_2015_01_01
GROUP By package
ORDER By Count(*) desc
LIMIT 2)
ORDER By count(*) ASC Limit 1;

-- 9.11 Print the name of the package whose download count is bigger than 1000.
SELECT package  FROM cran_logs_2015_01_01
GROUP BY package HAVING count(*)> 1000;

-- 9.12 The field "r_os" is the operating system of the users.
    -- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
SELECT SUBSTRING(r_os, 1, 5) FROM cran_logs_2015_01_01
GROUP BY SUBSTRING(r_os, 1, 5);

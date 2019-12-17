-- https://en.wikibooks.org/wiki/SQL_Exercises/Scientists
-- 6.1 List all the scientists' names, their projects' names,
    -- and the hours worked by that scientist on each project,
    -- in alphabetical order of project name, then scientist name.
SELECT Scientists.Name, Projects.Name, sum(Projects.Hours) FROM Scientist
JOIN AssignedTo ON AssignedTo.Scientist = Scientists.SSN
JOIN Projects ON Projects.Code = AssignedTo.Project
ORDER By Projects.Name ASC, Scientists.Name ASC;

-- 6.2 Select the project names which are not assigned yet
SELECT Name FROM Projects
WHERE Code NOT In (SELECT Project FROM AssignedTo);

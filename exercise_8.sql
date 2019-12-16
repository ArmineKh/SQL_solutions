-- 8.1 Obtain the names of all physicians that have performed a medical procedure they have never been certified to perform.
 SELECT Physician.Names FROM physician
 JOIN Trained_In On Physician.EmployeeID = Trained_In.Physician
 WHERE Physician.EmployeeID = Undergoes.physician AND not EXISTS (
 SELECT Trained_In.Physician FROM Trained_In
JOIN Physician on  Physician.EmployeeID = Trained_In.Physician
);

-- 8.2 Same as the previous query, but include the following information in the results: Physician name, name of procedure, date when the procedure was carried out, name of the patient the procedure was carried out on.
SELECT Physician.Names, procedure.name, undergone.date, patient.name FROM physician
JOIN Trained_In On Physician.EmployeeID = Trained_In.Physician
JOIN Patient on Patient.PCP = Procedure.Code
WHERE Physician.EmployeeID = Undergoes.physician AND not EXISTS (
SELECT Trained_In.Physician FROM Trained_In
JOIN Physician on  Physician.EmployeeID = Trained_In.Physician
);

-- 8.3 Obtain the names of all physicians that have performed a medical procedure that they are certified to perform, but such that the procedure was done at a date (Undergoes.Date) after the physician's certification expired (Trained_In.CertificationExpires).
SELECT Physician.Names FROM physician
JOIN Trained_In On Physician.EmployeeID = Trained_In.Physician
JOIN Undergones on Undergones.physician = Physician.EmployeeID
WHERE Physician.EmployeeID = Undergoes.physician AND EXISTS (
SELECT Trained_In.Physician FROM Trained_In
JOIN Physician on  Physician.EmployeeID = Trained_In.Physician
WHERE Trained_In.CertificationExpires < Procedure.Date
);
-- 8.4 Same as the previous query, but include the following information in the results: Physician name, name of procedure,
--date when the procedure was carried out, name of the patient the procedure was carried out on, and date when the certification expired.
SELECT Physician.Names, Procedure.Name, Undergoes.Date, Patient.Name, Trained_In.CertificationExpires FROM physician
JOIN Trained_In On Physician.EmployeeID = Trained_In.Physician
JOIN Undergones on Undergones.physician = Physician.EmployeeID
WHERE Physician.EmployeeID = Undergoes.physician AND EXISTS (
SELECT Trained_In.Physician FROM Trained_In
JOIN Physician on  Physician.EmployeeID = Trained_In.Physician
WHERE Trained_In.CertificationExpires < Procedure.Date
);

-- 8.5 Obtain the information for appointments where a patient met with a physician other than his/her primary care physician. Show the following information: Patient name, physician name, nurse name (if any), start and end time of appointment, examination room, and the name of the patient's primary care physician.
SELECT  Patient.Name, Physician.name, Nurse.name, Undergoes.Date, Stay.start, Stay.end, Stay.room FROM Patient
JOIN Physician ON Physician.EmployeeID = Patient.PCP
JOIN Undergoes ON Undergoes.patient = Patient.SSN
JOIN Stay ON Stay.patient = Patient.SSN
JOIN Room ON Room.Number = Stay.room
JOIN Nurse ON Nurse.EmployeeID = Undergones.AssistingNurse;

-- 8.6 The Patient field in Undergoes is redundant, since we can obtain it from the Stay table. There are no constraints in force to prevent inconsistencies between these two tables. More specifically, the Undergoes table may include a row where the patient ID does not match the one we would obtain from the Stay table through the Undergoes.Stay foreign key. Select all rows from Undergoes that exhibit this inconsistency.

-- 8.7 Obtain the names of all the nurses who have ever been on call for room 123.
SELECT Nurse.Name FROM Nurse
JOIN On_Call ON Nurse.EmployeeID = On_Call.Nurse
JOIN Block ON On_Call.BlockCode = Block.Code
JOIN Room Room.BlockCode = Block.Code
WHERE Room.Number = 123;

-- 8.8 The hospital has several examination rooms where appointments take place. Obtain the number of appointments that have taken place in each examination room.
SELECT Appointment.ExaminationRoom, Count(Prescribes.Date) FROM Appointment
JOIN Prescribes ON Appointment.AppointmentID = Prescribes.Date
ORDER BY Appointment.ExaminationRoom;

-- 8.9 Obtain the names of all patients (also include, for each patient, the name of the patient's primary care physician), such that \emph{all} the following are true:
    -- The patient has been prescribed some medication by his/her primary care physician.
    -- The patient has undergone a procedure with a cost larger that $5,000
    -- The patient has had at least two appointment where the nurse who prepped the appointment was a registered nurse.
    -- The patient's primary care physician is not the head of any department.

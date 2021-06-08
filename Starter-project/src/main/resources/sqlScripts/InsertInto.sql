-- FAKULTET PODACI

INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (nextval('fakultet_seq'), 'Fakultet tehnickih nauka', 'Novi Sad');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (nextval('fakultet_seq'), 'Prirodno-matematicki fakultet', 'Novi Sad');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (nextval('fakultet_seq'), 'Ekonomski fakultet', 'Beograd');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (nextval('fakultet_seq'), 'Poljoprivredni fakultet', 'Beograd');

-- DEPARTMAN PODACI

INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za industrijsko inzenjerstvo i menadzment', 'IIM', 1);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za arhitekturu i urbanizam', 'AU', 1);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za energetiku, elektroniku i telekomunikacije', 'EET', 1);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za matematiku i informatiku', 'MI', 2);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za biologiju i ekologiju', 'BE', 2);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za geografiju, turizam i hotelijerstvo', 'GTH', 2);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za finansije i racunovodstvo', 'FR', 3);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za trgovinu, marketing i logistiku', 'TML', 3);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman poslovnu informatiku i kvantitativne metode', 'PIKM', 3);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za poljoprivrednu tehniku', 'PT', 4);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za ratarstvo i povrtarstvo', 'RP', 4);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (nextval('departman_seq'), 'Departman za veterinarsku medicinu', 'VM', 4);

-- STATUS PODACI

INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (nextval('status_seq'), 'Osnovne akademske stuje', 'OAS');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (nextval('status_seq'), 'Osnovne strukovne studije', 'OSS');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (nextval('status_seq'), 'Master akademske studije', 'MAS');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (nextval('status_seq'), 'Doktorske studije', 'DS');

-- STUDENT PODACI

INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Marko', 'Markovic', 'IT16/2017', 1, 1);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Ana', 'Bojanic', 'AR28/2018', 2, 2);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Petar', 'Stankovic', 'EE41/2019', 3, 3);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Milica', 'Popovic', 'MI49/2020', 4, 4);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Nikola', 'Babic', 'BI13/2017', 1, 5);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Sofija', 'Maric', 'GT21/2018', 2, 6);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Luka', 'Andric', 'FI33/2019', 3, 7);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Jovana', 'Stanic', 'TT46/2020', 4, 8);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Dejan', 'Krstic', 'PI11/2017', 1, 9);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Katarina', 'Jovic', 'PT51/2018', 2, 10);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Mirko', 'Peric', 'RP268/2019', 3, 11);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Natasa', 'Ivanic', 'VE29/2020', 4, 12);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Tamara', 'Vuletic', 'IT72/2017', 2, 1);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Ivan', 'Knezevic', 'AR45/2018', 3, 2);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Srdjan', 'Tomasevic', 'MI14/2019', 4, 4);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Biljana', 'Drazic', 'BI35/2020', 1, 5);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Milan', 'Savic', 'FI47/2017', 2, 7);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Anastasija', 'Plavsic', 'TT12/2018', 3, 8);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Jovan', 'Zivkovic', 'PT36/2019', 4, 10);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (nextval('student_seq'), 'Valentina', 'Mandic', 'RP20/2020', 1, 11);

-- TEST PODACI

INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (-100, 'TestNaziv', 'TestOznaka');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (-100, 'TestNaziv', 'TestSediste');
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (-100, 'TestNaziv', 'TestOznaka', 1);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (-100, 'TestIme', 'TestPrezime', 'TestBrIndeksa', 1, 1);
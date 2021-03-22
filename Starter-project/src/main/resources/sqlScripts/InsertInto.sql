-- FAKULTET PODACI

INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (1, 'Fakultet tehnickih nauka', 'Novi Sad');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (2, 'Prirodno-matematicki fakultet', 'Novi Sad');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (3, 'Ekonomski fakultet', 'Beograd');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (4, 'Poljoprivredni fakultet', 'Beograd');

-- DEPARTMAN PODACI

INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (1, 'Departman za industrijsko inzenjerstvo i menadzment', 'IIM', 1);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (2, 'Departman za arhitekturu i urbanizam', 'AU', 1);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (3, 'Departman za energetiku, elektroniku i telekomunikacije', 'EET', 1);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (4, 'Departman za matematiku i informatiku', 'MI', 2);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (5, 'Departman za biologiju i ekologiju', 'BE', 2);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (6, 'Departman za geografiju, turizam i hotelijerstvo', 'GTH', 2);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (7, 'Departman za finansije i racunovodstvo', 'FR', 3);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (8, 'Departman za trgovinu, marketing i logistiku', 'TML', 3);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (9, 'Departman poslovnu informatiku i kvantitativne metode', 'PIKM', 3);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (10, 'Departman za poljoprivrednu tehniku', 'PT', 4);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (11, 'Departman za ratarstvo i povrtarstvo', 'RP', 4);
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (12, 'Departman za veterinarsku medicinu', 'VM', 4);

-- STATUS PODACI

INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (1, 'Prvi status', 'S1');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (2, 'Drugi status', 'S2');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (3, 'Treci status', 'S3');
INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (4, 'Cetvrti status', 'S4');

-- STUDENT PODACI

INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (1, 'Marko', 'Markovic', 'IT16/2017', 1, 1);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (2, 'Ana', 'Bojanic', 'AR28/2018', 2, 2);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (3, 'Petar', 'Stankovic', 'EE41/2019', 3, 3);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (4, 'Milica', 'Popovic', 'MI49/2020', 4, 4);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (5, 'Nikola', 'Babic', 'BI13/2017', 1, 5);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (6, 'Sofija', 'Maric', 'GT21/2018', 2, 6);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (7, 'Luka', 'Andric', 'FI33/2019', 3, 7);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (8, 'Jovana', 'Stanic', 'TT46/2020', 4, 8);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (9, 'Dejan', 'Krstic', 'PI11/2017', 1, 9);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (10, 'Katarina', 'Jovic', 'PT51/2018', 2, 10);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (11, 'Mirko', 'Peric', 'RP268/2019', 3, 11);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (12, 'Natasa', 'Ivanic', 'VE29/2020', 4, 12);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (13, 'Tamara', 'Vuletic', 'IT72/2017', 2, 1);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (14, 'Ivan', 'Knezevic', 'AR45/2018', 3, 2);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (15, 'Srdjan', 'Tomasevic', 'MI14/2019', 4, 4);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (16, 'Biljana', 'Drazic', 'BI35/2020', 1, 5);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (17, 'Milan', 'Savic', 'FI47/2017', 2, 7);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (18, 'Anastasija', 'Plavsic', 'TT12/2018', 3, 8);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (19, 'Jovan', 'Zivkovic', 'PT36/2019', 4, 10);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (20, 'Valentina', 'Mandic', 'RP20/2020', 1, 11);

-- TEST PODACI

INSERT INTO "status"("id", "naziv", "oznaka")
VALUES (-100, 'TestNaziv', 'TestOznaka');
INSERT INTO "fakultet"("id", "naziv", "sediste")
VALUES (-100, 'TestNaziv', 'TestSediste');
INSERT INTO "departman"("id", "naziv", "oznaka", "fakultet")
VALUES (-100, 'TestNaziv', 'TestOznaka', 1);
INSERT INTO "student"("id", "ime", "prezime", "broj_indeksa", "status", "departman")
VALUES (-100, 'TestIme', 'TestPrezime', 'TestBrIndeksa', 1, 1);

CREATE TABLE level_100_students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    pin VARCHAR(20)
);

CREATE TABLE level_200_students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    pin VARCHAR(20)
);

CREATE TABLE level_300_students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    pin VARCHAR(20)
);

CREATE TABLE level_400_students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    pin VARCHAR(20)
);


CREATE TABLE biomedical_engineering_courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE agricultural_engineering_courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE food_processing_engineering_courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE computer_engineering_courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE material_sciences_engineering_courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);


INSERT INTO biomedical_engineering_courses (course_name)
VALUES ('Anatomy'), ('Physiology'), ('Biochemistry'), ('Biomechanics');

INSERT INTO agricultural_engineering_courses (course_name)
VALUES ('Agricultural Economics'), ('Soil Mechanics'), ('Crop Physiology'), ('Agro-Industrial Processing');

INSERT INTO food_processing_engineering_courses (course_name)
VALUES ('Food Chemistry'), ('Food Microbiology'), ('Food Engineering Principles'), ('Food Quality Control');

INSERT INTO computer_engineering_courses (course_name)
VALUES ('Introduction to Programming'), ('Data Structures and Algorithms'), ('Computer Networks'), ('Database Systems');

INSERT INTO material_sciences_engineering_courses (course_name)
VALUES ('Materials Science'), ('Materials Characterization'), ('Polymer Engineering'), ('Ceramics and Glasses');


WITH pins AS (
    SELECT 
        student_name,
        'PIN' || LPAD(CAST(ROW_NUMBER() OVER (ORDER BY student_name) AS TEXT), 3, '0') AS pin
    FROM (
        VALUES 
            ('AGYEPONG, Kwesi Asante (MR)'),
            ('ABLORDE, Edem (MR)'),
            ('OYEH, Anim Michael (MR)'),
            ('MENSAH, Joshua Okai (MR)'),
            ('OSMAN, Julius (MR)'),
            ('ASARE, Marvin (MR)'),
            ('SOMUAH, Esinam Peggy (MISS)'),
            ('NYARKO, Herbert Obeng (MR)'),
            ('AMPOMAH, Samuel (MR)'),
            ('ADU-BOAKYE, Stacy Adobea (MISS)'),
            ('APPIAH-SAAH, Betty (MISS)'),
            ('AGYEI, Yaw Opoku Onyina (MR)'),
            ('BAMPOE, Joseph Ohene (MR)'),
            ('NARTERH, Kenneth Amanortey (MR)'),
            ('GIFFAH, Alexander (MR)'),
            ('YEDRU, Joshua Kwame Makafui (MR)'),
            ('WESLEY, Shem Tei (MR)'),
            ('AWUNYO, Princess Diayana Dzigbodi (MISS)'),
            ('VIGBEDOR, Erica Elikem Ami (MISS)'),
            ('STEPHENSON, Stephanas Joel Papa Yaw (MR)'),
            ('OSEI, Hannah Konadu (MISS)'),
            ('DWAMENA, Cyril Osei (MR)'),
            ('ANDERSON, Emmanuel Nana Banyin Kwesi Ayia (MR)'),
            ('KWARTENG, Andrews Twum (MR)'),
            ('ABABIO, Johnzac (MR)'),
            ('FIAVOR, Isaac Sedem (MR)'),
            ('NYADOR, Joshua Kwabena (MR)'),
            ('GAVOR, Joseph (MR)'),
            ('COLLISON-COFIE, Rahima Ardua (MISS)'),
            ('NURUDEEN, Abdul-Ghaniyu (MR)'),
            ('OMABOE, Prince Nii Noi (MR)'),
            ('ABDUL, Shakibu (MR)'),
            ('MCCARTHY, Raphael Ansah (MR)'),
            ('YAKUBU TANKO, Mohammed-Awal (MR)'),
            ('BENTSIL, Salas Nhyira Kwesi (MR)'),
            ('OPPONG-TACHIE, Melvin (MR)'),
            ('APOABADEK, Jeffrey Alimsiwen (MR)'),
            ('ERIRIE, Jeffrey (MR)'),
            ('AKAKPO, Godfrey Mensah (MR)'),
            ('KEMEH, Kafu Kwame (MR)'),
            ('AMOAKO, Derrick (MR)'),
            ('NYARKO, Steven Abrokwah (MR)'),
            ('ACHEAMPONG, Jonas (MR)'),
            ('MUNAGAH, Muhammad Nurul Haqq Abdul-Bassit (MR)'),
            ('APPAU, Akua Konadu (MISS)'),
            ('AHENATO, Joyce Adoma (MISS)'),
            ('ADUSEI-OKRAH, Bernardine (MR)'),
            ('ACKERSON, Clifford Kwaw (MR)'),
            ('ASOMANING, Fitzgerald David Nana Opoku (MR)'),
            ('PREMPEH, Joel Mawuena (MR)'),
            ('GAMBO, Timothy Rezon (MR)'),
            ('CLOTTEY, Matilda (MISS)'),
            ('ANSAH, Genevieve Araba (MISS)'),
            ('MPOSSEI, David (MR)'),
            ('AYISI, Maame Afua Ayisibea (MISS)'),
            ('ANSROGYA, Philemon Kwabena (MR)'),
            ('ABBAN, Nana Kobina Ahinsah (MR)'),
            ('ARMOH, Solomon (MR)'),
            ('ASSOGBA, Eunice Amaniampong (MISS)'),
            ('OWUSU, Christer Nana (MR)'),
            ('TAMAKLOE, Thomas Bruce (MR)'),
            ('ASILEVI, Helena Korkor (MISS)'),
            ('GLE, Kafui Kofi (MR)'),
            ('SACKITEY, Lord Gilbert (MR)'),
            ('ASARE, Kwaku Ofosu (MR)'),
            ('ANTWI, Samuel Kojo Anafi (MR)'),
            ('ARYEETEY, Khristabel (MISS)'),
            ('BOADU, Nkansah Tabi (MR)'),
            ('OBODAI, Elliot James Nii Torgbor (MR)'),
            ('WENIDE, Isaac Atta (MR)'),
            ('OFORI, Victoria (MISS)')
    ) AS students(student_name)
)

INSERT INTO level_100_students (name, pin)
SELECT student_name, pin FROM pins OFFSET 0 LIMIT 20;

INSERT INTO level_200_students (name, pin)
SELECT student_name, pin FROM pins OFFSET 20 LIMIT 20;

INSERT INTO level_300_students (name, pin)
SELECT student_name, pin FROM pins OFFSET 40 LIMIT 20;

INSERT INTO level_400_students (name, pin)
SELECT student_name, pin FROM pins OFFSET 60 LIMIT 20;

INSERT INTO level_100_enrollment (student_id, course_id)
SELECT student_id, course_id FROM level_100_students
CROSS JOIN biomedical_engineering_courses;

INSERT INTO level_200_enrollment (student_id, course_id)
SELECT student_id, course_id FROM level_200_students
CROSS JOIN agricultural_engineering_courses;

INSERT INTO level_300_enrollment (student_id, course_id)
SELECT student_id, course_id FROM level_300_students
CROSS JOIN food_processing_engineering_courses;

INSERT INTO level_400_enrollment (student_id, course_id)
SELECT student_id, course_id FROM level_400_students
CROSS JOIN computer_engineering_courses;

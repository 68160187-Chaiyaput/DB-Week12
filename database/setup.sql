-- Resume CRUD Lab: setup.sql
-- Student: ชัยภัทร บุญประเสริฐ (68160187)
-- NOTE: Select your database in phpMyAdmin first before importing this file

DROP TABLE IF EXISTS training;
DROP TABLE IF EXISTS skill;
DROP TABLE IF EXISTS education;
DROP TABLE IF EXISTS profile;

CREATE TABLE profile (
 id INT AUTO_INCREMENT PRIMARY KEY,
 full_name VARCHAR(150) NOT NULL,
 headline VARCHAR(200), email VARCHAR(150), phone VARCHAR(30),
 address VARCHAR(255), about_me TEXT, photo VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE education (
 id INT AUTO_INCREMENT PRIMARY KEY, profile_id INT NOT NULL,
 degree VARCHAR(200) NOT NULL, institution VARCHAR(200) NOT NULL,
 start_year YEAR, end_year YEAR,
 CONSTRAINT fk_education_profile FOREIGN KEY (profile_id) REFERENCES profile(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE skill (
 id INT AUTO_INCREMENT PRIMARY KEY, profile_id INT NOT NULL,
 skill_name VARCHAR(120) NOT NULL, skill_level VARCHAR(50),
 CONSTRAINT fk_skill_profile FOREIGN KEY (profile_id) REFERENCES profile(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE training (
 id INT AUTO_INCREMENT PRIMARY KEY, profile_id INT NOT NULL,
 course_name VARCHAR(200) NOT NULL, organization VARCHAR(200), training_year YEAR,
 CONSTRAINT fk_training_profile FOREIGN KEY (profile_id) REFERENCES profile(id) ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO profile (full_name, headline, email, phone, address, about_me, photo)
VALUES ('ชัยภัทร บุญประเสริฐ','Applied Artificial Intelligence Student','68160187@go.buu.ac.th','095-939-2203','Rayong, Thailand','Yo! I am a student at Burapha University, Faculty of Informatics, studying Applied Artificial Intelligence (AAI). I am interested in data analysis and technology.','student.jpg');

INSERT INTO education (profile_id, degree, institution, start_year, end_year)
VALUES (1,'Bachelor of Science in Applied Artificial Intelligence','Burapha University',2025,2029),(1,'High School (มัธยมศึกษา)','Rayongwittayakom School',2019,2024);

INSERT INTO skill (profile_id,skill_name,skill_level) VALUES (1,'Data Analysis','Beginner'),(1,'Python','Beginner'),(1,'SQL','Beginner'),(1,'PHP','Beginner'),(1,'HTML/CSS','Beginner');

INSERT INTO training (profile_id,course_name,organization,training_year)
VALUES (1,'Database Lab: PHP + MySQL','Burapha University',2026);

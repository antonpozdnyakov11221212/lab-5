DROP TABLE IF EXISTS 'student';
DROP TABLE IF EXISTS 'students_marks';
DROP TABLE IF EXISTS 'group_';

CREATE TABLE student(
  id REFERENCES students_marks(id),
  name VARCHAR(30) NOT NULL,
  group_id REFERENCES group_(id),
  PRIMARY KEY(id)
);
CREATE TABLE students_marks(
  student_id INTEGER PRIMARY KEY,
  math_mark_average FLOAT NOT NULL,
  physics_mark_average FLOAT NOT NULL,
  python_mark_average FLOAT NOT NULL
);

CREATE TABLE group_(
  id INTEGER PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(30) NOT NULL
);


INSERT INTO students_marks VALUES(1, 3.5, 4.5, 5.0);
INSERT INTO students_marks VALUES(2, 5.0, 5.0, 5.0);
INSERT INTO students_marks VALUES(3, 2.0, 2.0, 2.0);

INSERT INTO student VALUES((SELECT id FROM students_marks WHERE student_id = 1), 'Арут', (SELECT id FROM students_marks WHERE name = 'TI_5'));
INSERT INTO student VALUES((SELECT id FROM students_marks WHERE student_id = 2), 'Райан Гослинг', (SELECT id FROM students_marks WHERE name = 'TI_10'));
INSERT INTO student VALUES((SELECT id FROM students_marks WHERE student_id = 3), 'Антон', (SELECT id FROM students_marks WHERE name = 'TI_3'));

INSERT INTO group_ VALUES(3, 'TI_3', 'пойдет');
INSERT INTO group_ VALUES(5, 'TI_5', 'норм');
INSERT INTO group_ VALUES(10, 'TI_10', 'лучшее');


SELECT * FROM student ORDER BY group_id DESC
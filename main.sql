SELECT 'Hello, SQL!' AS MESSAGE;

-- table : create

CREATE TABLE IF NOT EXISTS `Department`(
    `id` int
);

-- table : delete

DROP TABLE `Department`;

-- table - key : primary key

CREATE TABLE `Department`(
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `employee_num` INTEGER NOT NULL
);

-- table - column : delete

ALTER TABLE `Department` DROP COLUMN `employee_num`;

-- table - column : add

ALTER TABLE `Department` ADD COLUMN `leval` INTEGER NOT NULL DEFAULT 0;

-- table - item : add with columns and values

INSERT INTO `Department`(`id`, `name`, `leval`) VALUES (2, 'D2', 2);

-- table - item : add only with values

INSERT INTO `Department` VALUES (4, 'D4', 3);

-- table - item : add with some columns and relative values

INSERT INTO `Department`(`name`) VALUES ('D5');

SELECT '' AS MESSAGE;
SELECT 'Department' AS MESSAGE;

-- table - item - select : show all

SELECT * FROM `Department`;

DROP TABLE IF EXISTS `Employee`;

-- table - key : foreign key

CREATE TABLE `Employee`(
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `age` INTEGER NOT NULL,
    `department_id` INTEGER,
    FOREIGN KEY(department_id) REFERENCES `Department`(id)
);

INSERT INTO `Employee`(`name`, `age`, `department_id`) VALUES('John', 13, 2);

INSERT INTO `Employee`(`name`, `age`, `department_id`) VALUES('Sarah', 12, 5);

INSERT INTO `Employee`(`name`, `age`, `department_id`) VALUES('David', 22, 2);

SELECT '' AS MESSAGE;
SELECT 'Employee' AS MESSAGE;

SELECT * FROM `Employee`;

DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer`(
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `age` INTEGER NOT NULL
);

INSERT INTO `Customer`(`name`, `age`) VALUES('Olivia ', 22);

INSERT INTO `Customer`(`name`, `age`) VALUES('James', 21);

INSERT INTO `Customer`(`name`, `age`) VALUES('Sophia', 33);

INSERT INTO `Customer`(`name`, `age`) VALUES('Emily', 44);

-- table - item - select : condition
-- table - item : delete

DELETE FROM 'Customer' WHERE `id` = 4;

-- table - item : update

UPDATE 'Customer' SET `age` = 25 WHERE `age` = 33;

SELECT '' AS MESSAGE;
SELECT 'Customer' AS MESSAGE;

-- table - item - select : relevant item with some column

SELECT `name`, `age` FROM `Customer`;

-- table - item - select : and condition

SELECT '' AS MESSAGE;
SELECT 'Employee(age < 18 and department_id = 2)' AS MESSAGE;

SELECT * FROM `Employee` WHERE age < 18 AND `department_id` = 2;

SELECT '' AS MESSAGE;
SELECT 'Employee(age > 20 or department_id=5)' AS MESSAGE;

-- table - item - select : or condition

SELECT * FROM `Employee` WHERE age > 20 OR `department_id` = 5;

SELECT '' AS MESSAGE;
SELECT 'Employee(sorted by age)' AS MESSAGE;

-- table - item - select : sorted

SELECT * FROM `Employee` ORDER BY `age`;

SELECT '' AS MESSAGE;
SELECT 'Employee(limited 2)' AS MESSAGE;

-- table - item - select : limited

SELECT * FROM `Employee` LIMIT 2;

SELECT '' AS MESSAGE;
SELECT 'Employee(count)' AS MESSAGE;

-- table - item - select : aggregate function

SELECT COUNT(*) FROM `Employee`;

SELECT '' AS MESSAGE;
SELECT 'Employee and Customer' AS MESSAGE;

-- table - item - select : union

SELECT `name`, `age` FROM `Employee` UNION SELECT `name`, `age` FROM `Customer`;

SELECT '' AS MESSAGE;
SELECT 'Employee and Customer(count)' AS MESSAGE;

-- table - item - select : as condition

SELECT COUNT(*) FROM(
    SELECT `name`, `age` FROM `Employee` UNION SELECT `name`, `age` FROM `Customer`
) AS `Person`;

SELECT '' AS MESSAGE;
SELECT 'Employee join Department' AS MESSAGE;

-- table - item - select : join

SELECT `Employee`.`name`, `Department`.`name` FROM  `Employee` LEFT JOIN `Department` ON `Employee`.`department_id` = `Department`.`id`;

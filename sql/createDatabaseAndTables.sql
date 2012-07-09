SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `bootcamp` DEFAULT CHARACTER SET utf8 ;
USE `bootcamp` ;

-- -----------------------------------------------------
-- Table `bootcamp`.`Departments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bootcamp`.`Departments` (
  `department_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL DEFAULT NULL ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`department_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `idCategories_UNIQUE` ON `bootcamp`.`Departments` (`department_id` ASC) ;


-- -----------------------------------------------------
-- Table `bootcamp`.`Classes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bootcamp`.`Classes` (
  `class_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL DEFAULT NULL ,
  `description` VARCHAR(45) NULL DEFAULT NULL ,
  `teacher_id` INT(11) NULL DEFAULT NULL ,
  `department_id` INT(11) NOT NULL ,
  PRIMARY KEY (`class_id`) ,
  CONSTRAINT `fk_Classes_Departments1`
    FOREIGN KEY (`department_id` )
    REFERENCES `bootcamp`.`Departments` (`department_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `class_id_UNIQUE` ON `bootcamp`.`Classes` (`class_id` ASC) ;

CREATE INDEX `fk_Classes_Departments1` ON `bootcamp`.`Classes` (`department_id` ASC) ;


-- -----------------------------------------------------
-- Table `bootcamp`.`Roles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bootcamp`.`Roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `Role` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `id_UNIQUE` ON `bootcamp`.`Roles` (`id` ASC) ;


-- -----------------------------------------------------
-- Table `bootcamp`.`Students`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bootcamp`.`Students` (
  `student_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(45) NULL DEFAULT NULL ,
  `middle_initial` VARCHAR(45) NULL DEFAULT NULL ,
  `last_name` VARCHAR(45) NULL DEFAULT NULL ,
  `address` VARCHAR(45) NULL DEFAULT NULL ,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`student_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `student_id_UNIQUE` ON `bootcamp`.`Students` (`student_id` ASC) ;


-- -----------------------------------------------------
-- Table `bootcamp`.`StudentsClasses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bootcamp`.`StudentsClasses` (
  `student_id` INT(11) NOT NULL ,
  `class_id` INT(11) NOT NULL ,
  `grade` VARCHAR(45) NULL DEFAULT NULL ,
  CONSTRAINT `fk_StudentsClasses_Classes1`
    FOREIGN KEY (`class_id` )
    REFERENCES `bootcamp`.`Classes` (`class_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentsClasses_Students1`
    FOREIGN KEY (`student_id` )
    REFERENCES `bootcamp`.`Students` (`student_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_StudentsClasses_Students1` ON `bootcamp`.`StudentsClasses` (`student_id` ASC) ;

CREATE INDEX `fk_StudentsClasses_Classes1` ON `bootcamp`.`StudentsClasses` (`class_id` ASC) ;


-- -----------------------------------------------------
-- Table `bootcamp`.`Teachers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bootcamp`.`Teachers` (
  `teacher_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(45) NULL DEFAULT NULL ,
  `last_name` VARCHAR(45) NULL DEFAULT NULL ,
  `login` VARCHAR(45) NULL DEFAULT NULL ,
  `password` VARCHAR(45) NULL DEFAULT NULL ,
  `department_id` INT(11) NOT NULL ,
  PRIMARY KEY (`teacher_id`) ,
  CONSTRAINT `fk_Teachers_Departments1`
    FOREIGN KEY (`department_id` )
    REFERENCES `bootcamp`.`Departments` (`department_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `idTeachers_UNIQUE` ON `bootcamp`.`Teachers` (`teacher_id` ASC) ;

CREATE INDEX `fk_Teachers_Departments1` ON `bootcamp`.`Teachers` (`department_id` ASC) ;


-- -----------------------------------------------------
-- Table `bootcamp`.`TeachersClasses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bootcamp`.`TeachersClasses` (
  `class_id` INT(11) NOT NULL ,
  `teacher_id` INT(11) NOT NULL ,
  PRIMARY KEY (`class_id`) ,
  CONSTRAINT `fk_TeachersClasses_Classes1`
    FOREIGN KEY (`class_id` )
    REFERENCES `bootcamp`.`Classes` (`class_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TeachersClasses_Teachers1`
    FOREIGN KEY (`teacher_id` )
    REFERENCES `bootcamp`.`Teachers` (`teacher_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `fk_TeachersClasses_Teachers1` ON `bootcamp`.`TeachersClasses` (`teacher_id` ASC) ;


-- -----------------------------------------------------
-- Table `bootcamp`.`Users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bootcamp`.`Users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `role` INT(11) NOT NULL ,
  `Roles_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_Users_Roles1`
    FOREIGN KEY (`Roles_id` )
    REFERENCES `bootcamp`.`Roles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `id_UNIQUE` ON `bootcamp`.`Users` (`id` ASC) ;

CREATE UNIQUE INDEX `username_UNIQUE` ON `bootcamp`.`Users` (`username` ASC) ;

CREATE UNIQUE INDEX `email_UNIQUE` ON `bootcamp`.`Users` (`email` ASC) ;

CREATE INDEX `role_id` ON `bootcamp`.`Users` (`id` ASC) ;

CREATE INDEX `fk_Users_Roles1` ON `bootcamp`.`Users` (`Roles_id` ASC) ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

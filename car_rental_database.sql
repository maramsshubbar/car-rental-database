--2.	DDL script for a database schema 
-- Drop Tables
DROP TABLE promotion CASCADE CONSTRAINTS;
DROP TABLE position CASCADE CONSTRAINTS;
DROP TABLE employee CASCADE CONSTRAINTS;
DROP TABLE equipment_type CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE extra_equipment CASCADE CONSTRAINTS;
DROP TABLE location CASCADE CONSTRAINTS;
DROP TABLE car_category CASCADE CONSTRAINTS;
DROP TABLE manufacturer CASCADE CONSTRAINTS;
DROP TABLE model CASCADE CONSTRAINTS;
DROP TABLE car CASCADE CONSTRAINTS;
DROP TABLE insurance CASCADE CONSTRAINTS;
DROP TABLE car_maintenance CASCADE CONSTRAINTS;
DROP TABLE address CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;
DROP TABLE license CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE customer_promotion CASCADE CONSTRAINTS;
DROP TABLE car_rental CASCADE CONSTRAINTS;
DROP TABLE equipment_rental CASCADE CONSTRAINTS;
DROP TABLE fine CASCADE CONSTRAINTS;
DROP TABLE employee_audit_log CASCADE CONSTRAINTS;
 
-- Drop Sequences
DROP SEQUENCE promotion_id_seq;
DROP SEQUENCE position_id_seq;
DROP SEQUENCE employee_id_seq;
DROP SEQUENCE equipment_type_id_seq;
DROP SEQUENCE payment_id_seq;
DROP SEQUENCE location_id_seq;
DROP SEQUENCE car_category_id_seq;
DROP SEQUENCE manufacturer_id_seq;
DROP SEQUENCE model_id_seq;
DROP SEQUENCE car_id_seq;
DROP SEQUENCE insurance_id_seq;
DROP SEQUENCE maintenance_id_seq;
DROP SEQUENCE address_id_seq;
DROP SEQUENCE customer_id_seq;
DROP SEQUENCE license_id_seq;
DROP SEQUENCE reservation_id_seq;
DROP SEQUENCE car_rental_id_seq;
DROP SEQUENCE extra_equipment_id_seq;
DROP SEQUENCE fine_id_seq;


--DDL script for a database schema 
-- Create Tables
CREATE TABLE PROMOTION (
                promotionID NUMBER(5) NOT NULL,
                promotionCode VARCHAR2(10) NOT NULL,
                promotionTitle VARCHAR2(30) NOT NULL,
                promotionType VARCHAR2(20) NOT NULL,
                percentage VARCHAR2(10) NOT NULL,
                promotionDescription VARCHAR2(60) NOT NULL,
                startDate DATE NOT NULL,
                endDate DATE NOT NULL,
                promotionLimit NUMBER(2) NOT NULL,
                isActive NUMBER NOT NULL,
                CONSTRAINT PROMOTION_PK PRIMARY KEY (promotionID)
);

CREATE TABLE POSITION (
                positionID NUMBER(3) NOT NULL,
                positionTitle VARCHAR2(20) NOT NULL,
                positionDescription VARCHAR2(40) NOT NULL,
                salary NUMBER(4) NOT NULL,
                CONSTRAINT POSITION_PK PRIMARY KEY (positionID)
);

CREATE TABLE EQUIPMENT_TYPE (
                equipmentTypeID NUMBER(9) NOT NULL,
                equipmentTypeName VARCHAR2(15) NOT NULL,
                equipmentTypeDescription VARCHAR2(50) NOT NULL,
                CONSTRAINT EQUIPMENT_TYPE_PK PRIMARY KEY (equipmentTypeID)
);

CREATE TABLE PAYMENT (
                paymentID NUMBER(9) NOT NULL,
                paymentDate DATE NOT NULL,
                paymentTime DATE NOT NULL,
                paymentMethod VARCHAR2(15) NOT NULL,
                paymentAmount NUMBER(8,2) NOT NULL,
                paymentStatus VARCHAR2(10) NOT NULL,
                CONSTRAINT PAYMENT_PK PRIMARY KEY (paymentID)
);

CREATE TABLE LOCATION (
                locationID NUMBER(5) NOT NULL,
                address VARCHAR2(50) NOT NULL,
                cityName VARCHAR2(10) NOT NULL,
                phoneNumber VARCHAR2(15) NOT NULL,
                CONSTRAINT LOCATION_PK PRIMARY KEY (locationID)
);

CREATE TABLE CAR_CATEGORY (
                carCategoryID NUMBER(5) NOT NULL,
                carCategoryName VARCHAR2(20) NOT NULL,
                carCategoryDescription VARCHAR2(50) NOT NULL,
                CONSTRAINT CAR_CATEGORY_PK PRIMARY KEY (carCategoryID)
);

CREATE TABLE MANUFACTURER (
                manufacturerID NUMBER(5) NOT NULL,
                manufacturerName VARCHAR2(20) NOT NULL,
                CONSTRAINT MANUFACTURER_PK PRIMARY KEY (manufacturerID)
);

CREATE TABLE MODEL (
                modelID NUMBER(5) NOT NULL,
                manufacturerID NUMBER(5) NOT NULL,
                modelName VARCHAR2(10) NOT NULL,
                engineSize NUMBER(3,1) NOT NULL,
                CONSTRAINT MODEL_PK PRIMARY KEY (modelID)
);

CREATE TABLE CAR (
                carID NUMBER(5) NOT NULL,
                modelID NUMBER(5) NOT NULL,
                carCategoryID NUMBER(5) NOT NULL,
                registrationPlateNumber VARCHAR2(10) NOT NULL,
                carRegistrationDueDate DATE NOT NULL,
                yearManufactured NUMBER(4) NOT NULL,
                colour VARCHAR2(10) NOT NULL,
                currentMileage NUMBER(6) NOT NULL,
                dailyHireRate NUMBER(4,2) NOT NULL,
                dailyLateReturnPenalty NUMBER(4,2) NOT NULL,
                carStatus VARCHAR2(20) NOT NULL,
                carCondition VARCHAR2(20) NOT NULL,
                carCapacity NUMBER(2) NOT NULL,
                CONSTRAINT CAR_PK PRIMARY KEY (carID)
);

CREATE TABLE INSURANCE (
                insuranceID NUMBER(9) NOT NULL,
                carID NUMBER(5) NOT NULL,
                validityStartDate DATE NOT NULL,
                validityEndDate DATE NOT NULL,
                insuranceType VARCHAR2(20) NOT NULL,
                insuranceAmount NUMBER(3) NOT NULL,
                insuranceProvider VARCHAR2(20) NOT NULL,
                CONSTRAINT INSURANCE_PK PRIMARY KEY (insuranceID)
);

CREATE TABLE CAR_MAINTENANCE (
                maintenanceID NUMBER(9) NOT NULL,
                carID NUMBER(5) NOT NULL,
                startDate DATE NOT NULL,
                endDate DATE NOT NULL,
                maintenanceStatus VARCHAR2(15) NOT NULL,
                maintenanceAmount VARCHAR2(20),
                maintenanceTime VARCHAR2(20),
                CONSTRAINT CAR_MAINTENANCE_PK PRIMARY KEY (maintenanceID)
);

CREATE TABLE ADDRESS (
                addressID NUMBER(5) NOT NULL,
                blockNo NUMBER(4) NOT NULL,
                roadNo NUMBER(4) NOT NULL,
                buildingNo NUMBER(4) NOT NULL,
                CONSTRAINT ADDRESS_PK PRIMARY KEY (addressID)
);

CREATE TABLE EMPLOYEE (
                employeeID NUMBER(5) NOT NULL,
                positionID NUMBER(3) NOT NULL,
                addressID NUMBER(5) NOT NULL,
                CPR VARCHAR2(9) NOT NULL,
                firstName VARCHAR2(20) NOT NULL,
                lastName VARCHAR2(20) NOT NULL,
                nationality VARCHAR2(10) NOT NULL,
                email VARCHAR2(30) NOT NULL,
                dateOfBirth DATE NOT NULL,
                gender VARCHAR2(10) NOT NULL,
                phoneNumber VARCHAR2(15) NOT NULL,
                CONSTRAINT EMPLOYEE_PK PRIMARY KEY (employeeID)
);

CREATE TABLE EXTRA_EQUIPMENT (
                extraEquipmentID NUMBER(5) NOT NULL,
                equipmentTypeID NUMBER(9) NOT NULL,
                employeeID NUMBER(5) NOT NULL,
                extraEquipmentName VARCHAR2(15) NOT NULL,
                extraEquipmentDescription VARCHAR2(30) NOT NULL,
                dailyRentalPrice NUMBER(3,1) NOT NULL,
                extraEquipmentStatus VARCHAR2(10) NOT NULL,
                CONSTRAINT EXTRA_EQUIPMENT_PK PRIMARY KEY (extraEquipmentID)
);

CREATE TABLE CUSTOMER (
                customerID NUMBER(5) NOT NULL,
                addressID NUMBER(5) NOT NULL,
                cpr_or_passport VARCHAR2(15) NOT NULL,
                firstName VARCHAR2(20) NOT NULL,
                lastName VARCHAR2(20) NOT NULL,
                username VARCHAR2(10) NOT NULL,
                nationality VARCHAR2(10) NOT NULL,
                email VARCHAR2(30) NOT NULL,
                dateOfBirth DATE NOT NULL,
                gender VARCHAR2(10) NOT NULL,
                phoneNumber VARCHAR2(15) NOT NULL,
                CONSTRAINT CUSTOMER_PK PRIMARY KEY (customerID)
);

CREATE TABLE LICENSE (
                licenseID NUMBER(5) NOT NULL,
                customerID NUMBER(5) NOT NULL,
                licenseNumber VARCHAR2(10) NOT NULL,
                licenseType VARCHAR2(15) NOT NULL,
                issueDate DATE NOT NULL,
                expiryDate DATE NOT NULL,
                issuingCountry VARCHAR2(10) NOT NULL,
                licenseStatus VARCHAR2(10) NOT NULL,
                CONSTRAINT LICENSE_PK PRIMARY KEY (licenseID)
);

CREATE TABLE RESERVATION (
                reservationID NUMBER(9) NOT NULL,
                customerID NUMBER(5) NOT NULL,
                paymentID NUMBER(9) NOT NULL,
                carID NUMBER(5) NOT NULL,
                employeeID NUMBER(5) NOT NULL,
                ReservationDate  DATE NOT NULL,
                pickUpDate DATE NOT NULL,
                returnDate DATE NOT NULL,
                pickUpLocation VARCHAR2(10) NOT NULL,
                returnLocation VARCHAR2(10) NOT NULL,
                reservationStatus VARCHAR2(10) NOT NULL,
                CONSTRAINT RESERVATION_PK PRIMARY KEY (reservationID)
);

CREATE TABLE CUSTOMER_PROMOTION (
                customerID NUMBER(5) NOT NULL,
                promotionID NUMBER(5) NOT NULL,
                CONSTRAINT CUSTOMER_PROMOTION_PK PRIMARY KEY (customerID, promotionID)
);

CREATE TABLE CAR_RENTAL (
   carRentalID NUMBER(5) NOT NULL,
   customerID NUMBER(5) NOT NULL,
   employeeID NUMBER(5) NOT NULL,
   carID NUMBER(5) NOT NULL,
   locationID NUMBER(5) NOT NULL,
   rentalDuration NUMBER NOT NULL,
   rentalCost NUMBER(8,2) NOT NULL,
   status VARCHAR2(10) NOT NULL,
   rentalStartDate DATE NOT NULL,
   rentalEndDate DATE NOT NULL,
   CONSTRAINT CAR_RENTAL_PK PRIMARY KEY (carRentalID)
);

CREATE TABLE EQUIPMENT_RENTAL (
                extraEquipmentID NUMBER(5) NOT NULL,
                carRentalID NUMBER(5) NOT NULL,
                quantity NUMBER(1) NOT NULL,
                CONSTRAINT EQUIPMENT_RENTAL_PK PRIMARY KEY (extraEquipmentID, carRentalID)
);

CREATE TABLE FINE (
                fineID NUMBER(9) NOT NULL,
                customerID NUMBER(5) NOT NULL,
                carRentalID NUMBER(5) NOT NULL,
                employeeID NUMBER(5) NOT NULL,
                fineAmount NUMBER(3) NOT NULL,
                fineReason VARCHAR2(20) NOT NULL,
                dateIssued DATE NOT NULL,
                dueDate DATE NOT NULL,
                paymentStatus VARCHAR2(10) NOT NULL,
                CONSTRAINT FINE_PK PRIMARY KEY (fineID)
);

ALTER TABLE CUSTOMER_PROMOTION ADD CONSTRAINT PROMOTION_CUSTOMER_PROMOTIO262
FOREIGN KEY (promotionID)
REFERENCES PROMOTION (promotionID)
NOT DEFERRABLE;

ALTER TABLE EMPLOYEE ADD CONSTRAINT POSITION_EMPLOYEE_FK
FOREIGN KEY (positionID)
REFERENCES POSITION (positionID)
NOT DEFERRABLE;

ALTER TABLE EXTRA_EQUIPMENT ADD CONSTRAINT EQUIPMENT_TYPE_EXTRA_EQUIPM801
FOREIGN KEY (equipmentTypeID)
REFERENCES EQUIPMENT_TYPE (equipmentTypeID)
NOT DEFERRABLE;

ALTER TABLE RESERVATION ADD CONSTRAINT PAYMENT_RESERVATION_FK
FOREIGN KEY (paymentID)
REFERENCES PAYMENT (paymentID)
NOT DEFERRABLE;

ALTER TABLE CAR_RENTAL ADD CONSTRAINT LOCATION_CARRENTAL_FK
FOREIGN KEY (locationID)
REFERENCES LOCATION (locationID)
NOT DEFERRABLE;

ALTER TABLE CAR ADD CONSTRAINT CARCATEGORY_CAR_FK
FOREIGN KEY (carCategoryID)
REFERENCES CAR_CATEGORY (carCategoryID)
NOT DEFERRABLE;

ALTER TABLE MODEL ADD CONSTRAINT MANUFACTURER_MODEL_FK
FOREIGN KEY (manufacturerID)
REFERENCES MANUFACTURER (manufacturerID)
NOT DEFERRABLE;

ALTER TABLE CAR ADD CONSTRAINT MODEL_CAR_FK
FOREIGN KEY (modelID)
REFERENCES MODEL (modelID)
NOT DEFERRABLE;

ALTER TABLE CAR_RENTAL ADD CONSTRAINT CAR_CARRENTAL_FK
FOREIGN KEY (carID)
REFERENCES CAR (carID)
NOT DEFERRABLE;

ALTER TABLE RESERVATION ADD CONSTRAINT CAR_RESERVATION_FK
FOREIGN KEY (carID)
REFERENCES CAR (carID)
NOT DEFERRABLE;

ALTER TABLE CAR_MAINTENANCE ADD CONSTRAINT CAR_CAR_MAINTENANCE_FK
FOREIGN KEY (carID)
REFERENCES CAR (carID)
NOT DEFERRABLE;

ALTER TABLE INSURANCE ADD CONSTRAINT CAR_INSURANCE_FK
FOREIGN KEY (carID)
REFERENCES CAR (carID)
NOT DEFERRABLE;

ALTER TABLE CUSTOMER ADD CONSTRAINT ADDRESS_CUSTOMER_FK
FOREIGN KEY (addressID)
REFERENCES ADDRESS (addressID)
NOT DEFERRABLE;

ALTER TABLE EMPLOYEE ADD CONSTRAINT ADDRESS_EMPLOYEE_FK
FOREIGN KEY (addressID)
REFERENCES ADDRESS (addressID)
NOT DEFERRABLE;

ALTER TABLE RESERVATION ADD CONSTRAINT EMPLOYEE_RESERVATION_FK
FOREIGN KEY (employeeID)
REFERENCES EMPLOYEE (employeeID)
NOT DEFERRABLE;

ALTER TABLE FINE ADD CONSTRAINT EMPLOYEE_FINE_FK
FOREIGN KEY (employeeID)
REFERENCES EMPLOYEE (employeeID)
NOT DEFERRABLE;

ALTER TABLE EXTRA_EQUIPMENT ADD CONSTRAINT EMPLOYEE_EXTRA_EQUIPMENT_FK
FOREIGN KEY (employeeID)
REFERENCES EMPLOYEE (employeeID)
NOT DEFERRABLE;

ALTER TABLE CAR_RENTAL ADD CONSTRAINT EMPLOYEE_CAR_RENTAL_FK
FOREIGN KEY (employeeID)
REFERENCES EMPLOYEE (employeeID)
NOT DEFERRABLE;

ALTER TABLE EQUIPMENT_RENTAL ADD CONSTRAINT EXTRA_EQUIPMENT_EQUIPMENT_R599
FOREIGN KEY (extraEquipmentID)
REFERENCES EXTRA_EQUIPMENT (extraEquipmentID)
NOT DEFERRABLE;

ALTER TABLE CAR_RENTAL ADD CONSTRAINT CUSTOMER_CARRENTAL_FK
FOREIGN KEY (customerID)
REFERENCES CUSTOMER (customerID)
NOT DEFERRABLE;

ALTER TABLE CUSTOMER_PROMOTION ADD CONSTRAINT CUSTOMER_CUSTOMER_PROMOTION_FK
FOREIGN KEY (customerID)
REFERENCES CUSTOMER (customerID)
NOT DEFERRABLE;

ALTER TABLE RESERVATION ADD CONSTRAINT CUSTOMER_RESERVATION_FK
FOREIGN KEY (customerID)
REFERENCES CUSTOMER (customerID)
NOT DEFERRABLE;

ALTER TABLE LICENSE ADD CONSTRAINT CUSTOMER_LICENSE_FK
FOREIGN KEY (customerID)
REFERENCES CUSTOMER (customerID)
NOT DEFERRABLE;

ALTER TABLE FINE ADD CONSTRAINT CUSTOMER_FINE_FK
FOREIGN KEY (customerID)
REFERENCES CUSTOMER (customerID)
NOT DEFERRABLE;

ALTER TABLE FINE ADD CONSTRAINT CAR_RENTAL_FINE_FK
FOREIGN KEY (carRentalID)
REFERENCES CAR_RENTAL (carRentalID)
NOT DEFERRABLE;

ALTER TABLE EQUIPMENT_RENTAL ADD CONSTRAINT CAR_RENTAL_EQUIPMENT_RENTAL_FK
FOREIGN KEY (carRentalID)
REFERENCES CAR_RENTAL (carRentalID)
NOT DEFERRABLE;

-- DDL script for creating sequences 
-- Sequences and Triggers
-- sequence and trigger for promotion
CREATE SEQUENCE promotion_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_promotion
BEFORE INSERT ON PROMOTION
FOR EACH ROW
BEGIN
    IF :NEW.promotionID IS NULL THEN
        SELECT promotion_id_seq.NEXTVAL INTO :NEW.promotionID FROM dual;
    END IF;
END;
/

--sequence and trigger for position
CREATE SEQUENCE position_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_position
BEFORE INSERT ON POSITION
FOR EACH ROW
BEGIN
    IF :NEW.positionID IS NULL THEN
        SELECT position_id_seq.NEXTVAL INTO :NEW.positionID FROM dual;
    END IF;
END;
/


-- sequence and trigger for employee
CREATE SEQUENCE employee_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_employee
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF :NEW.employeeID IS NULL THEN
        SELECT employee_id_seq.NEXTVAL INTO :NEW.employeeID FROM dual;
    END IF;
END;
/

-- sequence and trigger for equipment type
CREATE SEQUENCE equipment_type_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_equipment_type
BEFORE INSERT ON EQUIPMENT_TYPE
FOR EACH ROW
BEGIN
    IF :NEW.equipmentTypeID IS NULL THEN
        SELECT equipment_type_id_seq.NEXTVAL INTO :NEW.equipmentTypeID FROM dual;
    END IF;
END;
/

-- sequence and trigger for payment
CREATE SEQUENCE payment_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_payment
BEFORE INSERT ON PAYMENT
FOR EACH ROW
BEGIN
    IF :NEW.paymentID IS NULL THEN
        SELECT payment_id_seq.NEXTVAL INTO :NEW.paymentID FROM dual;
    END IF;
END;
/

-- sequence and trigger for location
CREATE SEQUENCE location_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_location
BEFORE INSERT ON LOCATION
FOR EACH ROW
BEGIN
    IF :NEW.locationID IS NULL THEN
        SELECT location_id_seq.NEXTVAL INTO :NEW.locationID FROM dual;
    END IF;
END;
/


-- sequence and trigger for car category
CREATE SEQUENCE car_category_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_car_category
BEFORE INSERT ON CAR_CATEGORY
FOR EACH ROW
BEGIN
    IF :NEW.carCategoryID IS NULL THEN
        SELECT car_category_id_seq.NEXTVAL INTO :NEW.carCategoryID FROM dual;
    END IF;
END;
/


-- sequence and trigger for manufacturer
CREATE SEQUENCE manufacturer_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_manufacturer
BEFORE INSERT ON MANUFACTURER
FOR EACH ROW
BEGIN
    IF :NEW.manufacturerID IS NULL THEN
        SELECT manufacturer_id_seq.NEXTVAL INTO :NEW.manufacturerID FROM dual;
    END IF;
END;
/

-- sequence and trigger for model
CREATE SEQUENCE model_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_model
BEFORE INSERT ON MODEL
FOR EACH ROW
BEGIN
    IF :NEW.modelID IS NULL THEN
        SELECT model_id_seq.NEXTVAL INTO :NEW.modelID FROM dual;
    END IF;
END;
/

-- sequence and trigger for car
CREATE SEQUENCE car_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_car
BEFORE INSERT ON CAR
FOR EACH ROW
BEGIN
    IF :NEW.carID IS NULL THEN
        SELECT car_id_seq.NEXTVAL INTO :NEW.carID FROM dual;
    END IF;
END;
/

-- sequence and trigger for insurance
CREATE SEQUENCE insurance_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_insurance
BEFORE INSERT ON INSURANCE
FOR EACH ROW
BEGIN
    IF :NEW.insuranceID IS NULL THEN
        SELECT insurance_id_seq.NEXTVAL INTO :NEW.insuranceID FROM dual;
    END IF;
END;
/

-- sequence and trigger for car maintainace
CREATE SEQUENCE maintenance_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_car_maintenance
BEFORE INSERT ON CAR_MAINTENANCE
FOR EACH ROW
BEGIN
    IF :NEW.maintenanceID IS NULL THEN
        SELECT maintenance_id_seq.NEXTVAL INTO :NEW.maintenanceID FROM dual;
    END IF;
END;
/

-- sequence and trigger for address
CREATE SEQUENCE address_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_address
BEFORE INSERT ON ADDRESS
FOR EACH ROW
BEGIN
    IF :NEW.addressID IS NULL THEN
        SELECT address_id_seq.NEXTVAL INTO :NEW.addressID FROM dual;
    END IF;
END;
/

-- sequence and trigger for customer
CREATE SEQUENCE customer_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_customer
BEFORE INSERT ON CUSTOMER
FOR EACH ROW
BEGIN
    IF :NEW.customerID IS NULL THEN
        SELECT customer_id_seq.NEXTVAL INTO :NEW.customerID FROM dual;
    END IF;
END;
/

-- sequence and trigger for license
CREATE SEQUENCE license_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_license
BEFORE INSERT ON LICENSE
FOR EACH ROW
BEGIN
    IF :NEW.licenseID IS NULL THEN
        SELECT license_id_seq.NEXTVAL INTO :NEW.licenseID FROM dual;
    END IF;
END;
/

-- sequence and trigger for reservation
CREATE SEQUENCE reservation_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_reservation
BEFORE INSERT ON RESERVATION
FOR EACH ROW
BEGIN
    IF :NEW.reservationID IS NULL THEN
        SELECT reservation_id_seq.NEXTVAL INTO :NEW.reservationID FROM dual;
    END IF;
END;
/

-- sequence and trigger for car rental
CREATE SEQUENCE car_rental_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_car_rental
BEFORE INSERT ON CAR_RENTAL
FOR EACH ROW
BEGIN
    IF :NEW.carRentalID IS NULL THEN
        SELECT car_rental_id_seq.NEXTVAL INTO :NEW.carRentalID FROM dual;
    END IF;
END;
/

-- sequence and trigger for extra equipment
CREATE SEQUENCE extra_equipment_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_extra_equipment
BEFORE INSERT ON EXTRA_EQUIPMENT
FOR EACH ROW
BEGIN
    IF :NEW.extraEquipmentID IS NULL THEN
        SELECT extra_equipment_id_seq.NEXTVAL INTO :NEW.extraEquipmentID FROM dual;
    END IF;
END;
/

-- sequence and trigger for fine
CREATE SEQUENCE fine_id_seq START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE OR REPLACE TRIGGER trg_before_insert_fine
BEFORE INSERT ON FINE
FOR EACH ROW
BEGIN
    IF :NEW.fineID IS NULL THEN
        SELECT fine_id_seq.NEXTVAL INTO :NEW.fineID FROM dual;
    END IF;
END;
/


-- PL/SQL script for creating triggers 
-- 1. Trigger: CAR_RENTAL and CAR status
CREATE OR REPLACE TRIGGER trg_car_rental_status_set
BEFORE INSERT ON car_rental
FOR EACH ROW
BEGIN
    -- Set rental status
    IF SYSDATE BETWEEN :NEW.rentalStartDate AND :NEW.rentalEndDate THEN
        :NEW.status := 'Ongoing';
    ELSIF SYSDATE < :NEW.rentalStartDate THEN
        :NEW.status := 'Upcoming';
    ELSE
        :NEW.status := 'Completed';
    END IF;

    -- Set car status accordingly
    IF :NEW.status IN ('Ongoing', 'Upcoming') THEN
        UPDATE car
        SET carStatus = 'Rented'
        WHERE carID = :NEW.carID;
    ELSE
        UPDATE car
        SET carStatus = 'Available'
        WHERE carID = :NEW.carID;
    END IF;
END;
/


-- 2. Trigger: Prevent renting unavailable cars
CREATE OR REPLACE TRIGGER trg_check_car_availability
BEFORE INSERT ON car_rental
FOR EACH ROW
DECLARE
    v_conflict_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_conflict_count
    FROM car_rental
    WHERE carID = :NEW.carID
      AND (
          (:NEW.rentalStartDate BETWEEN rentalStartDate AND rentalEndDate)
          OR (:NEW.rentalEndDate BETWEEN rentalStartDate AND rentalEndDate)
          OR (rentalStartDate BETWEEN :NEW.rentalStartDate AND :NEW.rentalEndDate)
      );

    IF v_conflict_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 'Car is already booked for this period.');
    END IF;
END;
/


-- 3. Trigger: Auto-set isActive in PROMOTION based on dates
CREATE OR REPLACE TRIGGER trg_set_promotion_isActive
BEFORE INSERT OR UPDATE ON PROMOTION
FOR EACH ROW
BEGIN
    IF SYSDATE BETWEEN :NEW.startDate AND :NEW.endDate THEN
        :NEW.isActive := 1;
    ELSE
        :NEW.isActive := 0;
    END IF;
END;
/
 

-- 4. Trigger: Prevent inserting a rental if license is expired
CREATE OR REPLACE TRIGGER check_license_expiry
BEFORE INSERT ON CAR_RENTAL
FOR EACH ROW
DECLARE
    v_expiry_date DATE;
BEGIN
    SELECT expiryDate INTO v_expiry_date
    FROM LICENSE
    WHERE customerID = :NEW.customerID;

    IF v_expiry_date < SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'Customer license has expired.');
    END IF;
END;
/


-- 5. Trigger: Cancel conflicting reservation if car gets rented
CREATE OR REPLACE TRIGGER trg_cancel_reservation_on_rental
AFTER INSERT ON CAR_RENTAL
FOR EACH ROW
BEGIN
    UPDATE RESERVATION
    SET reservationStatus = 'Cancelled'
    WHERE carID = :NEW.carID AND LOWER(reservationStatus) = 'active';
END;
/
 

-- 6. Audit Trigger: Log deleted employees
-- Create audit table
CREATE TABLE employee_audit_log (
    audit_id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY PRIMARY KEY,
    employeeID NUMBER,
    action_type VARCHAR2(10),
    deleted_at DATE
);

-- Trigger to log deletions from EMPLOYEE
CREATE OR REPLACE TRIGGER trg_log_employee_delete
AFTER DELETE ON EMPLOYEE
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit_log (employeeID, action_type, deleted_at)
    VALUES (:OLD.employeeID, 'DELETE', SYSDATE);
END;
/
 

--7. BEFORE INSERT Trigger: Prevent promotion percentage over 100%
CREATE OR REPLACE TRIGGER trg_check_promotion_percentage
BEFORE INSERT ON PROMOTION
FOR EACH ROW
DECLARE
    v_percent NUMBER;
BEGIN
    -- Convert string like '25%' to number
    v_percent := TO_NUMBER(REPLACE(:NEW.percentage, '%'));

    IF v_percent > 100 THEN
        RAISE_APPLICATION_ERROR(-20020, 'Promotion percentage cannot exceed 100%');
    END IF;
END;
/


-- 8.   Trigger on the LICENSE table that automatically updates the licenseStatus
CREATE OR REPLACE TRIGGER trg_set_license_status
BEFORE INSERT OR UPDATE ON LICENSE
FOR EACH ROW
BEGIN
    IF :NEW.expiryDate < SYSDATE THEN
        :NEW.licenseStatus := 'Expired';
    ELSE
        :NEW.licenseStatus := 'Active';
    END IF;
END;
/


--DML script for inserting sample data into all the tables in the database
--Insertion Code
select * from promotion;
INSERT INTO PROMOTION (promotioncode, promotionTitle, promotiontype, percentage, promotiondescription, startdate, enddate, promotionlimit, isactive) VALUES ('SAVE10', 'Summer Deal', 'Seasonal', '10%', '10% off all rentals', '01-JUN-2025', '30-AUG-2025', 5, 0);
INSERT INTO PROMOTION (promotioncode, promotionTitle, promotiontype, percentage, promotiondescription, startdate, enddate, promotionlimit, isactive) VALUES ('RAMADAN15', 'Ramadan Special', 'Holiday', '15%', 'Discount during Ramadan', '01-MAR-2025', '31-MAR-2025', 3, 0);
INSERT INTO PROMOTION (promotioncode, promotionTitle, promotiontype, percentage, promotiondescription, startdate, enddate, promotionlimit, isactive) VALUES ('WEEKEND5', 'Weekend Saver', 'Weekend', '5%', 'Save more on weekends', '01-JAN-2025', '31-DEC-2025', 10, 1);
INSERT INTO PROMOTION (promotioncode, promotionTitle, promotiontype, percentage, promotiondescription, startdate, enddate, promotionlimit, isactive) VALUES ('NEWUSER20', 'First-Time Offer', 'Signup', '20%', 'Only for new users', '01-JAN-2025', '31-DEC-2025', 1, 1);
INSERT INTO PROMOTION (promotioncode, promotionTitle, promotiontype, percentage, promotiondescription, startdate, enddate, promotionlimit, isactive) VALUES ('RENT3HALF', '3rd Rent 50% Off', 'Loyalty', '50%', '50% off on your third rental', '01-JAN-2025', '31-DEC-2025', 1, 1);
INSERT INTO PROMOTION (promotioncode, promotionTitle, promotiontype, percentage, promotiondescription, startdate, enddate, promotionlimit, isactive) VALUES ('STUDENT10', 'Student Discount', 'Student', '10%', 'Valid student ID required', '01-JAN-2025', '31-DEC-2025', 5, 1);
INSERT INTO PROMOTION (promotioncode, promotionTitle, promotiontype, percentage, promotiondescription, startdate, enddate, promotionlimit, isactive) VALUES ('jan1', 'New Year', 'Holiday', '25%', '25% discount for car rentals on the occasion of New Year.','01-JAN-2024', '02-JAN-2024', 10, 1);
INSERT INTO PROMOTION (promotioncode, promotionTitle, promotiontype, percentage, promotiondescription, startdate, enddate, promotionlimit, isactive) VALUES ('nqbs1', 'Start of The Application', 'Launch', '70%', '70% discount for app launch.', '22-MAY-2024', '22-JUN-2024', 5, 1);


select * from position;
INSERT INTO position (positiontitle, positiondescription, salary) VALUES ('Manager', 'Oversees daily operations', 2500);
INSERT INTO position (positiontitle, positiondescription, salary) VALUES ('Receptionist', 'Handles bookings and customer service', 1200);
INSERT INTO position (positiontitle, positiondescription, salary) VALUES ('Mechanic', 'Performs maintenance on vehicles', 1800);
INSERT INTO position (positiontitle, positiondescription, salary) VALUES ('Cleaner', 'Cleans and prepares rental vehicles', 1000);
INSERT INTO position (positiontitle, positiondescription, salary) VALUES ('Accountant', 'Manages financial records and payroll', 2200);
INSERT INTO position (positiontitle, positiondescription, salary) VALUES ('Customer Support', 'Assists customers with inquiries', 1300);
INSERT INTO position (positiontitle, positiondescription, salary) VALUES ('IT Technician', 'Maintains system and software support', 2000);
INSERT INTO position (positiontitle, positiondescription, salary) VALUES ('Fleet Supervisor', 'Monitors and coordinates vehicle fleet', 2400);


select * from Equipment_type;
INSERT INTO Equipment_type (equipmenttypename, equipmenttypedescription) VALUES ('GPS', 'Navigation system for vehicle');
INSERT INTO Equipment_type (equipmenttypename, equipmenttypedescription) VALUES ('ChildSeat', 'Seat for infants or toddlers');
INSERT INTO Equipment_type (equipmenttypename, equipmenttypedescription) VALUES ('WiFi', 'In-car wireless internet device');
INSERT INTO Equipment_type (equipmenttypename, equipmenttypedescription) VALUES ('CoolBox', 'Portable car refrigerator');
INSERT INTO Equipment_type (equipmenttypename, equipmenttypedescription) VALUES ('RoofRack', 'Roof-mounted cargo rack');
INSERT INTO Equipment_type (equipmenttypename, equipmenttypedescription) VALUES ('DashCam', 'Front-facing dashboard camera');
INSERT INTO Equipment_type (equipmenttypename, equipmenttypedescription) VALUES ('FirstAidKit', 'Basic emergency medical supplies');
INSERT INTO Equipment_type (equipmenttypename, equipmenttypedescription) VALUES ('TollTag', 'Electronic toll payment device');



--Payment 
truncate  table payment;

select * from payment;
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('22-JUN-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('10:30:00', 'HH24:MI:SS'), 'Card', 120, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('15-JUL-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('11:45:00', 'HH24:MI:SS'), 'Cash', 250, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('22-AUG-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('14:00:00', 'HH24:MI:SS'), 'Card', 180.5, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('09-SEP-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('16:20:00', 'HH24:MI:SS'), 'Benefit Pay', 300, 'Pending');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('22-OCT-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('09:15:00', 'HH24:MI:SS'), 'Cash', 95, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('12-NOV-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'), 'Card', 210, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('22-DEC-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('13:30:00', 'HH24:MI:SS'), 'Apple Pay', 330, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('05-JAN-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('17:45:00', 'HH24:MI:SS'), 'Apple Pay', 155, 'Pending');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('18-FEB-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('08:20:00', 'HH24:MI:SS'), 'Cash', 220, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('22-MAR-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('19:30:00', 'HH24:MI:SS'), 'Card', 145, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('02-APR-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('15:00:00', 'HH24:MI:SS'), 'Benefit Pay', 199, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('22-MAY-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('10:10:00', 'HH24:MI:SS'), 'Cash', 88, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('14-JUN-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('11:11:00', 'HH24:MI:SS'), 'Card', 177.3, 'Pending');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('22-JUL-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('14:30:00', 'HH24:MI:SS'), 'Cash', 450.5, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('01-AUG-2023', 'DD-MON-YYYY'), TO_TIMESTAMP('18:15:00', 'HH24:MI:SS'), 'Card', 390, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('22-SEP-2024', 'DD-MON-YYYY'), TO_TIMESTAMP('16:40:00', 'HH24:MI:SS'), 'Apple Pay', 210.25, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('06-OCT-2023', 'DD-MON-YYYY'), TO_TIMESTAMP('07:50:00', 'HH24:MI:SS'), 'Cash', 100, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('22-NOV-2024', 'DD-MON-YYYY'), TO_TIMESTAMP('20:00:00', 'HH24:MI:SS'), 'Card', 175.7, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('08-DEC-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('12:35:00', 'HH24:MI:SS'), 'Apple Pay', 305.3, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('22-JAN-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('09:05:00', 'HH24:MI:SS'), 'Cash', 500.2, 'Pending');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('04-MAR-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('08:45:00', 'HH24:MI:SS'), 'Apple Pay', 130., 'Pending');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('10-JUL-2022', 'DD-MON-YYYY'), TO_TIMESTAMP('13:55:00', 'HH24:MI:SS'), 'Card', 215, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('01-NOV-2023', 'DD-MON-YYYY'), TO_TIMESTAMP('18:30:00', 'HH24:MI:SS'), 'Cash', 98.99, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('17-FEB-2025', 'DD-MON-YYYY'), TO_TIMESTAMP('07:15:00', 'HH24:MI:SS'), 'Benefit Pay', 401.75, 'Pending');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('11-APR-2025', 'DD-MON-YYYY'), TO_TIMESTAMP('12:25:00', 'HH24:MI:SS'), 'Card', 320, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('28-MAY-2024', 'DD-MON-YYYY'), TO_TIMESTAMP('10:50:00', 'HH24:MI:SS'), 'Cash', 59, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('19-JUN-2024', 'DD-MON-YYYY'), TO_TIMESTAMP('14:05:00', 'HH24:MI:SS'), 'Benefit Pay', 270, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('06-AUG-2024', 'DD-MON-YYYY'), TO_TIMESTAMP('19:00:00', 'HH24:MI:SS'), 'Card', 190, 'Pending');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('13-SEP-2024', 'DD-MON-YYYY'), TO_TIMESTAMP('11:00:00', 'HH24:MI:SS'), 'Cash', 380, 'Paid');
INSERT INTO PAYMENT (paymentdate, paymenttime, paymentmethod, paymentamount, paymentStatus) VALUES (TO_DATE('24-OCT-2024', 'DD-MON-YYYY'), TO_TIMESTAMP('16:10:00', 'HH24:MI:SS'), 'Benefit Pay', 125.75, 'Paid');


desc LOCATION;
select * from LOCATION;
INSERT INTO LOCATION (address, cityName, phoneNumber) VALUES ('Building 10, Road 5, Block 1', 'Manama', '31234567');
INSERT INTO LOCATION (address, cityName, phoneNumber) VALUES ('Building 20, Road 12, Block 2', 'Riffa', '39284756');
INSERT INTO LOCATION (address, cityName, phoneNumber) VALUES ('Building 30, Road 7, Block 3', 'Muharraq', '35396712');
INSERT INTO LOCATION (address, cityName, phoneNumber) VALUES ('Building 40, Road 8, Block 4', 'Sitra', '37918423');
INSERT INTO LOCATION (address, cityName, phoneNumber) VALUES ('Building 50, Road 9, Block 5', 'Hamad Town', '38576249');


select * from CAR_CATEGORY;
INSERT INTO CAR_CATEGORY (carCategoryName, carCategoryDescription) VALUES ('Economy', 'Compact and fuel efficient vehicles');
INSERT INTO CAR_CATEGORY (carCategoryName, carCategoryDescription) VALUES ('Compact', 'Smaller cars ideal for city driving');
INSERT INTO CAR_CATEGORY (carCategoryName, carCategoryDescription) VALUES ('Mid-size', 'Comfortable vehicles with ample space');
INSERT INTO CAR_CATEGORY (carCategoryName, carCategoryDescription) VALUES ('Full-size', 'Spacious and powerful cars suitable for families');
INSERT INTO CAR_CATEGORY (carCategoryName, carCategoryDescription) VALUES ('Luxury', 'High-end vehicles with premium features');
INSERT INTO CAR_CATEGORY (carCategoryName, carCategoryDescription) VALUES ('SUV', 'Sport Utility Vehicles for various terrains');
INSERT INTO CAR_CATEGORY (carCategoryName, carCategoryDescription) VALUES ('Convertible', 'Cars with retractable roofs for open-air driving');
INSERT INTO CAR_CATEGORY (carCategoryName, carCategoryDescription) VALUES ('Minivan', 'Spacious vehicles for families and cargo');


select * from MANUFACTURER;
INSERT INTO MANUFACTURER (manufacturerName) VALUES ('Toyota');
INSERT INTO MANUFACTURER (manufacturerName) VALUES ('Honda');
INSERT INTO MANUFACTURER (manufacturerName) VALUES ('Ford');
INSERT INTO MANUFACTURER (manufacturerName) VALUES ('BMW');
INSERT INTO MANUFACTURER (manufacturerName) VALUES ('Mercedes');
INSERT INTO MANUFACTURER (manufacturerName) VALUES ('Nissan');
INSERT INTO MANUFACTURER (manufacturerName) VALUES ('Hyundai');
INSERT INTO MANUFACTURER (manufacturerName) VALUES ('Kia');

select * from model;
INSERT INTO MODEL (manufacturerID, modelName, engineSize) VALUES (1, 'Corolla', 1.8); 
INSERT INTO MODEL (manufacturerID, modelName, engineSize) VALUES (2, 'Civic', 2.0); 
INSERT INTO MODEL (manufacturerID, modelName, engineSize) VALUES (3, 'Mustang', 5.0); 
INSERT INTO MODEL (manufacturerID, modelName, engineSize) VALUES (4, 'X5', 3.0); 
INSERT INTO MODEL (manufacturerID, modelName, engineSize) VALUES (5, 'E-Class', 3.5); 
INSERT INTO MODEL (manufacturerID, modelName, engineSize) VALUES (6, 'Altima', 2.5); 
INSERT INTO MODEL (manufacturerID, modelName, engineSize) VALUES (7, 'Sonata', 2.4); 
INSERT INTO MODEL (manufacturerID, modelName, engineSize) VALUES (8, 'Optima', 2.4); 


truncate table car;
select * from car;
INSERT INTO CAR (modelID, carCategoryID, registrationPlateNumber, carRegistrationDueDate, yearManufactured, colour, currentMileage, dailyHireRate, dailyLateReturnPenalty, carStatus, carCondition, carCapacity) VALUES (1, 1, 'ABC123', TO_DATE('2025-12-15', 'YYYY-MM-DD'), 2020, 'Red', 15000, 50, 15, 'Available', 'New', 5); 
INSERT INTO CAR (modelID, carCategoryID, registrationPlateNumber, carRegistrationDueDate, yearManufactured, colour, currentMileage, dailyHireRate, dailyLateReturnPenalty, carStatus, carCondition, carCapacity) VALUES (2, 2, 'XYZ234', TO_DATE('2025-06-10', 'YYYY-MM-DD'), 2021, 'Blue', 12000, 60, 20, 'Available', 'New', 5); 
INSERT INTO CAR (modelID, carCategoryID, registrationPlateNumber, carRegistrationDueDate, yearManufactured, colour, currentMileage, dailyHireRate, dailyLateReturnPenalty, carStatus, carCondition, carCapacity) VALUES (3, 3, 'LMN345', TO_DATE('2024-10-30', 'YYYY-MM-DD'), 2022, 'Black', 5000, 80, 25, 'Available', 'New', 2);
INSERT INTO CAR (modelID, carCategoryID, registrationPlateNumber, carRegistrationDueDate, yearManufactured, colour, currentMileage, dailyHireRate, dailyLateReturnPenalty, carStatus, carCondition, carCapacity) VALUES (4, 4, 'GHI456', TO_DATE('2025-05-12', 'YYYY-MM-DD'), 2021, 'White', 7000, 90, 30, 'Available', 'New', 7); 
INSERT INTO CAR (modelID, carCategoryID, registrationPlateNumber, carRegistrationDueDate, yearManufactured, colour, currentMileage, dailyHireRate, dailyLateReturnPenalty, carStatus, carCondition, carCapacity) VALUES (5, 1, 'JKL567', TO_DATE('2025-02-28', 'YYYY-MM-DD'), 2020, 'Silver', 18000, 70, 18, 'Available', 'Used', 5); 
INSERT INTO CAR (modelID, carCategoryID, registrationPlateNumber, carRegistrationDueDate, yearManufactured, colour, currentMileage, dailyHireRate, dailyLateReturnPenalty, carStatus, carCondition, carCapacity) VALUES (6, 2, 'DEF678', TO_DATE('2025-08-23', 'YYYY-MM-DD'), 2021, 'Green', 10000, 55, 16, 'Available', 'New', 5); 
INSERT INTO CAR (modelID, carCategoryID, registrationPlateNumber, carRegistrationDueDate, yearManufactured, colour, currentMileage, dailyHireRate, dailyLateReturnPenalty, carStatus, carCondition, carCapacity) VALUES (7, 3, 'PQR890', TO_DATE('2025-04-05', 'YYYY-MM-DD'), 2023, 'Grey', 2000, 75, 22, 'Available', 'New', 5);
INSERT INTO CAR (modelID, carCategoryID, registrationPlateNumber, carRegistrationDueDate, yearManufactured, colour, currentMileage, dailyHireRate, dailyLateReturnPenalty, carStatus, carCondition, carCapacity) VALUES (8, 4, 'STU901', TO_DATE('2025-11-25', 'YYYY-MM-DD'), 2021, 'Yellow', 8000, 85, 28, 'Available', 'New', 7);


select * from INSURANCE;
INSERT INTO INSURANCE (carID, validityStartDate, validityEndDate, insuranceType, insuranceAmount, insuranceProvider) VALUES (1, TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2026-01-01', 'YYYY-MM-DD'), 'Comprehensive', 500, 'Allianz');
INSERT INTO INSURANCE (carID, validityStartDate, validityEndDate, insuranceType, insuranceAmount, insuranceProvider) VALUES (2, TO_DATE('2025-02-01', 'YYYY-MM-DD'), TO_DATE('2026-02-01', 'YYYY-MM-DD'), 'Third-Party', 350, 'AIG');
INSERT INTO INSURANCE (carID, validityStartDate, validityEndDate, insuranceType, insuranceAmount, insuranceProvider) VALUES (3, TO_DATE('2025-03-01', 'YYYY-MM-DD'), TO_DATE('2026-03-01', 'YYYY-MM-DD'), 'Comprehensive', 600, 'Zurich');
INSERT INTO INSURANCE (carID, validityStartDate, validityEndDate, insuranceType, insuranceAmount, insuranceProvider) VALUES (4, TO_DATE('2025-04-01', 'YYYY-MM-DD'), TO_DATE('2026-04-01', 'YYYY-MM-DD'), 'Third-Party', 400, 'AXA');
INSERT INTO INSURANCE (carID, validityStartDate, validityEndDate, insuranceType, insuranceAmount, insuranceProvider) VALUES (5, TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2026-05-01', 'YYYY-MM-DD'), 'Comprehensive', 550, 'MetLife');
INSERT INTO INSURANCE (carID, validityStartDate, validityEndDate, insuranceType, insuranceAmount, insuranceProvider) VALUES (6, TO_DATE('2025-06-01', 'YYYY-MM-DD'), TO_DATE('2026-06-01', 'YYYY-MM-DD'), 'Third-Party', 300, 'StateFarm');
INSERT INTO INSURANCE (carID, validityStartDate, validityEndDate, insuranceType, insuranceAmount, insuranceProvider) VALUES (7, TO_DATE('2025-07-01', 'YYYY-MM-DD'), TO_DATE('2026-07-01', 'YYYY-MM-DD'), 'Comprehensive', 650, 'Progressive');
INSERT INTO INSURANCE (carID, validityStartDate, validityEndDate, insuranceType, insuranceAmount, insuranceProvider) VALUES (8, TO_DATE('2025-08-01', 'YYYY-MM-DD'), TO_DATE('2026-08-01', 'YYYY-MM-DD'), 'Third-Party', 370, 'Geico');


select * from CAR_MAINTENANCE;
INSERT INTO CAR_MAINTENANCE (carID, startDate, endDate, maintenanceStatus, maintenanceAmount, maintenanceTime) VALUES (1, TO_DATE('2025-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-12', 'YYYY-MM-DD'), 'Completed', '200', '2 days');
INSERT INTO CAR_MAINTENANCE (carID, startDate, endDate, maintenanceStatus, maintenanceAmount, maintenanceTime) VALUES (2, TO_DATE('2025-02-15', 'YYYY-MM-DD'), TO_DATE('2025-02-17', 'YYYY-MM-DD'), 'Completed', '180', '1.5 days');
INSERT INTO CAR_MAINTENANCE (carID, startDate, endDate, maintenanceStatus, maintenanceAmount, maintenanceTime) VALUES (3, TO_DATE('2025-03-20', 'YYYY-MM-DD'), TO_DATE('2025-03-22', 'YYYY-MM-DD'), 'In Progress', '250', '3 days');
INSERT INTO CAR_MAINTENANCE (carID, startDate, endDate, maintenanceStatus, maintenanceAmount, maintenanceTime) VALUES (4, TO_DATE('2025-04-05', 'YYYY-MM-DD'), TO_DATE('2025-04-07', 'YYYY-MM-DD'), 'Completed', '220', '2 days');
INSERT INTO CAR_MAINTENANCE (carID, startDate, endDate, maintenanceStatus, maintenanceAmount, maintenanceTime) VALUES (5, TO_DATE('2025-05-10', 'YYYY-MM-DD'), TO_DATE('2025-05-12', 'YYYY-MM-DD'), 'Completed', '270', '2 days');
INSERT INTO CAR_MAINTENANCE (carID, startDate, endDate, maintenanceStatus, maintenanceAmount, maintenanceTime) VALUES (6, TO_DATE('2025-06-15', 'YYYY-MM-DD'), TO_DATE('2025-06-17', 'YYYY-MM-DD'), 'In Progress', '300', '2 days');
INSERT INTO CAR_MAINTENANCE (carID, startDate, endDate, maintenanceStatus, maintenanceAmount, maintenanceTime) VALUES (7, TO_DATE('2025-07-05', 'YYYY-MM-DD'), TO_DATE('2025-07-07', 'YYYY-MM-DD'), 'Completed', '280', '2 days');
INSERT INTO CAR_MAINTENANCE (carID, startDate, endDate, maintenanceStatus, maintenanceAmount, maintenanceTime) VALUES (8, TO_DATE('2025-08-12', 'YYYY-MM-DD'), TO_DATE('2025-08-14', 'YYYY-MM-DD'), 'Completed', '240', '2 days');


INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (101, 12, 202);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (102, 15, 305);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (103, 18, 408);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (104, 10, 503);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (105, 22, 610);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (106, 25, 703);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (107, 30, 810);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (108, 35, 915);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (109, 40, 1020);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (110, 45, 1125);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (111, 50, 1230);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (112, 55, 1335);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (113, 60, 1440);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (114, 65, 1545);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (115, 70, 1650);
INSERT INTO ADDRESS (blockNo, roadNo, buildingNo) VALUES (116, 75, 1755);


select * from employee;
INSERT INTO employee (positionid, addressid, cpr, firstname, lastname, nationality, email, dateofbirth, gender, phonenumber) VALUES (1, 1, '899873276', 'Ali ', 'Aqeel', 'Bahraini', 'aliaqeel@gmail.com', '26-JUN-1989', 'male', 33695593);
INSERT INTO employee (positionid, addressid, cpr, firstname, lastname, nationality, email, dateofbirth, gender, phonenumber) VALUES (2, 2, '990976543', 'Sara', 'Salman', 'Bahraini', 'sarasalman@gmail.com', '14-SEP-1999', 'female', 39275543);
INSERT INTO employee (positionid, addressid, cpr, firstname, lastname, nationality, email, dateofbirth, gender, phonenumber) VALUES (3, 3, '990144555', 'Yousif', 'Isa', 'Bahraini', 'yousifsalman@gmail.com', '18-JAN-1999', 'male', 66008625);
INSERT INTO employee (positionid, addressid, cpr, firstname, lastname, nationality, email, dateofbirth, gender, phonenumber) VALUES (4, 4, '961133286', 'Bassem', 'Aymen', 'Bahraini', 'bassemaymen@gmail.com', '09-NOV-1996', 'male', 32225500);
INSERT INTO employee (positionid, addressid, cpr, firstname, lastname, nationality, email, dateofbirth, gender, phonenumber) VALUES (5, 5, '066975332', 'Rana', 'Adam', 'Bahraini', 'ranaadam@gmail.com', '23-MAY-2006', 'male', 34286513);
INSERT INTO employee (positionid, addressid, cpr, firstname, lastname, nationality, email, dateofbirth, gender, phonenumber) VALUES (6, 6, '867744243', 'Layla', 'Khalid', 'Bahraini', 'laylakhalid@gmail.com', '11-MAR-1986', 'female', 66773429);
INSERT INTO employee (positionid, addressid, cpr, firstname, lastname, nationality, email, dateofbirth, gender, phonenumber) VALUES (7, 7, '882246683', 'Isa', 'Abdallah', 'Bahraini', 'isaabdallah@gmail.com', '27-JAN-1988', 'female', 66773429);
INSERT INTO employee (positionid, addressid, cpr, firstname, lastname, nationality, email, dateofbirth, gender, phonenumber) VALUES (8, 8, '951273561', 'Mona', 'Mohammed', 'Bahraini', 'monamohammed@gmail.com', '30-DEC-1995', 'female', 36662923);


select * from EXTRA_EQUIPMENT;
desc EXTRA_EQUIPMENT;
INSERT INTO EXTRA_EQUIPMENT (equipmentTypeID, employeeID, extraEquipmentName, extraEquipmentDescription, dailyRentalPrice, extraEquipmentStatus) VALUES (1, 2, 'Navigator', 'Advanced GPS device', 5, 'Available');
INSERT INTO EXTRA_EQUIPMENT (equipmentTypeID, employeeID, extraEquipmentName, extraEquipmentDescription, dailyRentalPrice, extraEquipmentStatus) VALUES (2, 2, 'BabySeat', 'Toddler car seat', 4.5, 'In Use');
INSERT INTO EXTRA_EQUIPMENT (equipmentTypeID, employeeID, extraEquipmentName, extraEquipmentDescription, dailyRentalPrice, extraEquipmentStatus) VALUES (3, 2, 'Hotspot', 'Mobile Wi-Fi router', 6, 'Available');
INSERT INTO EXTRA_EQUIPMENT (equipmentTypeID, employeeID, extraEquipmentName, extraEquipmentDescription, dailyRentalPrice, extraEquipmentStatus) VALUES (4, 2, 'MiniFridge', 'Travel cooler box', 7, 'Available');
INSERT INTO EXTRA_EQUIPMENT (equipmentTypeID, employeeID, extraEquipmentName, extraEquipmentDescription, dailyRentalPrice, extraEquipmentStatus) VALUES (5, 2, 'CargoRack', 'Heavy-duty roof rack', 3.5, 'Available');
INSERT INTO EXTRA_EQUIPMENT (equipmentTypeID, employeeID, extraEquipmentName, extraEquipmentDescription, dailyRentalPrice, extraEquipmentStatus) VALUES (6, 2, 'CamRecorder', 'HD dash camera', 4.0, 'Available');
INSERT INTO EXTRA_EQUIPMENT (equipmentTypeID, employeeID, extraEquipmentName, extraEquipmentDescription, dailyRentalPrice, extraEquipmentStatus) VALUES (7, 2, 'AidBox', 'Emergency first aid kit', 2.5, 'In Use');
INSERT INTO EXTRA_EQUIPMENT (equipmentTypeID, employeeID, extraEquipmentName, extraEquipmentDescription, dailyRentalPrice, extraEquipmentStatus) VALUES (8, 2, 'TollPass', 'Automatic toll device', 3, 'Available');

select * from customer;
desc customer;
INSERT INTO customer (addressid, cpr_or_passport, firstname, lastname, username, nationality, email, dateofbirth, gender, phonenumber) VALUES (9, '010312594', 'Fatima', 'Mohd', 'fmohd', 'Bahraini', 'fatimamohd1@gmail.com', '03-MAR-2001', 'female' , 37771234);
INSERT INTO customer (addressid, cpr_or_passport, firstname, lastname, username, nationality, email, dateofbirth, gender, phonenumber) VALUES (10, '910444687', 'Noor', 'Ahmed', '_noor77', 'Bahraini', 'noor77@gmail.com', '15-APR-1991', 'female' , 66194292);
INSERT INTO customer (addressid, cpr_or_passport, firstname, lastname, username, nationality, email, dateofbirth, gender, phonenumber) VALUES (11, 'A53347821', 'Emma', 'Beeston', 'emmabee', 'American', 'emmabee@hotmail.com', '07-SEP-2001', 'female' , 36694040);
INSERT INTO customer (addressid, cpr_or_passport, firstname, lastname, username, nationality, email, dateofbirth, gender, phonenumber) VALUES (12, 'B87564321', 'John', 'Ernst', 'johnernst', 'British', 'johnernst@gmail.com', '19-OCT-1991', 'male' , 39998213);
INSERT INTO customer (addressid, cpr_or_passport, firstname, lastname, username, nationality, email, dateofbirth, gender, phonenumber) VALUES (13, '020211888', 'Zahra', 'Ali', 'zahra2002', 'Bahraini', 'zahra02@gmail.com', '9-FEB-2002', 'female' , 33193315);
INSERT INTO customer (addressid, cpr_or_passport, firstname, lastname, username, nationality, email, dateofbirth, gender, phonenumber) VALUES (14, 'A47289031', 'Kevin', 'Olson', 'kevols', 'American', 'kevols@hotmail.com', '14-FEB-2003', 'male' , 39120722);
INSERT INTO customer (addressid, cpr_or_passport, firstname, lastname, username, nationality, email, dateofbirth, gender, phonenumber) VALUES (15, 'CA789012', 'Lucas', 'Patel', 'lucasp', 'Canadian', 'lucasp@gmail.com', '18-MAR-1999', 'male', 38929113);
INSERT INTO customer (addressid, cpr_or_passport, firstname, lastname, username, nationality, email, dateofbirth, gender, phonenumber) VALUES (16, '970987654', 'Rashid', 'Ebrahim', 'rashidebr', 'Bahraini', 'rashidebrahim@gmail.com', '14-SEP-1997', 'male' , 33563326);


select * from LICENSE;
INSERT INTO LICENSE (customerId, licenseNumber, licenseType, issueDate, expiryDate, issuingCountry, licenseStatus) VALUES (1, 'LN12345', 'Standard', TO_DATE('2020-06-22', 'YYYY-MM-DD'), TO_DATE('2025-06-22', 'YYYY-MM-DD'), 'Bahrain', 'Active');
INSERT INTO LICENSE (customerId, licenseNumber, licenseType, issueDate, expiryDate, issuingCountry, licenseStatus) VALUES (2, 'LN12346', 'Provisional', TO_DATE('2021-07-15', 'YYYY-MM-DD'), TO_DATE('2026-07-15', 'YYYY-MM-DD'), 'Canada', 'Active');
INSERT INTO LICENSE (customerId, licenseNumber, licenseType, issueDate, expiryDate, issuingCountry, licenseStatus) VALUES (3, 'LN12347', 'Standard', TO_DATE('2021-08-10', 'YYYY-MM-DD'), TO_DATE('2025-08-10', 'YYYY-MM-DD'), 'Bahrain', 'Expired');
INSERT INTO LICENSE (customerId, licenseNumber, licenseType, issueDate, expiryDate, issuingCountry, licenseStatus) VALUES (4, 'LN12348', 'Standard', TO_DATE('2020-01-20', 'YYYY-MM-DD'), TO_DATE('2027-01-20', 'YYYY-MM-DD'), 'Bahrain', 'Active');
INSERT INTO LICENSE (customerId, licenseNumber, licenseType, issueDate, expiryDate, issuingCountry, licenseStatus) VALUES (5, 'LN12349', 'Standard', TO_DATE('2021-05-22', 'YYYY-MM-DD'), TO_DATE('2026-05-22', 'YYYY-MM-DD'), 'Germany', 'Active');
INSERT INTO LICENSE (customerId, licenseNumber, licenseType, issueDate, expiryDate, issuingCountry, licenseStatus) VALUES (6, 'LN12350', 'Provisional', TO_DATE('2021-11-11', 'YYYY-MM-DD'), TO_DATE('2026-11-11', 'YYYY-MM-DD'), 'Bahrain', 'Active');
INSERT INTO LICENSE (customerId, licenseNumber, licenseType, issueDate, expiryDate, issuingCountry, licenseStatus) VALUES (7, 'LN12351', 'Standard', TO_DATE('2021-03-09', 'YYYY-MM-DD'), TO_DATE('2027-03-09', 'YYYY-MM-DD'), 'US', 'Active');
INSERT INTO LICENSE (customerId, licenseNumber, licenseType, issueDate, expiryDate, issuingCountry, licenseStatus) VALUES (8, 'LN12352', 'Standard', TO_DATE('2021-12-01', 'YYYY-MM-DD'), TO_DATE('2025-12-01', 'YYYY-MM-DD'), 'Japan', 'Expired');


select * from RESERVATION;
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (1, 1, 1, 2, TO_DATE('22-JUN-2022', 'DD-MON-YYYY'), TO_DATE('23-JUN-2022', 'DD-MON-YYYY'), TO_DATE('30-JUN-2022', 'DD-MON-YYYY'), 'Muharraq', 'Muharraq', 'Completed');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (2, 2, 2, 2, TO_DATE('15-JUL-2022', 'DD-MON-YYYY'), TO_DATE('16-JUL-2022', 'DD-MON-YYYY'), TO_DATE('23-JUL-2022', 'DD-MON-YYYY'), 'Muharraq', 'Muharraq', 'Canceled');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (3, 3, 3, 2, TO_DATE('22-AUG-2022', 'DD-MON-YYYY'), TO_DATE('23-AUG-2022', 'DD-MON-YYYY'), TO_DATE('30-AUG-2022', 'DD-MON-YYYY'), 'Riffa', 'Riffa', 'Ongoing');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (4, 4, 4, 2, TO_DATE('09-SEP-2022', 'DD-MON-YYYY'), TO_DATE('10-SEP-2022', 'DD-MON-YYYY'), TO_DATE('20-SEP-2022', 'DD-MON-YYYY'), 'Sitra', 'Riffa', 'Completed');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (5, 5, 5, 2, TO_DATE('22-OCT-2022', 'DD-MON-YYYY'), TO_DATE('23-OCT-2022', 'DD-MON-YYYY'), TO_DATE('30-OCT-2022', 'DD-MON-YYYY'), 'Sitra', 'Sitra', 'Completed');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (6, 6, 6, 2, TO_DATE('12-NOV-2022', 'DD-MON-YYYY'), TO_DATE('13-NOV-2022', 'DD-MON-YYYY'), TO_DATE('20- NOV-2022', 'DD-MON-YYYY'), 'Sitra', 'Muharraq', 'Cancelled');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (7, 7, 7, 6, TO_DATE('22-DEC-2022', 'DD-MON-YYYY'), TO_DATE('23-DEC-2022', 'DD-MON-YYYY'), TO_DATE('30-DEC-2022', 'DD-MON-YYYY'), 'Riffa', 'Riffa', 'Completed');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (8, 8, 8, 6, TO_DATE('05-JAN-2022', 'DD-MON-YYYY'), TO_DATE('06-JAN-2022', 'DD-MON-YYYY'), TO_DATE('12-JAN-2022', 'DD-MON-YYYY'), 'Riffa', 'Riffa', 'Ongoing');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (1, 9, 1, 6, TO_DATE('18-FEB-2022', 'DD-MON-YYYY'), TO_DATE('19-FEB-2022', 'DD-MON-YYYY'), TO_DATE('26-FEB-2022', 'DD-MON-YYYY'), 'Riffa', 'Sitra', 'Cancelled');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (2, 10, 2, 6, TO_DATE('22-MAR-2022', 'DD-MON-YYYY'), TO_DATE('23-MAR-2022', 'DD-MON-YYYY'), TO_DATE('29-MAR-2022', 'DD-MON-YYYY'), 'Riffa', 'Sitra', 'Completed');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (3, 11, 3, 6, TO_DATE('02-APR-2022', 'DD-MON-YYYY'), TO_DATE('03-APR-2022', 'DD-MON-YYYY'), TO_DATE('10-APR-2022', 'DD-MON-YYYY'), 'Manama', 'Manama', 'Completed');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (4, 12, 4, 6, TO_DATE('22-MAY-2022', 'DD-MON-YYYY'), TO_DATE('23-MAY-2022', 'DD-MON-YYYY'), TO_DATE('30-MAY-2022', 'DD-MON-YYYY'), 'Manama', 'Manama', 'Ongoing');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (5, 13, 5, 6, TO_DATE('14-JUN-2022', 'DD-MON-YYYY'), TO_DATE('15-JUN-2022', 'DD-MON-YYYY'), TO_DATE('22-JUN-2022', 'DD-MON-YYYY'), 'Manama', 'Manama', 'Cancelled');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (6, 14, 6, 6, TO_DATE('22-JUL-2022', 'DD-MON-YYYY'), TO_DATE('23-JUL-2022', 'DD-MON-YYYY'), TO_DATE('29-JUL-2022', 'DD-MON-YYYY'), 'Manama', 'Manama', 'Completed');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (1, 15, 7, 6, TO_DATE('01-AUG-2023', 'DD-MON-YYYY'), TO_DATE('15-AUG-2023', 'DD-MON-YYYY'), TO_DATE('15-SEP-2023', 'DD-MON-YYYY'), 'Hamad Town', 'Hamad Town', 'Ongoing');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (2, 16, 8, 6, TO_DATE('22-SEP-2024', 'DD-MON-YYYY'), TO_DATE('06-OCT-2024', 'DD-MON-YYYY'), TO_DATE('06-NOV-2024', 'DD-MON-YYYY'), 'Hamad Town', 'Hamad Town', 'Completed');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (3, 17, 1, 2, TO_DATE('06-OCT-2023', 'DD-MON-YYYY'), TO_DATE('20-OCT-2023', 'DD-MON-YYYY'), TO_DATE('20-NOV-2023', 'DD-MON-YYYY'), 'Hamad Town', 'Hamad Town', 'Cancelled');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (4, 18, 2, 2, TO_DATE('22-NOV-2024', 'DD-MON-YYYY'), TO_DATE('06-DEC-2024', 'DD-MON-YYYY'), TO_DATE('06-JAN-2025', 'DD-MON-YYYY'), 'Riffa', 'Riffa', 'Completed');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (5, 19, 3, 2, TO_DATE('08-DEC-2022', 'DD-MON-YYYY'), TO_DATE('22-DEC-2022', 'DD-MON-YYYY'), TO_DATE('22-JAN-2023', 'DD-MON-YYYY'), 'Riffa', 'Riffa', 'Ongoing');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (6, 20, 4, 6, TO_DATE('22-JAN-2022', 'DD-MON-YYYY'), TO_DATE('05-FEB-2022', 'DD-MON-YYYY'), TO_DATE('05-MAR-2022', 'DD-MON-YYYY'), 'Sitra', 'Sitra', 'Cancelled');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (7, 21, 5, 6, TO_DATE('04-MAR-2022', 'DD-MON-YYYY'), TO_DATE('18-MAR-2022', 'DD-MON-YYYY'), TO_DATE('18-APR-2022', 'DD-MON-YYYY'), 'Sitra', 'Sitra', 'Completed');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (8, 22, 6, 6, TO_DATE('10-JUL-2022', 'DD-MON-YYYY'), TO_DATE('24-JUL-2022', 'DD-MON-YYYY'), TO_DATE('24-AUG-2022', 'DD-MON-YYYY'), 'Muharraq', 'Muharraq', 'Ongoing');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (1, 23, 7, 6, TO_DATE('01-NOV-2023', 'DD-MON-YYYY'), TO_DATE('15-NOV-2023', 'DD-MON-YYYY'), TO_DATE('15-DEC-2023', 'DD-MON-YYYY'), 'Muharraq', 'Muharraq', 'Cancelled');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (2, 24, 8, 6, TO_DATE('17-FEB-2025', 'DD-MON-YYYY'), TO_DATE('03-MAR-2025', 'DD-MON-YYYY'), TO_DATE('03-APR-2025', 'DD-MON-YYYY'), 'Sharjah', 'Abu Dhabi', 'Pending');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (3, 25, 1, 6, TO_DATE('11-APR-2025', 'DD-MON-YYYY'), TO_DATE('25-APR-2025', 'DD-MON-YYYY'), TO_DATE('25-MAY-2025', 'DD-MON-YYYY'), 'Sitra', 'Muharraq', 'Paid');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (4, 26, 2, 6, TO_DATE('28-MAY-2024', 'DD-MON-YYYY'), TO_DATE('11-JUN-2024', 'DD-MON-YYYY'), TO_DATE('11-JUL-2024', 'DD-MON-YYYY'), 'Sitra', 'Muharraq', 'Paid');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (5, 27, 3, 6, TO_DATE('19-JUN-2024', 'DD-MON-YYYY'), TO_DATE('03-JUL-2024', 'DD-MON-YYYY'), TO_DATE('03-AUG-2024', 'DD-MON-YYYY'), 'Hamad Town', 'Hamad Town', 'Paid');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (6, 28, 4, 2, TO_DATE('06-AUG-2024', 'DD-MON-YYYY'), TO_DATE('20-AUG-2024', 'DD-MON-YYYY'), TO_DATE('20-SEP-2024', 'DD-MON-YYYY'), 'Hamad Town', 'Hamad Town', 'Pending');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (7, 29, 5, 2, TO_DATE('13-SEP-2024', 'DD-MON-YYYY'), TO_DATE('27-SEP-2024', 'DD-MON-YYYY'), TO_DATE('27-OCT-2024', 'DD-MON-YYYY'), 'Hamad Town', 'Manama', 'Paid');
INSERT INTO RESERVATION (customerID, paymentID, carID, employeeID, ReservationDate, pickUpDate, returnDate, pickUpLocation, returnLocation, reservationStatus) VALUES (8, 30, 6, 2, TO_DATE('24-OCT-2024', 'DD-MON-YYYY'), TO_DATE('07-NOV-2024', 'DD-MON-YYYY'), TO_DATE('07-DEC-2024', 'DD-MON-YYYY'), 'Hamad Town', 'Manama', 'Paid');


select * from CUSTOMER_PROMOTION;
INSERT INTO CUSTOMER_PROMOTION (customerid, promotionid) VALUES (5,6);
INSERT INTO CUSTOMER_PROMOTION (customerid, promotionid) VALUES (3,5);
INSERT INTO CUSTOMER_PROMOTION (customerid, promotionid) VALUES (1,3);
INSERT INTO CUSTOMER_PROMOTION (customerid, promotionid) VALUES (4,2);
INSERT INTO CUSTOMER_PROMOTION (customerid, promotionid) VALUES (8,3);
INSERT INTO CUSTOMER_PROMOTION (customerid, promotionid) VALUES (3,1);



select * from car_rental;
desc car_rental;
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (1, 2, 1, 1,7, 350.00, 'Completed', TO_DATE('23-JUN-2022', 'DD-MON-YYYY'), TO_DATE('30-JUN-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration,rentalCost, status, rentalStartDate, rentalEndDate) VALUES (3, 2, 3, 2,7,350.00, 'Completed', TO_DATE('23-AUG-2022', 'DD-MON-YYYY'), TO_DATE('30-AUG-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (4, 2, 4, 3,10, 500.00, 'Completed', TO_DATE('10-SEP-2022', 'DD-MON-YYYY'), TO_DATE('20-SEP-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (5, 2, 5, 3,7, 350.00, 'Completed', TO_DATE('23-OCT-2022', 'DD-MON-YYYY'), TO_DATE('30-OCT-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (7, 6, 7, 2,7, 350.00, 'Completed', TO_DATE('23-DEC-2022', 'DD-MON-YYYY'), TO_DATE('30-DEC-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (8, 6, 8, 2,6, 300.00, 'Completed', TO_DATE('06-JAN-2022', 'DD-MON-YYYY'), TO_DATE('12-JAN-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (2, 6, 2, 3,6, 300.00, 'Completed', TO_DATE('23-MAR-2022', 'DD-MON-YYYY'), TO_DATE('29-MAR-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (3, 6, 3, 4,7, 350.00, 'Completed', TO_DATE('03-APR-2022', 'DD-MON-YYYY'), TO_DATE('10-APR-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID, rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (4, 6, 4, 4,7, 350.00, 'Completed', TO_DATE('23-MAY-2022', 'DD-MON-YYYY'), TO_DATE('30-MAY-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (6, 6, 6, 4,6, 300.00, 'Completed', TO_DATE('23-JUL-2022', 'DD-MON-YYYY'), TO_DATE('29-JUL-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (1, 6, 7, 5,31, 1550.00, 'Completed', TO_DATE('15-AUG-2023', 'DD-MON-YYYY'), TO_DATE('15-SEP-2023', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (2, 6, 8, 5,31, 1550.00, 'Completed', TO_DATE('06-OCT-2024', 'DD-MON-YYYY'), TO_DATE('06-NOV-2024', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (4, 2, 2, 2,31, 1550.00, 'Completed', TO_DATE('06-DEC-2024', 'DD-MON-YYYY'), TO_DATE('06-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (5, 2, 3, 2,31, 1550.00, 'Completed', TO_DATE('22-DEC-2022', 'DD-MON-YYYY'), TO_DATE('22-JAN-2023', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (7, 6, 5, 3,31, 1550.00, 'Completed', TO_DATE('18-MAR-2022', 'DD-MON-YYYY'), TO_DATE('18-APR-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (8, 6, 5, 3,31, 1550.00, 'Completed', TO_DATE('24-JUL-2022', 'DD-MON-YYYY'), TO_DATE('24-AUG-2022', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (2, 6, 1, 1,31, 1550.00, 'Completed', TO_DATE('03-MAR-2025', 'DD-MON-YYYY'), TO_DATE('03-JUN-2025', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (3, 2, 8, 1,30, 1500.00, 'Ongoing', TO_DATE('25-APR-2025', 'DD-MON-YYYY'), TO_DATE('25-AUG-2025', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (4, 2, 3, 2, 30, 1500.00, 'Completed', TO_DATE('11-JUN-2024', 'DD-MON-YYYY'), TO_DATE('11-JUL-2024', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (6, 2, 4, 2, 31, 1550.00, 'Completed', TO_DATE('03-JUL-2024', 'DD-MON-YYYY'), TO_DATE('03-AUG-2024', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (7, 6, 5, 3, 31, 1550.00, 'Completed', TO_DATE('20-AUG-2024', 'DD-MON-YYYY'), TO_DATE('20-SEP-2024', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID, rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (8, 6, 6, 3, 30, 1500.00, 'Completed', TO_DATE('27-SEP-2024', 'DD-MON-YYYY'), TO_DATE('27-OCT-2024', 'DD-MON-YYYY'));
INSERT INTO car_rental (customerID, employeeID, carID, locationID,rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate) VALUES (1, 2, 7, 4, 30, 1500.00, 'Completed', TO_DATE('07-NOV-2024', 'DD-MON-YYYY'), TO_DATE('07-DEC-2024', 'DD-MON-YYYY'));






select * from fine;
INSERT INTO fine (customerid, carRentalId, employeeid, fineamount, finereason, dateissued, duedate, paymentstatus) VALUES (4, 3, 2, 20, 'Delay in return car', '25-Jun-2022 ', '26-Jun-2022', 'Completed');
INSERT INTO fine (customerid, carRentalId, employeeid, fineamount, finereason, dateissued, duedate, paymentstatus) VALUES (5, 5, 6, 70, 'Car Scratch ', '29-Jun-2022',  '2-Jul-2022',  'Paid');
INSERT INTO fine (customerid, carRentalId, employeeid, fineamount, finereason, dateissued, duedate, paymentstatus) VALUES (3, 9, 6, 44, 'Lost Car Key', '19-Feb-2023', '20-Feb-2023', 'Pending');
INSERT INTO fine (customerid, carRentalId, employeeid, fineamount, finereason, dateissued, duedate, paymentstatus) VALUES (8, 15, 5, 33, 'Damaged property', '1-MAR-2023',  '3-MAR-2025', 'Overdue');
INSERT INTO fine (customerid, carRentalId, employeeid, fineamount, finereason, dateissued, duedate, paymentstatus) VALUES (6, 19, 6, 40, 'Tire Damage', '26-MAR-2025', '27-MAR-2025', 'Paid');
INSERT INTO fine (customerid, carRentalId, employeeid, fineamount, finereason, dateissued, duedate, paymentstatus) VALUES (6, 20, 2, 25, 'Dirty Car Seet', '03-JUL-2024', '03-AUG-2024', 'Pending');
INSERT INTO fine (customerid, carRentalId, employeeid, fineamount, finereason, dateissued, duedate, paymentstatus) VALUES (1, 23, 2, 30, 'Broken door handle', '10-MAY-2025', '11-MAY-2025', 'Paid');



select * from EQUIPMENT_RENTAL;
INSERT INTO EQUIPMENT_RENTAL (extraEquipmentID, carRentalID, quantity) VALUES (1, 1, 2);
INSERT INTO EQUIPMENT_RENTAL (extraEquipmentID, carRentalID, quantity) VALUES (2, 4, 1);
INSERT INTO EQUIPMENT_RENTAL (extraEquipmentID, carRentalID, quantity) VALUES (3, 5, 3);
INSERT INTO EQUIPMENT_RENTAL (extraEquipmentID, carRentalID, quantity) VALUES (4, 19, 1);
INSERT INTO EQUIPMENT_RENTAL (extraEquipmentID, carRentalID, quantity) VALUES (5, 6, 2);
INSERT INTO EQUIPMENT_RENTAL (extraEquipmentID, carRentalID, quantity) VALUES (6, 8, 1);
INSERT INTO EQUIPMENT_RENTAL (extraEquipmentID, carRentalID, quantity) VALUES (7, 13, 2);
INSERT INTO EQUIPMENT_RENTAL (extraEquipmentID, carRentalID, quantity) VALUES (8, 16, 3);
INSERT INTO EQUIPMENT_RENTAL (extraEquipmentID, carRentalID, quantity) VALUES (1, 20, 1);
INSERT INTO EQUIPMENT_RENTAL (extraEquipmentID, carRentalID, quantity) VALUES (3, 3, 2); 

commit;


-- DCL Script for creating users and granting and revoking system and object privileges 
--General account 
create user General_Admin identified by B2467; 
Create role general_account1; 
Grant Create Session,Create table, create view to general_account1; 
Grant general_account1 to General_Admin; 
Grant select,insert,update,delete on Customer to General_Admin; 
Grant select,insert,update,delete on Car to General_Admin; 
Grant select,insert,update,delete on model to General_Admin; 
Grant select,insert,update,delete on manufacturer to General_Admin; 
Grant select,insert,update,delete on Location to General_Admin; 
Grant select,insert,update,delete on employee to General_Admin; 
Grant select,insert,update,delete on Address to General_Admin; 
Grant select,insert,update,delete on Promotion to General_Admin; 
Grant select,insert,update,delete on customer_promotion to General_Admin; 
Grant select,insert,update,delete on equipment_rental to General_Admin; 
Grant select,insert,update,delete on equipment_type to General_Admin; 
Grant select,insert,update,delete on car_category to General_Admin; 
Grant select,insert,update,delete on extra_equipment to General_Admin; 
Grant select,insert,update,delete on car_maintenance to General_Admin; 
Grant select,insert,update,delete on car_rental to General_Admin; 
Grant select,insert,update,delete on Fine to General_Admin; 
Grant select,insert,update,delete on Reservation to General_Admin;
Grant select,insert,update,delete on payment to General_Admin; 
Grant select,insert,update,delete on position to General_Admin; 
Grant select,insert,update,delete on license to General_Admin; 
Grant select,insert,update,delete on insurance to General_Admin; 
Grant select on Most_Popular_Car_By_Location to General_Admin; 
Grant select,insert,update,delete on Monthly_Rentals_By_Location to General_Admin;


--Read only account
Create user Readonly_Manager identified by B2467; 
Grant create session, create table, create view to Readonly_manager; 
Grant select on Most_Popular_Car_By_Location to Readonly_manager; 
Grant select,insert,update on Monthly_Rentals_By_Location to Readonly_manager; 
Revoke create table,create view from Readonly_manager; 
Revoke insert, update on Monthly_Rentals_By_Location from Readonly_manager;


--DDL script for creating views 
--Views
-- View 1: Most Popular Car By Location
CREATE OR REPLACE VIEW Most_Popular_Car_By_Location AS
SELECT 
    L.cityName,
    M.modelName,
    COUNT(*) AS rentals_count
FROM 
    CAR_RENTAL CR
    JOIN LOCATION L ON CR.locationID = L.locationID
    JOIN CAR C ON CR.carID = C.carID
    JOIN MODEL M ON C.modelID = M.modelID
GROUP BY 
    L.cityName, M.modelName
HAVING 
    COUNT(*) = (
        SELECT MAX(model_count)
        FROM (
            SELECT 
                COUNT(*) AS model_count
            FROM 
                CAR_RENTAL CR2
                JOIN LOCATION L2 ON CR2.locationID = L2.locationID
                JOIN CAR C2 ON CR2.carID = C2.carID
                JOIN MODEL M2 ON C2.modelID = M2.modelID
            WHERE 
                L2.cityName = L.cityName
            GROUP BY 
                L2.cityName, M2.modelName
        )
);


SELECT * FROM Most_Popular_Car_By_Location;


-- View 2: Monthly Rentals By Location (June 2022)

CREATE OR REPLACE VIEW Monthly_Rentals_By_Location AS
SELECT 
    L.cityName,
    SUM(CR.rentalCost) AS total_rental_amount
FROM 
    CAR_RENTAL CR
    JOIN LOCATION L ON CR.locationID = L.locationID
WHERE 
    CR.rentalStartDate BETWEEN TO_DATE('2022-06-01', 'YYYY-MM-DD') AND TO_DATE('2022-06-30', 'YYYY-MM-DD')
GROUP BY 
    L.cityName
WITH READ ONLY;


SELECT * FROM Monthly_Rentals_By_Location;


-- DDL script for creating indexes 
-- Indexes

CREATE INDEX IDX_PROMO_ACTIVE_DATE 
ON PROMOTION(isActive, startDate, endDate);

CREATE INDEX IDX_POSIT_TITLE 
ON POSITION(positionTitle);

CREATE INDEX IDX_EMP_POSIT_ID 
ON EMPLOYEE(positionID);

CREATE INDEX IDX_EMP_NAME 
ON EMPLOYEE(firstName, lastName);

CREATE INDEX IDX_EQUIPTYPE_NAME
ON EQUIPMENT_TYPE(equipmentTypeName);

CREATE INDEX IDX_PAYMENT_DATE
ON PAYMENT(paymentDate);

CREATE INDEX IDX_EQUIP_RENTAL
ON EXTRA_EQUIPMENT(EXTRAEQUIPMENTSTATUS);

select * from EXTRA_EQUIPMENT;
CREATE INDEX IDX_LOCATION_CITY 
ON LOCATION(cityName);

CREATE INDEX IDX_CAR_CATEGORY_NAME 
ON CAR_CATEGORY(carCategoryName);

CREATE INDEX IDX_MANUFACTURER_NAME
ON MANUFACTURER(manufacturerName);

CREATE INDEX IDX_MODEL_MANUFACTURER 
ON MODEL(manufacturerID);

CREATE INDEX IDX_MODEL_NAME 
ON MODEL(modelName);

CREATE INDEX IDX_CAR_MODEL_CATEGORY 
ON CAR(modelID, carCategoryID);
CREATE UNIQUE INDEX IDX_CAR_PLATE 
ON CAR(registrationPlateNumber);

CREATE INDEX IDX_INSURANCE_CAR_ID 
ON INSURANCE(carID);

CREATE INDEX IDX_MAINTENANCE_CAR_ID 
ON CAR_MAINTENANCE(carID);

CREATE INDEX IDX_ADDRESS_BLOCK_ROAD 
ON ADDRESS(blockNo, roadNo, buildingNo);

CREATE UNIQUE INDEX IDX_CUST_USERNAME 
ON CUSTOMER(username);

CREATE INDEX IDX_CUST_CPR 
ON CUSTOMER(cpr_or_passport);

CREATE INDEX IDX_LICENSE_CUST_ID 
ON LICENSE(customerID);
CREATE INDEX IDX_RESERVATION_CUST_CAR_STATUS 
ON RESERVATION(customerID, carID, reservationStatus);

CREATE INDEX IDX_RESERVATION_DATES 
ON RESERVATION(pickUpDate, returnDate);

CREATE INDEX IDX_RENTAL_LOC_CAR_DATE 
ON CAR_RENTAL(locationID, carID, rentalStartDate);

CREATE INDEX IDX_RENTAL_CUSTOMER_STATUS 
ON CAR_RENTAL(customerID, status);
CREATE INDEX IDX_FINE_CUST_STATUS
ON FINE(customerID, paymentStatus);

select * from user_indexes;


-- PL/SQL script for creating functions 
--Functions
--Function 1: Calculate the number of car rentals by customer
CREATE OR REPLACE FUNCTION get_customer_rentals(p_customer_id IN NUMBER) RETURN NUMBER IS
    v_rentals NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_rentals
    FROM car_rental
    WHERE customerID = p_customer_id;

    RETURN v_rentals;
END get_customer_rentals;
/

SET SERVEROUTPUT ON;
DECLARE
    v_total NUMBER;
BEGIN
    v_total := get_customer_rentals(1);
    DBMS_OUTPUT.PUT_LINE('The number of times the customer has rented cars is: ' || v_total);
END;
/


--Function 2: Calculate Total Rental Fees
CREATE OR REPLACE FUNCTION calculate_total_car_rental_fees(
    p_rental_id IN NUMBER
) RETURN DECIMAL IS
    v_start_date     DATE;
    v_end_date       DATE;
    v_car_id         CAR.carID%TYPE;
    v_duration       NUMBER;
    v_total_cost     DECIMAL := 0;
    v_daily_rate     CAR.dailyHireRate%TYPE;
    v_equipment_cost DECIMAL := 0;
BEGIN
    -- Get car rental info and daily rate
    SELECT r.carID, r.rentalStartDate, r.rentalEndDate, c.dailyHireRate
    INTO v_car_id, v_start_date, v_end_date, v_daily_rate
    FROM car_rental r
    JOIN car c ON r.carID = c.carID
    WHERE r.carRentalID = p_rental_id;

    -- Calculate number of days
    v_duration := v_end_date - v_start_date;

    -- Basic cost
    v_total_cost := v_duration * v_daily_rate;

    -- Equipment cost (if any)
    SELECT NVL(SUM(er.quantity * ee.dailyRentalPrice * v_duration), 0)
    INTO v_equipment_cost
    FROM equipment_rental er
    JOIN extra_equipment ee ON er.extraEquipmentID = ee.extraEquipmentID
    WHERE er.carRentalID = p_rental_id;

    -- Add equipment cost
    v_total_cost := v_total_cost + v_equipment_cost;

    RETURN v_total_cost;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RETURN 0;
END calculate_total_car_rental_fees;
/
SELECT Calculate_Total_CAR_RENTAL_Fees(1) AS "Total Cost" from dual;


--Function 3: Calculate Late Returne Penalty for Car.
CREATE OR REPLACE FUNCTION late_return_car_penalty(
    r_rentalId IN NUMBER,
    lateDays IN NUMBER
) RETURN DECIMAL IS
    total_cost DECIMAL;
    c_dailyLateReturnPenalty NUMBER(4,2);
BEGIN
    SELECT dailyLateReturnPenalty
    INTO c_dailyLateReturnPenalty
    FROM car
    WHERE carId = (
        SELECT carId
        FROM car_rental
        WHERE carRentalId = r_rentalId
    );

    total_cost := c_dailyLateReturnPenalty * lateDays;
    RETURN total_cost;

EXCEPTION
    WHEN no_data_found THEN
        RETURN 0;
END late_return_car_penalty;
/
SELECT late_return_car_penalty(1, 3) AS penalty_amount
FROM dual;
/


--Function 4: Check Car Availabilibty
Create Or Replace Function check_car_availabilibty(
    car_id In Number,
    start_date In Date,
    end_date In Date
) Return Varchar2 As
    rentals_count Number;
    maintenance Number;
Begin
    Select Count(*) Into rentals_count
    From car_rental
    Where carid = car_id And (
        start_date Between rentalstartdate And rentalenddate Or
        end_date Between rentalstartdate And rentalenddate
    );

    Select Count(*) Into maintenance
    From car_maintenance
    Where carid = car_id And (
        start_date Between startdate And enddate Or
        end_date Between startdate And enddate
    );

    If rentals_count > 0 Or maintenance > 0 Then
        Return 'Unavailable';
    Else
        Return 'Available';
    End If;
End check_car_availabilibty;
/
Select check_car_availabilibty(1, To_Date('25-May-2025', 'DD-Mon-YYYY'), 
To_Date('28-May-2025', 'DD-Mon-YYYY')) As availability_status
From dual;
/


--PL/SQL script for creating procedures 
--Procedures

--Procedure 1 : to add a new car
CREATE OR REPLACE PROCEDURE add_new_car(
    p_model_id IN NUMBER,
    p_category_id IN NUMBER,
    p_plate_number IN VARCHAR2,
    p_reg_due_date IN DATE,
    p_year IN NUMBER,
    p_color IN VARCHAR2,
    p_mileage IN NUMBER,
    p_daily_rate IN NUMBER,
    p_penalty IN NUMBER,
    p_status IN VARCHAR2,
    p_condition IN VARCHAR2,
    p_capacity IN NUMBER
) AS
BEGIN
    INSERT INTO CAR (
        modelID, carCategoryID, registrationPlateNumber, 
        carRegistrationDueDate, yearManufactured, colour, 
        currentMileage, dailyHireRate, dailyLateReturnPenalty, 
        carStatus, carCondition, carCapacity
    ) VALUES (
        p_model_id, p_category_id, p_plate_number, 
        p_reg_due_date, p_year, p_color, 
        p_mileage, p_daily_rate, p_penalty, 
        p_status, p_condition, p_capacity
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Car added successfully');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error adding car: ' || SQLERRM);
END add_new_car;
/


--Procedure 2 : to process a car rental
CREATE OR REPLACE PROCEDURE process_car_rental(
    p_customer_id IN NUMBER,
    p_employee_id IN NUMBER,
    p_car_id IN NUMBER,
    p_location_id IN NUMBER,
    p_start_date IN DATE,
    p_end_date IN DATE,
    p_equipment_ids IN VARCHAR2 DEFAULT NULL, -- comma-separated list
    p_quantities IN VARCHAR2 DEFAULT NULL -- comma-separated list
) AS
    v_rental_id NUMBER;
    v_duration NUMBER;
    v_daily_rate NUMBER;
    v_total_cost NUMBER := 0;
    v_equipment_cost NUMBER := 0;
    v_status VARCHAR2(10);
    v_equipment_list DBMS_SQL.NUMBER_TABLE;
    v_quantity_list DBMS_SQL.NUMBER_TABLE;
BEGIN
    -- Calculate duration
    v_duration := p_end_date - p_start_date;
    
    -- Get car daily rate
    SELECT dailyHireRate INTO v_daily_rate FROM CAR WHERE carID = p_car_id;
    
    -- Calculate base cost
    v_total_cost := v_duration * v_daily_rate;
    
    -- Determine status
    IF SYSDATE BETWEEN p_start_date AND p_end_date THEN
        v_status := 'Ongoing';
    ELSIF SYSDATE < p_start_date THEN
        v_status := 'Upcoming';
    ELSE
        v_status := 'Completed';
    END IF;
    
    -- Create the rental record
    INSERT INTO CAR_RENTAL (
        carRentalID, customerID, employeeID, carID, locationID,
        rentalDuration, rentalCost, status, rentalStartDate, rentalEndDate
    ) VALUES (
        car_rental_id_seq.NEXTVAL, p_customer_id, p_employee_id, p_car_id, p_location_id,
        v_duration, v_total_cost, v_status, p_start_date, p_end_date
    )
    RETURNING carRentalID INTO v_rental_id;
    
    -- Process equipment rentals if provided
    IF p_equipment_ids IS NOT NULL AND p_quantities IS NOT NULL THEN
        -- Parse comma-separated strings into arrays
        FOR i IN 1..LENGTH(p_equipment_ids) - LENGTH(REPLACE(p_equipment_ids, ',', '')) + 1 LOOP
            v_equipment_list(i) := TO_NUMBER(REGEXP_SUBSTR(p_equipment_ids, '[^,]+', 1, i));
            v_quantity_list(i) := TO_NUMBER(REGEXP_SUBSTR(p_quantities, '[^,]+', 1, i));
        END LOOP;
        
        -- Process each equipment item
        FOR i IN 1..v_equipment_list.COUNT LOOP
            -- Add equipment rental record
            INSERT INTO EQUIPMENT_RENTAL (
                extraEquipmentID, carRentalID, quantity
            ) VALUES (
                v_equipment_list(i), v_rental_id, v_quantity_list(i)
            );
            
            -- Calculate equipment cost
            SELECT dailyRentalPrice * v_duration * v_quantity_list(i)
            INTO v_equipment_cost
            FROM EXTRA_EQUIPMENT
            WHERE extraEquipmentID = v_equipment_list(i);
            
            v_total_cost := v_total_cost + v_equipment_cost;
        END LOOP;
        
        -- Update total cost in rental record
        UPDATE CAR_RENTAL
        SET rentalCost = v_total_cost
        WHERE carRentalID = v_rental_id;
    END IF;
    
    -- Update car status
    UPDATE CAR
    SET carStatus = 'Rented'
    WHERE carID = p_car_id;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Car rental processed successfully. Rental ID: ' || v_rental_id);
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error processing rental: ' || SQLERRM);
END process_car_rental;
/


--Procedure 3 :  to apply a promotion for the customer

CREATE OR REPLACE PROCEDURE apply_promotion_to_customer(
    p_customer_id IN NUMBER,
    p_promotion_id IN NUMBER
) AS
    v_promo_active NUMBER;
    v_promo_limit NUMBER;
    v_usage_count NUMBER;
    v_customer_usage NUMBER;
BEGIN
    -- Check if promotion is active
    SELECT isActive, promotionLimit
    INTO v_promo_active, v_promo_limit
    FROM PROMOTION
    WHERE promotionID = p_promotion_id;
    
    IF v_promo_active = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Promotion is not active');
    END IF;
    
    -- Check global usage limit
    SELECT COUNT(*)
    INTO v_usage_count
    FROM CUSTOMER_PROMOTION
    WHERE promotionID = p_promotion_id;
    
    IF v_usage_count >= v_promo_limit THEN
        RAISE_APPLICATION_ERROR(-20002, 'Promotion usage limit reached');
    END IF;
    
    -- Check if customer already used this promotion
    SELECT COUNT(*)
    INTO v_customer_usage
    FROM CUSTOMER_PROMOTION
    WHERE customerID = p_customer_id AND promotionID = p_promotion_id;
    
    IF v_customer_usage > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Customer already used this promotion');
    END IF;
    
    -- Apply promotion
    INSERT INTO CUSTOMER_PROMOTION (customerID, promotionID)
    VALUES (p_customer_id, p_promotion_id);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Promotion applied successfully to customer');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Promotion or customer not found');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error applying promotion: ' || SQLERRM);
END apply_promotion_to_customer;
/


--Procedure 4 : a procedure to generate rental reports

CREATE OR REPLACE PROCEDURE generate_monthly_rental_report(
    p_month IN NUMBER,
    p_year IN NUMBER,
    p_cursor OUT SYS_REFCURSOR
) AS
    v_start_date DATE;
    v_end_date DATE;
BEGIN
    -- Calculate date range
    v_start_date := TO_DATE('01-' || p_month || '-' || p_year, 'DD-MM-YYYY');
    v_end_date := LAST_DAY(v_start_date);
    
    -- Open cursor with report data
    OPEN p_cursor FOR
        SELECT 
            L.cityName AS location,
            COUNT(CR.carRentalID) AS rental_count,
            SUM(CR.rentalCost) AS total_revenue,
            AVG(CR.rentalCost) AS avg_rental_value,
            M.modelName AS most_popular_model
        FROM 
            CAR_RENTAL CR
            JOIN LOCATION L ON CR.locationID = L.locationID
            JOIN CAR C ON CR.carID = C.carID
            JOIN MODEL M ON C.modelID = M.modelID
        WHERE 
            CR.rentalStartDate BETWEEN v_start_date AND v_end_date
        GROUP BY 
            L.cityName, M.modelName
        ORDER BY 
            rental_count DESC;
    
    DBMS_OUTPUT.PUT_LINE('Monthly report generated for ' || TO_CHAR(v_start_date, 'Month YYYY'));
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error generating report: ' || SQLERRM);
        IF p_cursor%ISOPEN THEN
            CLOSE p_cursor;
        END IF;
END generate_monthly_rental_report;
/


-- Package specification 
CREATE OR REPLACE PACKAGE car_rental_pkg AS 
-- Procedure to calculate and apply fines 
PROCEDURE apply_fine(
 p_rental_id IN NUMBER,
 p_reason IN VARCHAR2,
 p_amount IN NUMBER 
);
-- Function to check car availability
FUNCTION check_car_availability(
    p_car_id IN NUMBER,
    p_start_date IN DATE,
    p_end_date IN DATE
) RETURN VARCHAR2;

-- Procedure to extend rental period
PROCEDURE extend_rental(
    p_rental_id IN NUMBER,
    p_extra_days IN NUMBER
);

-- Function to calculate customer loyalty points
FUNCTION calculate_loyalty_points(
    p_customer_id IN NUMBER
) RETURN NUMBER;
 
END car_rental_pkg;
/


-- Package body 
CREATE OR REPLACE PACKAGE BODY car_rental_pkg AS 
-- Procedure to calculate and apply fines 
PROCEDURE apply_fine( 
p_rental_id IN NUMBER,
 p_reason IN VARCHAR2,
 p_amount IN NUMBER 
) AS 
v_customer_id NUMBER; 
v_employee_id NUMBER;
 v_due_date DATE; 
BEGIN 
-- Get customer and employee from rental
 SELECT customerID, employeeID 
INTO v_customer_id, v_employee_id 
FROM CAR_RENTAL 
WHERE carRentalID = p_rental_id;
   -- Set due date to 7 days from now
    v_due_date := SYSDATE + 7;
    
    -- Insert fine record
    INSERT INTO FINE (
        fineID, customerID, carRentalID, employeeID,
        fineAmount, fineReason, dateIssued, dueDate, paymentStatus
    ) VALUES (
        fine_id_seq.NEXTVAL, v_customer_id, p_rental_id, v_employee_id,
        p_amount, p_reason, SYSDATE, v_due_date, 'Pending'
    );
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Fine applied successfully');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Rental not found');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error applying fine: ' || SQLERRM);
END apply_fine;

-- Function to check car availability
FUNCTION check_car_availability(
    p_car_id IN NUMBER,
    p_start_date IN DATE,
    p_end_date IN DATE
) RETURN VARCHAR2 AS
    v_rentals_count NUMBER;
    v_maintenance_count NUMBER;
    v_car_status VARCHAR2(20);
BEGIN
    -- Check if car exists and its status
    BEGIN
        SELECT carStatus INTO v_car_status FROM CAR WHERE carID = p_car_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'Car not found';
    END;
    
    -- Check for overlapping rentals
    SELECT COUNT(*)
    INTO v_rentals_count
    FROM CAR_RENTAL
    WHERE carID = p_car_id
    AND (
        (p_start_date BETWEEN rentalStartDate AND rentalEndDate) OR
        (p_end_date BETWEEN rentalStartDate AND rentalEndDate) OR
        (rentalStartDate BETWEEN p_start_date AND p_end_date)
    );
    
    -- Check for maintenance during period
    SELECT COUNT(*)
    INTO v_maintenance_count
    FROM CAR_MAINTENANCE
    WHERE carID = p_car_id
    AND maintenanceStatus != 'Completed'
    AND (
        (p_start_date BETWEEN startDate AND endDate) OR
        (p_end_date BETWEEN startDate AND endDate) OR
        (startDate BETWEEN p_start_date AND p_end_date)
    );
    
    -- Determine availability
    IF v_car_status = 'Available' AND v_rentals_count = 0 AND v_maintenance_count = 0 THEN
        RETURN 'Available';
    ELSE
        RETURN 'Unavailable';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error checking availability';
END check_car_availability;

-- Procedure to extend rental period
PROCEDURE extend_rental(
    p_rental_id IN NUMBER,
    p_extra_days IN NUMBER
) AS
    v_current_end_date DATE;
    v_car_id NUMBER;
    v_daily_rate NUMBER;
    v_extension_cost NUMBER;
    v_new_end_date DATE;
BEGIN
    -- Get current rental details
    SELECT rentalEndDate, carID
    INTO v_current_end_date, v_car_id
    FROM CAR_RENTAL
    WHERE carRentalID = p_rental_id;
    
    -- Calculate new end date
    v_new_end_date := v_current_end_date + p_extra_days;
    
    -- Check if car is available for extension period
    IF car_rental_pkg.check_car_availability(v_car_id, v_current_end_date, v_new_end_date) != 'Available' THEN
        RAISE_APPLICATION_ERROR(-20010, 'Car not available for extension period');
    END IF;
    
    -- Get daily rate
    SELECT dailyHireRate INTO v_daily_rate FROM CAR WHERE carID = v_car_id;
    
    -- Calculate extension cost
    v_extension_cost := p_extra_days * v_daily_rate;
    
    -- Update rental record
    UPDATE CAR_RENTAL
    SET 
        rentalEndDate = v_new_end_date,
        rentalDuration = rentalDuration + p_extra_days,
        rentalCost = rentalCost + v_extension_cost
    WHERE carRentalID = p_rental_id;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Rental extended successfully. Additional cost: ' || v_extension_cost);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Rental not found');
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error extending rental: ' || SQLERRM);
END extend_rental;

-- Function to calculate customer loyalty points
FUNCTION calculate_loyalty_points(
    p_customer_id IN NUMBER
) RETURN NUMBER AS
    v_total_rentals NUMBER;
    v_total_spent NUMBER;
    v_points NUMBER := 0;
BEGIN
    -- Count total rentals
    SELECT COUNT(*)
    INTO v_total_rentals
    FROM CAR_RENTAL
    WHERE customerID = p_customer_id;
    
    -- Calculate total spent
    SELECT NVL(SUM(rentalCost), 0)
    INTO v_total_spent
    FROM CAR_RENTAL
    WHERE customerID = p_customer_id;
    
    -- Calculate points (1 point per rental, 1 point per 10BD spent)
    v_points := v_total_rentals + FLOOR(v_total_spent / 10);
    
    RETURN v_points;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;
END calculate_loyalty_points;
 
END car_rental_pkg;
/


-- PL/SQL script, based on anonymous blocks

--Anonymous block for procedures

--Procedure 1
set serveroutput on;
BEGIN
  add_new_car(1, 2, 'BH12345', TO_DATE('2025-12-31', 'YYYY-MM-DD'), 
  2022, 'Red', 25000, 20.5, 5.0, 'Available', 'Excellent', 5);
END;
/

--Procedure 2
set serveroutput on;
BEGIN process_car_rental(1, 1, 2, 1, TO_DATE('2025-08-01','YYYY-MM-DD'),
TO_DATE('2025-08-05','YYYY-MM-DD'), '3,4', '1,1'); 
END;
/

--Procedure 3
set serveroutput on;
BEGIN
  apply_promotion_to_customer(3, 3);
END;
/

--Procedure 4
DECLARE
  v_cursor SYS_REFCURSOR;
  v_location VARCHAR2(100);
  v_rental_count NUMBER;
  v_total_revenue NUMBER;
  v_avg_rental_value NUMBER;
  v_model VARCHAR2(100);
BEGIN
  generate_monthly_rental_report(7, 2022, v_cursor);

  LOOP
    FETCH v_cursor INTO v_location, v_rental_count, v_total_revenue, v_avg_rental_value, v_model;
    EXIT WHEN v_cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Location: ' || v_location || 
                         ', Rentals: ' || v_rental_count || 
                         ', Total Revenue: ' || v_total_revenue || 
                         ', Avg Value: ' || ROUND(v_avg_rental_value, 2) || 
                         ', Top Model: ' || v_model);
  END LOOP;

  CLOSE v_cursor;
END;
/


--Anonymous block for functions

--Function 1: get_customer_rentals
SET SERVEROUTPUT ON;
DECLARE
    v_totalRentals NUMBER;
BEGIN
    v_totalRentals := get_customer_rentals(1);
    DBMS_OUTPUT.PUT_LINE('Customer 1 has rented cars ' || v_totalRentals || ' times.');
END;
/

--Function 2: calculate_total_car_rental_fees
SET SERVEROUTPUT ON;
DECLARE
    v_totalFees DECIMAL;
BEGIN
    v_totalFees := calculate_total_car_rental_fees(1);
    DBMS_OUTPUT.PUT_LINE('Total rental fees for rental ID 1: ' || v_totalFees);
END;
/

--Function 3: late_return_car_penalty
SET SERVEROUTPUT ON;
DECLARE
    v_penalty DECIMAL;
BEGIN
    v_penalty := late_return_car_penalty(1, 3); -- 3 is the number of late days
    DBMS_OUTPUT.PUT_LINE('Late return penalty for rental ID 1 (3 days late): ' || v_penalty);
END;
/

--Function 4: check_car_availabilibty
SET SERVEROUTPUT ON;
DECLARE
    v_status VARCHAR2(20);
BEGIN
    v_status := check_car_availabilibty(1, 
                TO_DATE('25-May-2025', 'DD-Mon-YYYY'), 
                TO_DATE('28-May-2025', 'DD-Mon-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Availability status of car ID 1: ' || v_status);
END;
/

--Anonymous block for package method
SET SERVEROUTPUT ON;
DECLARE
  v_points NUMBER;
BEGIN
  v_points := car_rental_pkg.calculate_loyalty_points(1);
  DBMS_OUTPUT.PUT_LINE('Customer 1 has ' || v_points || ' loyalty points.');
END;
/


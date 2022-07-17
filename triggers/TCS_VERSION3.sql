CREATE DATABASE TCS_VERSION3

CREATE TABLE SENDER(ID_NUMBER INT PRIMARY KEY NOT NULL, 
                   [NAME] VARCHAR(32) NOT NULL, 
				   CONTACT_NUMBER VARCHAR(15) NOT NULL)

CREATE TABLE HISTORY_TRAIL_SENDER(ID_NUMBER INT PRIMARY KEY NOT NULL, 
                   [NAME] VARCHAR(32) NOT NULL, 
				   CONTACT_NUMBER VARCHAR(15) NOT NULL, 
				   OPERATION VARCHAR(32))

CREATE TABLE RECEIVER(ID_NUMBER INT PRIMARY KEY NOT NULL,
                   [NAME] VARCHAR(32) NOT NULL, 
				   [ADDRESS] VARCHAR(100) NOT NULL, 
				   CONTACT_NUMBER VARCHAR(15) NOT NULL)
CREATE TABLE HISTORY_TRAIL_RECEIVER(ID_NUMBER INT PRIMARY KEY NOT NULL,
                   [NAME] VARCHAR(32) NOT NULL, 
				   [ADDRESS] VARCHAR(100) NOT NULL, 
				   CONTACT_NUMBER VARCHAR(15) NOT NULL, 
				   OPERATION VARCHAR(32))

CREATE TABLE SHIPMENT_TYPE (PK_VALUE_OF_STP INT PRIMARY KEY NOT NULL, 
                   NORMAL BIT NOT NULL, URGENT BIT NOT NULL)

CREATE TABLE HISTORY_TRAIL_SHIPMENT_TYPE (
                   PK_VALUE_OF_STP INT PRIMARY KEY NOT NULL,
                   NORMAL BIT NOT NULL, 
				   URGENT BIT NOT NULL)
INSERT INTO SHIPMENT_TYPE(PK_VALUE_OF_STP, NORMAL, URGENT) VALUES(1, 0, 1)
INSERT INTO SHIPMENT_TYPE(PK_VALUE_OF_STP, NORMAL, URGENT) VALUES(2, 1, 0)

CREATE TABLE DESTINATION_TYPE (
                   PK_VALUE_OF_DTP INT PRIMARY KEY NOT NULL, 
                   DOMESTIC BIT NOT NULL, 
				   INTERNATIONAL BIT NOT NULL)
CREATE TABLE HISTORY_TRAIL_DESTINATION_TYPE (
                   PK_VALUE_OF_DTP INT PRIMARY KEY NOT NULL,
                   DOMESTIC BIT NOT NULL, INTERNATIONAL BIT NOT NULL)

INSERT INTO DESTINATION_TYPE(
                   PK_VALUE_OF_DTP, 
                   DOMESTIC, INTERNATIONAL) VALUES(1, 0, 1)
INSERT INTO DESTINATION_TYPE(
                   PK_VALUE_OF_DTP, DOMESTIC, 
				   INTERNATIONAL) VALUES(2, 1, 0)

CREATE TABLE AMOUNT(
                   PK_VALUE_OF_AMT INT PRIMARY KEY NOT NULL, 
				   PRICE_IN_USD FLOAT NOT NULL) 
CREATE TABLE HISTORY_TRAIL_AMOUNT(
                   PK_VALUE_OF_AMT INT PRIMARY KEY NOT NULL, 
				   PRICE_IN_USD FLOAT NOT NULL, 
				   OPERATION VARCHAR(32)) 

CREATE TABLE LOGISTIC_DEPARTMENT(
                   EMPLOYEE_ID INT PRIMARY KEY NOT NULL, 
                   EMPLOYEE_NAME VARCHAR(32) NOT NULL,
				   EMPLOYEE_DESIGNATION VARCHAR(50) NOT NULL,
				   EMPLOYEE_CONTACT_NUMBER VARCHAR(15) NOT NULL, 
				   EMPLOYEE_ADDRESS VARCHAR(100), 
				   EMPLOYEE_SALARY_IN_USD FLOAT)

CREATE TABLE HISTORY_TRAIL_LOGISTIC_DEPARTMENT(
                   EMPLOYEE_ID INT PRIMARY KEY NOT NULL, 
				   EMPLOYEE_NAME VARCHAR(32) NOT NULL, 
				   EMPLOYEE_DESIGNATION VARCHAR(50) NOT NULL, 
				   EMPLOYEE_CONTACT_NUMBER VARCHAR(15) NOT NULL, 
				   EMPLOYEE_ADDRESS VARCHAR(100), 
				   EMPLOYEE_SALARY_IN_USD FLOAT, 
				   OPERATION VARCHAR(32))

CREATE TABLE SHIPMENT_TIME (
                   PK_VALUE_OF_ST INT PRIMARY KEY NOT NULL,
				   [DAY] VARCHAR(15) NOT NULL, 
				   [DATE] VARCHAR(32) NOT NULL, 
				   [TIME] VARCHAR(32) NOT NULL)
CREATE TABLE HISTORY_TRAIL_SHIPMENT_TIME (
                   PK_VALUE_OF_ST INT PRIMARY KEY NOT NULL,
				   [DAY] VARCHAR(15) NOT NULL,
				   [DATE] VARCHAR(32) NOT NULL,
				   [TIME] VARCHAR(32) NOT NULL,
				   OPERATION VARCHAR(32))

CREATE TABLE DESTINATION_BRANCH(
                   BRANCH_ID INT PRIMARY KEY NOT NULL,
				   BRANCH_ADDRESS VARCHAR(100) NOT NULL,
				   BRANCH_EMAIL VARCHAR(50) NOT NULL, 
				   BRANCH_CONTACT_NUMBER VARCHAR(15) NOT NULL)

CREATE TABLE HISTORY_TRAIL_DESTINATION_BRANCH(
                   BRANCH_ID INT PRIMARY KEY NOT NULL,
				   BRANCH_ADDRESS VARCHAR(100) NOT NULL,
				   BRANCH_EMAIL VARCHAR(50) NOT NULL,
				   BRANCH_CONTACT_NUMBER VARCHAR(15) NOT NULL,
				   OPERATION VARCHAR(32))

CREATE TABLE ARRIVAL_TIME (
                   PK_VALUE_OF_AT INT PRIMARY KEY NOT NULL,
				   [DAY] VARCHAR(15) NOT NULL,
				   [DATE] VARCHAR(32) NOT NULL,
				   [TIME] VARCHAR(32) NOT NULL)

CREATE TABLE HISTORY_TRAIL_ARRIVAL_TIME (
                  PK_VALUE_OF_AT INT PRIMARY KEY NOT NULL,
				  [DAY] VARCHAR(15) NOT NULL,
				  [DATE] VARCHAR(32) NOT NULL, 
				  [TIME] VARCHAR(32) NOT NULL, 
				  OPERATION VARCHAR(32))

CREATE TABLE CONSIGNOR(
                  ID_NUMBER INT PRIMARY KEY NOT NULL,
				  CONSIGNOR_NAME VARCHAR(32) NOT NULL,
				  CONSIGNOR_CONTACT_NUMBER VARCHAR(15) NOT NULL,
				  CONSIGNOR_ADDRESS VARCHAR(100) NOT NULL,
				  CONSIGNOR_SALARY_IN_USD FLOAT)

CREATE TABLE HISTORY_TRAIL_CONSIGNOR(
                  ID_NUMBER INT PRIMARY KEY NOT NULL,
				  CONSIGNOR_NAME VARCHAR(32) NOT NULL,
				  CONSIGNOR_CONTACT_NUMBER VARCHAR(15) NOT NULL,
				  CONSIGNOR_ADDRESS VARCHAR(100) NOT NULL,
				  CONSIGNOR_SALARY_IN_USD FLOAT,
				  OPERATION VARCHAR(32))

CREATE TABLE [STATUS](
                 PK_VALUE_OF_ST INT PRIMARY KEY NOT NULL,
                 [STATE] BIT NOT NULL)

CREATE TABLE HISTORY_TRAIL_STATUS(PK_VALUE_OF_ST INT PRIMARY KEY NOT NULL, [STATE] BIT NOT NULL)
INSERT INTO [STATUS](PK_VALUE_OF_ST, [STATE]) VALUES(1, 0)
INSERT INTO [STATUS](PK_VALUE_OF_ST, [STATE]) VALUES(2, 1)

CREATE TABLE PACKAGE(
                 PACKAGE_ID VARCHAR(20) PRIMARY KEY NOT NULL,
				 PACKAGE_TYPE VARCHAR(32) NOT NULL,
				 PACKAGE_WEIGHT_IN_KG FLOAT NOT NULL,
				 SENDER_ID INT FOREIGN KEY REFERENCES SENDER(ID_NUMBER),
				 RECEIVER_ID INT FOREIGN KEY REFERENCES RECEIVER(ID_NUMBER),
				 SHIPMENT_TYPE_ID INT FOREIGN KEY REFERENCES SHIPMENT_TYPE(PK_VALUE_OF_STP),
				 DESTINATION_TYPE_ID INT FOREIGN KEY REFERENCES DESTINATION_TYPE(PK_VALUE_OF_DTP),
				 AMOUNT_ID INT FOREIGN KEY REFERENCES AMOUNT(PK_VALUE_OF_AMT),
				 LOGISTIC_DEPARTMENT_ID INT FOREIGN KEY REFERENCES LOGISTIC_DEPARTMENT(EMPLOYEE_ID),
				 TIME_OF_SHIPMENT INT FOREIGN KEY REFERENCES SHIPMENT_TIME(PK_VALUE_OF_ST),
				 DESTINATION_BRANCH_ID INT FOREIGN KEY REFERENCES DESTINATION_BRANCH(BRANCH_ID),
				 TIME_OF_ARRIVAL INT FOREIGN KEY REFERENCES ARRIVAL_TIME(PK_VALUE_OF_AT),
				 CONSIGNOR_ID INT FOREIGN KEY REFERENCES CONSIGNOR(ID_NUMBER),
				 STATUS_ID INT FOREIGN KEY REFERENCES [STATUS](PK_VALUE_OF_ST))

CREATE TABLE HISTORY_TRAIL_PACKAGE(
                 PACKAGE_ID VARCHAR(20) PRIMARY KEY NOT NULL,
				 PACKAGE_TYPE VARCHAR(32) NOT NULL, 
				 PACKAGE_WEIGHT_IN_KG FLOAT NOT NULL,
				 SENDER_ID INT FOREIGN KEY REFERENCES SENDER(ID_NUMBER), 
				 RECEIVER_ID INT FOREIGN KEY REFERENCES RECEIVER(ID_NUMBER), 
				 SHIPMENT_TYPE_ID INT FOREIGN KEY REFERENCES SHIPMENT_TYPE(PK_VALUE_OF_STP), 
				 DESTINATION_TYPE_ID INT FOREIGN KEY REFERENCES DESTINATION_TYPE(PK_VALUE_OF_DTP), 
				 AMOUNT_ID INT FOREIGN KEY REFERENCES AMOUNT(PK_VALUE_OF_AMT), 
				 LOGISTIC_DEPARTMENT_ID INT FOREIGN KEY REFERENCES LOGISTIC_DEPARTMENT(EMPLOYEE_ID), 
				 TIME_OF_SHIPMENT INT FOREIGN KEY REFERENCES SHIPMENT_TIME(PK_VALUE_OF_ST),
				 DESTINATION_BRANCH_ID INT FOREIGN KEY REFERENCES DESTINATION_BRANCH(BRANCH_ID),
				 TIME_OF_ARRIVAL INT FOREIGN KEY REFERENCES ARRIVAL_TIME(PK_VALUE_OF_AT), 
				 CONSIGNOR_ID INT FOREIGN KEY REFERENCES CONSIGNOR(ID_NUMBER), 
				 STATUS_ID INT FOREIGN KEY REFERENCES [STATUS](PK_VALUE_OF_ST), 
				 OPERATION VARCHAR(32))

CREATE TABLE OPERATOR(
                 ID_NUMBER INT PRIMARY KEY NOT NULL, 
				 [NAME] VARCHAR(32), 
				 JOINING_DATE VARCHAR(50), 
				 SALARY_IN_USD FLOAT)

CREATE TABLE HISTORY_TRAIL_OPERATOR(
                ID_NUMBER INT PRIMARY KEY NOT NULL,
				[NAME] VARCHAR(32),
				JOINING_DATE VARCHAR(50),
				SALARY_IN_USD FLOAT,
				OPERATION VARCHAR(32))

CREATE TABLE DAILY_REPORT(
                DAILY_TOTAL_INCOME FLOAT, 
				DAILY_EMPLOYEE_SALARY FLOAT,
				DAILY_CONSIGNOR_SALARY FLOAT,
				DAILY_OPERATOR_SALARY FLOAT,
				DAILY_FINAL_INCOME FLOAT)

CREATE TABLE WEEKLY_REPORT(
                WEEKLY_TOTAL_INCOME FLOAT,
				WEEKLY_EMPLOYEE_SALARY FLOAT,
				WEEKLY_CONSIGNOR_SALARY FLOAT,
				WEEKLY_OPERATOR_SALARY FLOAT, 
				WEEKLY_FINAL_INCOME FLOAT)

CREATE TABLE MONTHLY_REPORT(
               MONTHLY_TOTAL_INCOME FLOAT,
			   MONTHLY_EMPLOYEE_SALARY FLOAT,
			   MONTHLY_CONSIGNOR_SALARY FLOAT,
			   MONTHLY_OPERATOR_SALARY FLOAT,
			   MONTHLY_FINAL_INCOME FLOAT)

CREATE TABLE YEARLY_REPORT(
               YEARLY_TOTAL_INCOME FLOAT, 
			   YEARLY_EMPLOYEE_SALARY FLOAT, 
			   YEARLY_CONSIGNOR_SALARY FLOAT, 
			   YEARLY_OPERATOR_SALARY FLOAT, 
			   YEARLY_FINAL_INCOME FLOAT)

SELECT * FROM SENDER
SELECT * FROM RECEIVER
SELECT * FROM SHIPMENT_TYPE
SELECT * FROM DESTINATION_TYPE
SELECT * FROM AMOUNT
SELECT * FROM LOGISTIC_DEPARTMENT
SELECT * FROM SHIPMENT_TIME
SELECT * FROM DESTINATION_BRANCH
SELECT * FROM ARRIVAL_TIME
SELECT * FROM CONSIGNOR
SELECT * FROM [STATUS]
SELECT * FROM OPERATOR
SELECT * FROM PACKAGE

EXEC spDAILY_REPORT
EXEC spWEEKLY_REPORT
EXEC spMONTHLY_REPORT
EXEC spYEARLY_REPORT

EXEC spREPORT

EXEC spRETRIEVE_PACKAGE_DETAILS '174-77-7542'
EXEC spRETRIEVE_PACKAGE_DETAILS '206-91-8214'


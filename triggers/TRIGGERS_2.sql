SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[amount_history_update] ON [dbo].[AMOUNT]

   AFTER UPDATE 
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @amountid int;
	 declare @amountprice float;
	 
	 
	 select @amountid=amountlist.PK_VALUE_OF_AMT from deleted amountlist;
	 select @amountprice =amountlist.PRICE_IN_USD from deleted amountlist;
	 
	 DELETE FROM HISTORY_TRAIL_AMOUNT WHERE PK_VALUE_OF_AMT = @amountid

	 INSERT INTO HISTORY_TRAIL_AMOUNT(PK_VALUE_OF_AMT, PRICE_IN_USD, OPERATION)
	 VALUES(@amountid,@amountprice, 'UPDATION')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[amount_history_delete] ON [dbo].[AMOUNT]

   AFTER DELETE  
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @amountid int;
	 declare @amountprice float;
	 
	 
	 select @amountid=amountlist.PK_VALUE_OF_AMT from deleted amountlist;
	 select @amountprice =amountlist.PRICE_IN_USD from deleted amountlist;
	 
	 DELETE FROM HISTORY_TRAIL_AMOUNT WHERE PK_VALUE_OF_AMT = @amountid

	 INSERT INTO HISTORY_TRAIL_AMOUNT(PK_VALUE_OF_AMT, PRICE_IN_USD, OPERATION)
	 VALUES(@amountid,@amountprice, 'DELETION')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[arrivaltime_history_update] ON [dbo].[ARRIVAL_TIME]

   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @arrivalid int;
	 declare @arrivalday varchar(15);
	 declare @arrivaldate varchar(32);
	 declare @arrivaltime varchar(32);
	 

	 
	 select @arrivalid= arrivallist.PK_VALUE_OF_AT from deleted arrivallist;
	 select @arrivalday = arrivallist.[DAY] from deleted arrivallist;
	 select @arrivaldate = arrivallist.[DATE] from deleted arrivallist;
	 select @arrivaltime = arrivallist.[TIME] from deleted arrivallist;
	 
	 delete from HISTORY_TRAIL_ARRIVAL_TIME where PK_VALUE_OF_AT = @arrivalid
	 
	 INSERT INTO HISTORY_TRAIL_ARRIVAL_TIME(PK_VALUE_OF_AT,[DAY],[DATE],[TIME], OPERATION)
	 VALUES(@arrivalid,@arrivalday,@arrivaldate,@arrivaltime, 'updation')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[arrivaltime_history_delete] ON [dbo].[ARRIVAL_TIME]

   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @arrivalid int;
	 declare @arrivalday varchar(15);
	 declare @arrivaldate varchar(32);
	 declare @arrivaltime varchar(32);
	 

	 
	 select @arrivalid= arrivallist.PK_VALUE_OF_AT from deleted arrivallist;
	 select @arrivalday = arrivallist.[DAY] from deleted arrivallist;
	 select @arrivaldate = arrivallist.[DATE] from deleted arrivallist;
	 select @arrivaltime = arrivallist.[TIME] from deleted arrivallist;
	 
	 delete from HISTORY_TRAIL_ARRIVAL_TIME where PK_VALUE_OF_AT = @arrivalid
	 
	 INSERT INTO HISTORY_TRAIL_ARRIVAL_TIME(PK_VALUE_OF_AT,[DAY],[DATE],[TIME], OPERATION)
	 VALUES(@arrivalid,@arrivalday,@arrivaldate,@arrivaltime, 'deletion')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[consigner_history_update] ON [dbo].[CONSIGNOR]

   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @consignerid int;
	 declare @consignername varchar(32);
	 declare @consignercontact varchar(15);
	 declare @consigneraddress varchar(100);
	 declare @consignersalary float	 
	 
	 select @consignerid= consignerlist.ID_NUMBER from deleted consignerlist;
	 select @consignername = consignerlist.CONSIGNOR_NAME from deleted consignerlist;
	 select @consignercontact = consignerlist.CONSIGNOR_CONTACT_NUMBER from deleted consignerlist;
	 select @consigneraddress = consignerlist.CONSIGNOR_ADDRESS from deleted consignerlist;
	 select @consignersalary = consignerlist.CONSIGNOR_SALARY_IN_USD from deleted consignerlist

	 delete from HISTORY_TRAIL_CONSIGNOR where ID_NUMBER = @consignerid

	 INSERT INTO HISTORY_TRAIL_CONSIGNOR(ID_NUMBER,CONSIGNOR_NAME,CONSIGNOR_CONTACT_NUMBER,CONSIGNOR_ADDRESS, CONSIGNOR_SALARY_IN_USD, OPERATION)
	 VALUES(@consignerid,@consignername,@consignercontact,@consigneraddress, @consignersalary, 'updation')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[consigner_history_delete] ON [dbo].[CONSIGNOR]

   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @consignerid int;
	 declare @consignername varchar(32);
	 declare @consignercontact varchar(15);
	 declare @consigneraddress varchar(100);
	 declare @consignersalary float	 
	 
	 select @consignerid= consignerlist.ID_NUMBER from deleted consignerlist;
	 select @consignername = consignerlist.CONSIGNOR_NAME from deleted consignerlist;
	 select @consignercontact = consignerlist.CONSIGNOR_CONTACT_NUMBER from deleted consignerlist;
	 select @consigneraddress = consignerlist.CONSIGNOR_ADDRESS from deleted consignerlist;
	 select @consignersalary = consignerlist.CONSIGNOR_SALARY_IN_USD from deleted consignerlist

	 delete from HISTORY_TRAIL_CONSIGNOR where ID_NUMBER = @consignerid

	 INSERT INTO HISTORY_TRAIL_CONSIGNOR(ID_NUMBER,CONSIGNOR_NAME,CONSIGNOR_CONTACT_NUMBER,CONSIGNOR_ADDRESS, CONSIGNOR_SALARY_IN_USD, OPERATION)
	 VALUES(@consignerid,@consignername,@consignercontact,@consigneraddress, @consignersalary, 'deletion')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[destinationbranch_history_update] ON [dbo].[DESTINATION_BRANCH]

   AFTER update
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @branchid int;
	 declare @branchaddress varchar(100);
	 declare @branchemail varchar(50);
	 declare @branchcontact varchar(15);
	 
	 select @branchid= branchlist.BRANCH_ID from deleted branchlist;
	 select @branchaddress = branchlist.BRANCH_ADDRESS from deleted branchlist;
	 select @branchemail = branchlist.BRANCH_EMAIL from deleted branchlist;
	 select @branchcontact = branchlist.BRANCH_CONTACT_NUMBER from deleted branchlist;
	 
	 delete from HISTORY_TRAIL_DESTINATION_BRANCH where BRANCH_ID = @branchid
	 
	 INSERT INTO HISTORY_TRAIL_DESTINATION_BRANCH(BRANCH_ID,BRANCH_ADDRESS,BRANCH_EMAIL,BRANCH_CONTACT_NUMBER, OPERATION)
	 VALUES(@branchid,@branchaddress,@branchemail,@branchcontact, 'updation')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[destinationbranch_history_delete] ON [dbo].[DESTINATION_BRANCH]

   AFTER delete
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @branchid int;
	 declare @branchaddress varchar(100);
	 declare @branchemail varchar(50);
	 declare @branchcontact varchar(15);
	 
	 select @branchid= branchlist.BRANCH_ID from deleted branchlist;
	 select @branchaddress = branchlist.BRANCH_ADDRESS from deleted branchlist;
	 select @branchemail = branchlist.BRANCH_EMAIL from deleted branchlist;
	 select @branchcontact = branchlist.BRANCH_CONTACT_NUMBER from deleted branchlist;
	 
	 delete from HISTORY_TRAIL_DESTINATION_BRANCH where BRANCH_ID = @branchid
	 
	 INSERT INTO HISTORY_TRAIL_DESTINATION_BRANCH(BRANCH_ID,BRANCH_ADDRESS,BRANCH_EMAIL,BRANCH_CONTACT_NUMBER, OPERATION)
	 VALUES(@branchid,@branchaddress,@branchemail,@branchcontact, 'deletion')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[logistic_history_update] ON [dbo].[LOGISTIC_DEPARTMENT]

   AFTER update
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @logisticid int;
	 declare @logisticname varchar(32);
	 declare @logisticdesignation varchar(20);
	 declare @logisticcontact varchar(15);
	 declare @logisticaddress varchar(100);
	 declare @logisticsalary float
	 
	 
	 select @logisticid= logisticlist.EMPLOYEE_ID from deleted logisticlist;
	 select @logisticname = logisticlist.EMPLOYEE_NAME from deleted logisticlist;
	 select @logisticdesignation = logisticlist.EMPLOYEE_DESIGNATION from deleted logisticlist;
	 select @logisticcontact = logisticlist.EMPLOYEE_CONTACT_NUMBER from deleted logisticlist;
	 select @logisticaddress = logisticlist.EMPLOYEE_ADDRESS from deleted logisticlist;
	 select @logisticsalary = logisticlist.EMPLOYEE_SALARY_IN_USD from deleted logisticlist

	 delete from HISTORY_TRAIL_LOGISTIC_DEPARTMENT where EMPLOYEE_ID = @logisticid

	 INSERT INTO HISTORY_TRAIL_LOGISTIC_DEPARTMENT(EMPLOYEE_ID,EMPLOYEE_NAME,EMPLOYEE_DESIGNATION,EMPLOYEE_CONTACT_NUMBER,EMPLOYEE_ADDRESS, EMPLOYEE_SALARY_IN_USD, OPERATION)
	 VALUES(@logisticid,@logisticname,@logisticdesignation,@logisticcontact,@logisticaddress, @logisticsalary, 'updation')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[logistic_history_delete] ON [dbo].[LOGISTIC_DEPARTMENT]

   AFTER delete
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @logisticid int;
	 declare @logisticname varchar(32);
	 declare @logisticdesignation varchar(20);
	 declare @logisticcontact varchar(15);
	 declare @logisticaddress varchar(100);
	 declare @logisticsalary float
	 
	 
	 select @logisticid= logisticlist.EMPLOYEE_ID from deleted logisticlist;
	 select @logisticname = logisticlist.EMPLOYEE_NAME from deleted logisticlist;
	 select @logisticdesignation = logisticlist.EMPLOYEE_DESIGNATION from deleted logisticlist;
	 select @logisticcontact = logisticlist.EMPLOYEE_CONTACT_NUMBER from deleted logisticlist;
	 select @logisticaddress = logisticlist.EMPLOYEE_ADDRESS from deleted logisticlist;
	 select @logisticsalary = logisticlist.EMPLOYEE_SALARY_IN_USD from deleted logisticlist

	 delete from HISTORY_TRAIL_LOGISTIC_DEPARTMENT where EMPLOYEE_ID = @logisticid

	 INSERT INTO HISTORY_TRAIL_LOGISTIC_DEPARTMENT(EMPLOYEE_ID,EMPLOYEE_NAME,EMPLOYEE_DESIGNATION,EMPLOYEE_CONTACT_NUMBER,EMPLOYEE_ADDRESS, EMPLOYEE_SALARY_IN_USD, OPERATION)
	 VALUES(@logisticid,@logisticname,@logisticdesignation,@logisticcontact,@logisticaddress, @logisticsalary, 'deletion')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[receiver_history_update] ON [dbo].[RECEIVER]

   AFTER update
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	 declare @receiverid int;
	 declare @receivername varchar(32);
	 declare @receiveraddress varchar(100);
	 declare @receivercontact varchar(15);

	 select @receiverid =receiverlist.ID_NUMBER from deleted receiverlist;
	 select @receivername =receiverlist.[NAME] from deleted receiverlist;
	 select @receiveraddress =receiverlist.[ADDRESS] from deleted receiverlist;
	 select @receivercontact =receiverlist.CONTACT_NUMBER from deleted receiverlist;

	 delete from HISTORY_TRAIL_RECEIVER where ID_NUMBER = @receiverid

	 INSERT INTO HISTORY_TRAIL_RECEIVER(ID_NUMBER,[NAME],[ADDRESS],CONTACT_NUMBER, OPERATION)
	 VALUES(@receiverid,@receivername,@receiveraddress,@receivercontact, 'updation')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[receiver_history_delete] ON [dbo].[RECEIVER]

   AFTER delete
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	 declare @receiverid int;
	 declare @receivername varchar(32);
	 declare @receiveraddress varchar(100);
	 declare @receivercontact varchar(15);

	 select @receiverid =receiverlist.ID_NUMBER from deleted receiverlist;
	 select @receivername =receiverlist.[NAME] from deleted receiverlist;
	 select @receiveraddress =receiverlist.[ADDRESS] from deleted receiverlist;
	 select @receivercontact =receiverlist.CONTACT_NUMBER from deleted receiverlist;

	 delete from HISTORY_TRAIL_RECEIVER where ID_NUMBER = @receiverid

	 INSERT INTO HISTORY_TRAIL_RECEIVER(ID_NUMBER,[NAME],[ADDRESS],CONTACT_NUMBER, OPERATION)
	 VALUES(@receiverid,@receivername,@receiveraddress,@receivercontact, 'deletion')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[sender_history_update] ON [dbo].[SENDER]

   AFTER update
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	 declare @senderid INT;
	 declare @sendername varchar(32);
	 declare @sendercontact varchar(15);

	 select @senderid =senderlist.ID_NUMBER from deleted senderlist;
	 select @sendername =senderlist.[NAME] from deleted senderlist;
	 select @sendercontact =senderlist.CONTACT_NUMBER from deleted senderlist;

	 delete from HISTORY_TRAIL_SENDER where ID_NUMBER = @senderid

	 INSERT INTO HISTORY_TRAIL_SENDER(ID_NUMBER,[NAME],CONTACT_NUMBER, OPERATION)
	 VALUES(@senderid,@sendername,@sendercontact, 'updation')
END
-------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[sender_history_delete] ON [dbo].[SENDER]

   AFTER delete
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	 declare @senderid INT;
	 declare @sendername varchar(32);
	 declare @sendercontact varchar(15);

	 select @senderid =senderlist.ID_NUMBER from deleted senderlist;
	 select @sendername =senderlist.[NAME] from deleted senderlist;
	 select @sendercontact =senderlist.CONTACT_NUMBER from deleted senderlist;

	 delete from HISTORY_TRAIL_SENDER where ID_NUMBER = @senderid

	 INSERT INTO HISTORY_TRAIL_SENDER(ID_NUMBER,[NAME],CONTACT_NUMBER, OPERATION)
	 VALUES(@senderid,@sendername,@sendercontact, 'deletion')
END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[shipmenttime_history_update] ON [dbo].[SHIPMENT_TIME]

   AFTER update
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @shipmenttimeid int;
	 declare @shipmenttimeday varchar(15);
	 declare @shipmenttimedate varchar(32);
	 declare @shipmenttimetime varchar(32);
	 

	 
	 select @shipmenttimeid= shipmenttimelist.PK_VALUE_OF_ST from deleted shipmenttimelist;
	 select @shipmenttimeday = shipmenttimelist.[DAY] from deleted shipmenttimelist;
	 select @shipmenttimedate = shipmenttimelist.[DATE] from deleted shipmenttimelist;
	 select @shipmenttimetime = shipmenttimelist.[TIME] from deleted shipmenttimelist;
	 
	 delete from HISTORY_TRAIL_SHIPMENT_TIME where PK_VALUE_OF_ST = @shipmenttimeid

	 INSERT INTO HISTORY_TRAIL_SHIPMENT_TIME(PK_VALUE_OF_ST,[DAY],[DATE],[TIME], OPERATION)
	 VALUES(@shipmenttimeid,@shipmenttimeday,@shipmenttimedate,@shipmenttimetime, 'updation')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[shipmenttime_history_delete] ON [dbo].[SHIPMENT_TIME]

   AFTER delete
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @shipmenttimeid int;
	 declare @shipmenttimeday varchar(15);
	 declare @shipmenttimedate varchar(32);
	 declare @shipmenttimetime varchar(32);
	 

	 
	 select @shipmenttimeid= shipmenttimelist.PK_VALUE_OF_ST from deleted shipmenttimelist;
	 select @shipmenttimeday = shipmenttimelist.[DAY] from deleted shipmenttimelist;
	 select @shipmenttimedate = shipmenttimelist.[DATE] from deleted shipmenttimelist;
	 select @shipmenttimetime = shipmenttimelist.[TIME] from deleted shipmenttimelist;
	 
	 delete from HISTORY_TRAIL_SHIPMENT_TIME where PK_VALUE_OF_ST = @shipmenttimeid

	 INSERT INTO HISTORY_TRAIL_SHIPMENT_TIME(PK_VALUE_OF_ST,[DAY],[DATE],[TIME], OPERATION)
	 VALUES(@shipmenttimeid,@shipmenttimeday,@shipmenttimedate,@shipmenttimetime, 'deletion')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[package_history_update] ON [dbo].[PACKAGE]

   AFTER update
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @packageid VARCHAR(20);
	 declare @packagetype varchar(32);
	 declare @packageweight float;
	 declare @packagesenderid INT;
	 declare @packagereceiverid INT;
	 declare @packageshipmenttypeid int;
	 declare @packagedestinationtypeid int;
	 declare @packageamountid int;
	 declare @packagelogisticid INT;
	 declare @packageshipmenttimeid int;
	 declare @packagebranchid INT;
	 declare @packagearrivalid int;
	 declare @packageconsignerid INT;
	 declare @packagestatusid int;
	 declare @condition bit

     select @packageid= packagelist.PACKAGE_ID from deleted packagelist;
     select @packagetype= packagelist.PACKAGE_TYPE from deleted packagelist;	 
	 select @packageweight= packagelist.PACKAGE_WEIGHT_IN_KG from deleted packagelist;
	 select @packagesenderid= packagelist.SENDER_ID from deleted packagelist;
	 select @packagereceiverid= packagelist.RECEIVER_ID from deleted packagelist;
	 select @packageshipmenttypeid= packagelist.SHIPMENT_TYPE_ID from deleted packagelist;
	 select @packagedestinationtypeid= packagelist.DESTINATION_TYPE_ID from deleted packagelist;
	 select @packageamountid= packagelist.AMOUNT_ID from deleted packagelist;
	 select @packagelogisticid= packagelist.LOGISTIC_DEPARTMENT_ID from deleted packagelist;
	 select @packageshipmenttimeid= packagelist.TIME_OF_SHIPMENT from deleted packagelist;
	 select @packagebranchid= packagelist.DESTINATION_BRANCH_ID from deleted packagelist;
	 select @packagearrivalid= packagelist.TIME_OF_ARRIVAL from deleted packagelist;
	 select @packageconsignerid= packagelist.CONSIGNOR_ID from deleted packagelist;
	 select @packagestatusid= packagelist.STATUS_ID from deleted packagelist;
	
	delete from HISTORY_TRAIL_PACKAGE where PACKAGE_ID = @packageid

	INSERT INTO HISTORY_TRAIL_PACKAGE(PACKAGE_ID,PACKAGE_TYPE,PACKAGE_WEIGHT_IN_KG,SENDER_ID,RECEIVER_ID,SHIPMENT_TYPE_ID,DESTINATION_TYPE_ID,AMOUNT_ID,LOGISTIC_DEPARTMENT_ID,TIME_OF_SHIPMENT,DESTINATION_BRANCH_ID,TIME_OF_ARRIVAL,CONSIGNOR_ID,STATUS_ID, OPERATION)
	VALUES(@packageid,@packagetype,@packageweight,@packagesenderid,@packagereceiverid,@packageshipmenttypeid,@packagedestinationtypeid,@packageamountid,@packagelogisticid,@packageshipmenttimeid,@packagebranchid,@packagearrivalid,@packageconsignerid,@packagestatusid, 'updation')

END
--------------------------------------------------------------------------------------
GO
CREATE TRIGGER [dbo].[package_history_delete] ON [dbo].[PACKAGE]

   AFTER delete
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for trigger here
	 declare @packageid VARCHAR(20);
	 declare @packagetype varchar(32);
	 declare @packageweight float;
	 declare @packagesenderid INT;
	 declare @packagereceiverid INT;
	 declare @packageshipmenttypeid int;
	 declare @packagedestinationtypeid int;
	 declare @packageamountid int;
	 declare @packagelogisticid INT;
	 declare @packageshipmenttimeid int;
	 declare @packagebranchid INT;
	 declare @packagearrivalid int;
	 declare @packageconsignerid INT;
	 declare @packagestatusid int;
	 declare @condition bit

     select @packageid= packagelist.PACKAGE_ID from deleted packagelist;
     select @packagetype= packagelist.PACKAGE_TYPE from deleted packagelist;	 
	 select @packageweight= packagelist.PACKAGE_WEIGHT_IN_KG from deleted packagelist;
	 select @packagesenderid= packagelist.SENDER_ID from deleted packagelist;
	 select @packagereceiverid= packagelist.RECEIVER_ID from deleted packagelist;
	 select @packageshipmenttypeid= packagelist.SHIPMENT_TYPE_ID from deleted packagelist;
	 select @packagedestinationtypeid= packagelist.DESTINATION_TYPE_ID from deleted packagelist;
	 select @packageamountid= packagelist.AMOUNT_ID from deleted packagelist;
	 select @packagelogisticid= packagelist.LOGISTIC_DEPARTMENT_ID from deleted packagelist;
	 select @packageshipmenttimeid= packagelist.TIME_OF_SHIPMENT from deleted packagelist;
	 select @packagebranchid= packagelist.DESTINATION_BRANCH_ID from deleted packagelist;
	 select @packagearrivalid= packagelist.TIME_OF_ARRIVAL from deleted packagelist;
	 select @packageconsignerid= packagelist.CONSIGNOR_ID from deleted packagelist;
	 select @packagestatusid= packagelist.STATUS_ID from deleted packagelist;
	
	delete from HISTORY_TRAIL_PACKAGE where PACKAGE_ID = @packageid

	INSERT INTO HISTORY_TRAIL_PACKAGE(PACKAGE_ID,PACKAGE_TYPE,PACKAGE_WEIGHT_IN_KG,SENDER_ID,RECEIVER_ID,SHIPMENT_TYPE_ID,DESTINATION_TYPE_ID,AMOUNT_ID,LOGISTIC_DEPARTMENT_ID,TIME_OF_SHIPMENT,DESTINATION_BRANCH_ID,TIME_OF_ARRIVAL,CONSIGNOR_ID,STATUS_ID, OPERATION)
	VALUES(@packageid,@packagetype,@packageweight,@packagesenderid,@packagereceiverid,@packageshipmenttypeid,@packagedestinationtypeid,@packageamountid,@packagelogisticid,@packageshipmenttimeid,@packagebranchid,@packagearrivalid,@packageconsignerid,@packagestatusid, 'deletion')

END
--------------------------------------------------------------------------------------


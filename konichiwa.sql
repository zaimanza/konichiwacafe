CREATE TABLE "CUSTOMER" 
   (	"CUSTID" NUMBER, 
	"CUSTFNAME" VARCHAR2(20 BYTE), 
	"CUSTLNAME" VARCHAR2(20 BYTE), 
	"CUSTPHONE" VARCHAR2(15 BYTE), 
	"CUSTEMAIL" VARCHAR2(20 BYTE), 
	"CUSTPASSWORD" VARCHAR2(8 BYTE)
   )
CREATE TABLE "ADDRESS" 
   (	"ADDRESSID" NUMBER, 
	"ADDRESSSTREET" VARCHAR2(50 BYTE), 
	"ADDRESSCITY" VARCHAR2(30 BYTE), 
	"ADDRESSPOSTCODE" VARCHAR2(5 BYTE), 
	"ADDRESSSTATE" VARCHAR2(50 BYTE), 
	"CUSTID" NUMBER
   )
CREATE TABLE "ITEM_CATEGORY" 
   (	"ITEMCATEGORYID" NUMBER, 
	"CATEGORYNAME" VARCHAR2(20 BYTE)
   )
 CREATE TABLE "ITEM" 
   (	"ITEMID" NUMBER, 
	"ITEMNAME" VARCHAR2(30 BYTE), 
	"ITEMPRICE" NUMBER(4,2), 
	"ITEMSTOCK" NUMBER(*,0), 
	"ITEMDESC" VARCHAR2(100 BYTE),
	"ITEMIMAGE" BLOB, 
	"STAFFID" NUMBER, 
	"ITEMCATEGORYID" NUMBER
	
   ) 
CREATE TABLE "RIDER" 
   (	"RIDERID" NUMBER, 
	"RIDERFNAME" VARCHAR2(20 BYTE), 
	"RIDERLNAME" VARCHAR2(20 BYTE), 
	"RIDERPHONE" VARCHAR2(15 BYTE), 
	"RIDEREMAIL" VARCHAR2(20 BYTE), 
	"RIDERPASSWORD" VARCHAR2(20 BYTE), 
	"RIDERVERIFY_STATUS" NUMBER(1,0) DEFAULT 0, 
	"RIDERAVAILABILITY" NUMBER(1,0) DEFAULT 0,
	"STAFFID" NUMBER
   )
CREATE TABLE "STAFF" 
   (	"STAFFID" NUMBER, 
	"STAFFFNAME" VARCHAR2(20 BYTE), 
	"STAFFLNAME" VARCHAR2(20 BYTE), 
	"STAFFPHONE" VARCHAR2(15 BYTE), 
	"STAFFEMAIL" VARCHAR2(20 BYTE), 
	"STAFFLPASSWORD" VARCHAR2(8 BYTE), 
	"STAFFTYPE" VARCHAR2(20 BYTE)
   )
CREATE TABLE "CASHIER" 
   (	"STAFFID" NUMBER, 
	"VERIFY_STATUS" NUMBER(1,0)
   )
   
CREATE TABLE "MASTER_ADMIN" 
   (	"STAFFID" NUMBER
   )
CREATE TABLE "PAYMENT" 
   (	"PAYMENTID" NUMBER, 
	"PAYMENTMETHODID" NUMBER, 
	"DELIVERYFEE" NUMBER(5,2), 
	"TRANSACTIONFEE" NUMBER(5,2), 
	"TOTALPRICE" NUMBER(5,2)
   )
CREATE TABLE "PAYMENT_METHOD" 
   (	"PAYMENTMETHODID" NUMBER, 
	"PAYMENTMETHOD" VARCHAR2(20 BYTE)
   )
CREATE TABLE "ORDERS" 
   (	"ORDERID" NUMBER, 
	"DELIVERYADDRESS" VARCHAR2(100 BYTE), 
	"PAYMENTID" NUMBER, 
	"ORDERSTATUS" VARCHAR2(20 BYTE), 
	"ORDERDATE" TIMESTAMP (6) WITH LOCAL TIME ZONE, 
	"CUSTID" NUMBER, 
	"STAFFID" NUMBER
   )
CREATE TABLE "ORDER_DETAILS" 
   (	"ORDER_DETAILSID" NUMBER, 
	"ITEM_ORDERQTY" NUMBER(*,0),
	"ORDERID" NUMBER, 
	"ITEMID" NUMBER
   )
   
ALTER TABLE "ADDRESS" ADD CONSTRAINT "ADDRESS_PK1" PRIMARY KEY ("ADDRESSID");
ALTER TABLE "CUSTOMER" ADD CONSTRAINT "CUSTOMER_PK1" PRIMARY KEY ("CUSTID");
ALTER TABLE "ITEM" ADD CONSTRAINT "ITEM_PK1" PRIMARY KEY ("ITEMID");
ALTER TABLE "ITEM_CATEGORY" ADD CONSTRAINT "ITEM_CATEGORY_PK1" PRIMARY KEY ("ITEMCATEGORYID");
ALTER TABLE "ORDER_DETAILS" ADD CONSTRAINT "ORDER_DETAILS_PK1" PRIMARY KEY ("ORDER_DETAILSID");
ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_PK1" PRIMARY KEY ("ORDERID");
ALTER TABLE "PAYMENT_METHOD" ADD CONSTRAINT "PAYMENT_METHOD_PK1" PRIMARY KEY ("PAYMENTMETHODID");
ALTER TABLE "PAYMENT" ADD CONSTRAINT "PAYMENT_PK1" PRIMARY KEY ("PAYMENTID");
ALTER TABLE "RIDER" ADD CONSTRAINT "RIDER_PK1" PRIMARY KEY ("RIDERID");
ALTER TABLE "STAFF" ADD CONSTRAINT "STAFF_PK1" PRIMARY KEY ("STAFFID");

ALTER TABLE "ADDRESS" ADD CONSTRAINT "ADDRESS_FK1" FOREIGN KEY ("CUSTID")
  REFERENCES "CUSTOMER" ("CUSTID") ON DELETE CASCADE ENABLE;
ALTER TABLE "ITEM" ADD CONSTRAINT "ITEM_FK1" FOREIGN KEY ("ITEMCATEGORYID")
  REFERENCES "ITEM_CATEGORY" ("ITEMCATEGORYID")  ON DELETE SET NULL;
ALTER TABLE "ITEM" ADD CONSTRAINT "ITEM_FK2" FOREIGN KEY ("STAFFID")
  REFERENCES "STAFF" ("STAFFID") ON DELETE SET NULL;
ALTER TABLE "ORDERS" ADD CONSTRAINT "CUST_ORDER_FK1" FOREIGN KEY ("CUSTID")
  REFERENCES "CUSTOMER" ("CUSTID") ON DELETE CASCADE DISABLE;
ALTER TABLE "ORDERS" ADD CONSTRAINT "PAYMENT_ORDER_FK1" FOREIGN KEY ("PAYMENTID")
  REFERENCES "PAYMENT" ("PAYMENTID") ON DELETE CASCADE DISABLE;
ALTER TABLE "ORDERS" ADD CONSTRAINT "STAFF_ORDER_FK1" FOREIGN KEY ("STAFFID")
  REFERENCES "STAFF" ("STAFFID") ON DELETE SET NULL;
ALTER TABLE "ORDER_DETAILS" ADD CONSTRAINT "ORDER_DETAILS_FK1" FOREIGN KEY ("ITEMID")
  REFERENCES "ITEM" ("ITEMID") ON DELETE CASCADE DISABLE;
ALTER TABLE "ORDER_DETAILS" ADD CONSTRAINT "ORDER_DETAILS_FK2" FOREIGN KEY ("ORDERID")
  REFERENCES "ORDERS" ("ORDERID") ON DELETE CASCADE DISABLE;
ALTER TABLE "RIDER" ADD CONSTRAINT "RIDER_FK1" FOREIGN KEY ("STAFFID")
  REFERENCES "STAFF" ("STAFFID") ON DELETE SET NULL;
ALTER TABLE "PAYMENT" ADD CONSTRAINT "PAYMENT_FK1" FOREIGN KEY ("PAYMENTMETHODID")
  REFERENCES "PAYMENT_METHOD" ("PAYMENTMETHODID") ON DELETE CASCADE DISABLE;
ALTER TABLE "MASTER_ADMIN" ADD CONSTRAINT "MASTER_ADMIN_FK1" FOREIGN KEY ("STAFFID")
	  REFERENCES "STAFF" ("STAFFID") ON DELETE CASCADE ENABLE;
ALTER TABLE "CASHIER" ADD CONSTRAINT "CASHIER_FK1" FOREIGN KEY ("STAFFID")
	  REFERENCES "STAFF" ("STAFFID") ON DELETE CASCADE ENABLE;

CREATE OR REPLACE TRIGGER "ADDRESS_TRG" 
BEFORE INSERT ON ADDRESS
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ADDRESSID IS NULL THEN
      SELECT ADDRESS_SEQ.NEXTVAL INTO :NEW.ADDRESSID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ADDRESS_TRG" ENABLE;
ALTER SEQUENCE  "ADDRESS_SEQ" NOCACHE  NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER "CUSTOMER_TRG" 
BEFORE INSERT ON CUSTOMER
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.CUSTID IS NULL THEN
      SELECT CUSTOMERS_SEQ.NEXTVAL INTO :NEW.CUSTID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CUSTOMER_TRG" ENABLE;
ALTER SEQUENCE  "CUSTOMERS_SEQ" NOCACHE  NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER "ITEM_CATEGORY_TRG" 
BEFORE INSERT ON ITEM_CATEGORY
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ITEMCATEGORYID IS NULL THEN
      SELECT ITEM_CATEGORY_SEQ.NEXTVAL INTO :NEW.ITEMCATEGORYID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ITEM_CATEGORY_TRG" ENABLE;
ALTER SEQUENCE  "ITEM_CATEGORY_SEQ" NOCACHE  NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER "ITEM_TRG" 
BEFORE INSERT ON ITEM
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ITEMID IS NULL THEN
      SELECT ITEM_SEQ.NEXTVAL INTO :NEW.ITEMID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ITEM_TRG" ENABLE;
ALTER SEQUENCE  "ITEM_SEQ" NOCACHE  NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER "STAFF_TRG" 
BEFORE INSERT ON STAFF
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.STAFFID IS NULL THEN
      SELECT STAFF_SEQ.NEXTVAL INTO :NEW.STAFFID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "STAFF_TRG" ENABLE;
ALTER SEQUENCE  "STAFF_SEQ" NOCACHE  NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER "RIDER_TRG" 
BEFORE INSERT ON RIDER
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.RIDERID IS NULL THEN
      SELECT RIDER_SEQ.NEXTVAL INTO :NEW.RIDERID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "RIDER_TRG" ENABLE;
ALTER SEQUENCE  "RIDER_SEQ" NOCACHE  NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER "ORDER_DETAILS_TRG" 
BEFORE INSERT ON ORDER_DETAILS
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ORDER_DETAILSID IS NULL THEN
      SELECT ORDER_DETAILS_SEQ.NEXTVAL INTO :NEW.ORDER_DETAILSID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ORDER_DETAILS_TRG" ENABLE;
ALTER SEQUENCE  "ORDER_DETAILS_SEQ" NOCACHE  NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER "ORDERS_TRG" 
BEFORE INSERT ON ORDERS
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ORDERID IS NULL THEN
      SELECT ORDERS_SEQ.NEXTVAL INTO :NEW.ORDERID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ORDERS_TRG" ENABLE;
ALTER SEQUENCE  "ORDERS_SEQ" NOCACHE  NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER "PAYMENT_METHOD_TRG" 
BEFORE INSERT ON PAYMENT_METHOD
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.PAYMENTMETHODID IS NULL THEN
      SELECT PAYMENT_METHOD_SEQ.NEXTVAL INTO :NEW.PAYMENTMETHODID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "PAYMENT_METHOD_TRG" ENABLE;
ALTER SEQUENCE  "PAYMENT_METHOD_SEQ" NOCACHE  NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER "PAYMENT_TRG" 
BEFORE INSERT ON PAYMENT
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.PAYMENTID IS NULL THEN
      SELECT PAYMENT_SEQ.NEXTVAL INTO :NEW.PAYMENTID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "PAYMENT_TRG" ENABLE;
ALTER SEQUENCE  "PAYMENT_SEQ" NOCACHE  NOORDER  NOCYCLE ;
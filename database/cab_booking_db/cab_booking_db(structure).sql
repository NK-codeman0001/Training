CREATE TYPE "trip_status" AS ENUM (
  'booked',
  'cancelled',
  'confirmed',
  'completed'
);

CREATE TYPE "transaction_status" AS ENUM (
  'success',
  'failed',
  'pending'
);

CREATE TYPE "payment_methods" AS ENUM (
  'cash',
  'upi',
  'card',
  'net banking'
);

CREATE TABLE "users" (
  "id" bigint,
  "name" varchar,
  "email" varchar,
  "phone" varchar UNIQUE,
  "dob" date,
  "gender" varchar,
  "created_at" timestamptz DEFAULT now(),
  PRIMARY KEY ("id")
);

CREATE TABLE "drivers" (
  "id" bigint,
  "name" varchar,
  "email" varchar,
  "phone" varchar UNIQUE,
  "dob" date,
  "gender" varchar,
  "aadhaar_number" bigint,
  "driving_licence_number" varchar,
  "driving_licence_expiry_date" date,
  "pancard_number" varchar,
  "is_working" boolean,
  "created_at" timestamptz DEFAULT now(),
  PRIMARY KEY ("id")
);

CREATE TABLE "drivers_records" (
  "id" bigint PRIMARY KEY,
  "driver_id" bigint,
  "cab_id" bigint,
  "start_date" date,
  "end_date" date
);

CREATE TABLE "shifts" (
  "id" bigint PRIMARY KEY,
  "driver_id" bigint,
  "login_time" timetz,
  "logout_time" timetz,
  "successful_rides" integer,
  "date" date DEFAULT now()
);

CREATE TABLE "active_cab" (
  "cab_id" bigint PRIMARY KEY,
  "is_active" boolean,
  "current_location" point
);

CREATE TABLE "charging_modes" (
  "id" integer PRIMARY KEY,
  "mode" varchar
);

CREATE TABLE "cab_categories" (
  "id" integer PRIMARY KEY,
  "category" varchar
);

CREATE TABLE "car_model" (
  "id" bigint PRIMARY KEY,
  "model_name" varchar,
  "company_name" varchar
);

CREATE TABLE "cab_types" (
  "id" integer,
  "type" varchar,
  "base_charge" decimal,
  "charge_type" integer,
  "per_charge" decimal,
  PRIMARY KEY ("id")
);

CREATE TABLE "cabs" (
  "id" bigint,
  "car_model_id" bigint,
  "category_id" integer,
  "type_id" integer,
  "is_active" boolean,
  "vehicle_registration_plate" varchar UNIQUE,
  "manufactured_year" integer,
  "registered_at" date DEFAULT now(),
  PRIMARY KEY ("id")
);

CREATE TABLE "miscellaneous_charges" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "charge" decimal
);

CREATE TABLE "other_charges" (
  "cab_types_id" integer,
  "miscellaneous_charges_id" integer
);

CREATE TABLE "bookings" (
  "id" bigint,
  "customer_id" bigint,
  "driver_record_id" bigint,
  "status" trip_status,
  "from" timestamp DEFAULT now(),
  "to" timestamp DEFAULT now(),
  "source" point,
  "destination" point,
  "booked_at" timestamptz DEFAULT now(),
  PRIMARY KEY ("id")
);

CREATE TABLE "payments" (
  "id" bigint,
  "booking_id" bigint,
  "method" payment_methods,
  "amount" decimal,
  "created_at" timestamptz DEFAULT now(),
  "status" transaction_status,
  PRIMARY KEY ("id")
);

CREATE TABLE "ratings" (
  "id" bigint,
  "booking_id" bigint,
  "value" smallint DEFAULT 5,
  "feedback" text,
  PRIMARY KEY ("id")
);

-----------------------------------------------------------------

ALTER TABLE "drivers_records" ADD FOREIGN KEY ("driver_id") REFERENCES "drivers" ("id");

ALTER TABLE "drivers_records" ADD FOREIGN KEY ("cab_id") REFERENCES "cabs" ("id");

ALTER TABLE "shifts" ADD FOREIGN KEY ("driver_id") REFERENCES "drivers" ("id");

ALTER TABLE "active_cab" ADD FOREIGN KEY ("cab_id") REFERENCES "cabs" ("id");

ALTER TABLE "cab_types" ADD FOREIGN KEY ("charge_type") REFERENCES "charging_modes" ("id");

ALTER TABLE "cabs" ADD FOREIGN KEY ("car_model_id") REFERENCES "car_model" ("id");

ALTER TABLE "cabs" ADD FOREIGN KEY ("category_id") REFERENCES "cab_categories" ("id");

ALTER TABLE "cabs" ADD FOREIGN KEY ("type_id") REFERENCES "cab_types" ("id");

ALTER TABLE "other_charges" ADD FOREIGN KEY ("cab_types_id") REFERENCES "cab_types" ("id");

ALTER TABLE "other_charges" ADD FOREIGN KEY ("miscellaneous_charges_id") REFERENCES "miscellaneous_charges" ("id");

ALTER TABLE "bookings" ADD FOREIGN KEY ("customer_id") REFERENCES "users" ("id");

ALTER TABLE "bookings" ADD FOREIGN KEY ("driver_record_id") REFERENCES "drivers_records" ("id");

ALTER TABLE "payments" ADD FOREIGN KEY ("booking_id") REFERENCES "bookings" ("id");

ALTER TABLE "ratings" ADD FOREIGN KEY ("booking_id") REFERENCES "bookings" ("id");

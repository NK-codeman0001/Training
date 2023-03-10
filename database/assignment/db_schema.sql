CREATE TABLE "flights" (
  "flno" BIGSERIAL PRIMARY KEY,
  "from" varchar(25),
  "to" varchar(25),
  "distance" integer,
  "departs" varchar(15),
  "arrives" varchar(15),
  "price" integer
);

CREATE TABLE "aircraft" (
  "aid" BIGSERIAL PRIMARY KEY,
  "aname" varchar,
  "cruisingrange" integer
);

CREATE TABLE "certified" (
  "eid" integer,
  "aid" integer,
  PRIMARY KEY ("eid", "aid")
);

CREATE TABLE "employees" (
  "eid" BIGSERIAL PRIMARY KEY,
  "ename" varchar,
  "salary" integer
);

ALTER TABLE "certified" ADD FOREIGN KEY ("eid") REFERENCES "employees" ("eid");

ALTER TABLE "aircraft" ADD FOREIGN KEY ("aid") REFERENCES "certified" ("aid");

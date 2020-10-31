CREATE TABLE "merchant" (
    "id" int   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    "id_merchant_category" int   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "merchant_category" (
    "id" int   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "transactions" (
    "id" int   NOT NULL,
    "date" timestamp without time zone   NOT NULL,
    "amount" float   NOT NULL,
    "card" VARCHAR(50)   NOT NULL,
    "id_merchant" int   NOT NULL,
    CONSTRAINT "pk_transactions" PRIMARY KEY (
        "id"
     )
);
CREATE TABLE "card_holder" (
    "id" int   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "credit_card" (
    "card" VARCHAR(20)   NOT NULL,
    "id_card_holder" int   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "id_card_holder"
     )
);

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "merchant_category" ("id");

ALTER TABLE "transactions" ADD CONSTRAINT "fk_transactions_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "merchant" ("id");

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_id_card_holder" FOREIGN KEY("id_card_holder")
REFERENCES "card_holder" ("id");

CREATE INDEX "idx_merchant_name"
ON "merchant" ("name");



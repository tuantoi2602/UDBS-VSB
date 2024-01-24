
CREATE TABLE address (
    id            INTEGER NOT NULL identity,
    address       VARCHAR(30) NOT NULL,
    postal_code   VARCHAR(10) NOT NULL
);

ALTER TABLE address ADD CONSTRAINT address_pk PRIMARY KEY ( id );

CREATE TABLE brand (
    id            INTEGER NOT NULL identity,
    brand_name    VARCHAR(15) NOT NULL,
    description   VARCHAR(100)
);

ALTER TABLE brand ADD CONSTRAINT brand_pk PRIMARY KEY ( id );

CREATE TABLE comment (
    user_id     INTEGER NOT NULL,
    shoe_id     INTEGER NOT NULL,
    comment     VARCHAR(1000) NOT NULL
);

ALTER TABLE comment ADD CONSTRAINT comment_pk PRIMARY KEY ( shoe_id,
                                                              user_id );

CREATE TABLE shoe (
    id                INTEGER NOT NULL identity,
    name_of_product   VARCHAR(15) NOT NULL,
    description       VARCHAR(500),
    size_us           INTEGER NOT NULL,
    price             INTEGER NOT NULL,
    user_id           INTEGER NOT NULL,
    brand_id          INTEGER NOT NULL
);
ALTER TABLE shoe
ADD CONSTRAINT price CHECK (price > 0)

ALTER TABLE shoe
ADD CONSTRAINT size_us CHECK (size_us >= 4 and size_us <= 15)



ALTER TABLE shoe ADD CONSTRAINT shoe_pk PRIMARY KEY ( id );

CREATE TABLE transactions (
    user_id            INTEGER NOT NULL,
    shoe_id            INTEGER NOT NULL,
    price              INTEGER NOT NULL,
    transaction_date   DATETIME NOT NULL
);

ALTER TABLE transactions ADD CONSTRAINT transaction_pk PRIMARY KEY ( user_id,
                                                                    shoe_id );
ALTER TABLE transactions ADD DEFAULT (getdate()) FOR transaction_date

CREATE TABLE users (
    id           INTEGER NOT NULL identity,
    login        VARCHAR(10) NOT NULL,
    name         VARCHAR(10) NOT NULL,
    surname      VARCHAR(10) NOT NULL,
    address_id   INTEGER NOT NULL,
    telephone    INTEGER,
    email        VARCHAR(30) NOT NULL,
    type         VARCHAR(10) NOT NULL
);

ALTER TABLE users
ADD CONSTRAINT type CHECK (type = 'admin' or type = 'seller' or type = 'customer')

ALTER TABLE  users ADD CONSTRAINT user_pk PRIMARY KEY ( id );

ALTER TABLE comment
    ADD CONSTRAINT comment_shoe_fk FOREIGN KEY ( shoe_id )
        REFERENCES shoe ( id );

ALTER TABLE comment
    ADD CONSTRAINT comment_user_fk FOREIGN KEY ( user_id )
        REFERENCES  users ( id );

ALTER TABLE shoe
    ADD CONSTRAINT shoe_brand_fk FOREIGN KEY ( brand_id )
        REFERENCES brand ( id );

ALTER TABLE shoe
    ADD CONSTRAINT shoe_user_fk FOREIGN KEY ( user_id )
        REFERENCES users ( id );

ALTER TABLE transactions
    ADD CONSTRAINT transaction_shoe_fk FOREIGN KEY ( shoe_id )
        REFERENCES shoe ( id );

ALTER TABLE transactions
    ADD CONSTRAINT transaction_user_fk FOREIGN KEY ( user_id )
        REFERENCES  users ( id );

ALTER TABLE  users
    ADD CONSTRAINT user_address_fk FOREIGN KEY ( address_id )
        REFERENCES address ( id );



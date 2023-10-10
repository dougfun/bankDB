CREATE TABLE IF NOT EXISTS bank (
    number INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (number)
);

CREATE TABLE IF NOT EXISTS agency (
    bank_number INTEGER NOT NULL,
    number INTEGER NOT NULL,
    name VARCHAR(80) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (bank_number, number),
    FOREIGN KEY (bank_number) REFERENCES bank (number)
);

CREATE TABLE IF NOT EXISTS cliente (
    number BIGSERIAL PRIMARY KEYm
    name VARCHAR(120) NOT NULL,
    email VARCHAR(250) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS bank_account (
    bank_number INTEGER NOT NULL,
    number_agency INTEGER NOT NULL,
    number BIGINT NOT NULL,
    digit SMALLINT NOT NULL,
    client_number BIGINT NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (bank_number, number_agency, number, digit, client_number),
    FOREIGN KEY (bank_number, number_agency) REFERENCES agency (bank_number, number),
    FOREIGN KEY (client_number) REFERENCES client (number)
);

CREATE TABLE IF NOT EXISTS transaction_type (
    id SMALLSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    creation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS client_transactions (
    id BIG SERIAL PRIMARY KEY,
    bank_number INTEGER NOT NULL,
    agency_number INTEGER NOT NULL,
    account_number BIGINT NOT NULL,
    account_digit SMALLINT NOT NULL,
    client_number BIGINT NOT NULL,
    transaction_type_id SMALLINT NOT NULL,
    ammount NUMERIC(15, 2) NOT NULL,
    date_creation TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (bank_number, agency_number, account_number, account_digit) REFERENCES bank_account( bank_number, number_agency, digit, client_number)
);

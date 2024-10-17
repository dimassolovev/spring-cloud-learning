-- sequence
CREATE SEQUENCE currency_data_id_seq
    START WITH 1
    INCREMENT BY 110
    NO MINVALUE
    NO MAXVALUE
    CACHE 110;

-- table
CREATE TABLE IF NOT EXISTS currency_data (
    id BIGINT PRIMARY KEY,
    trade_timestamp BIGINT NOT NULL,
    rate REAL NOT NULL,
    security_id INT NOT NULL,
    clearing_type_id INT NOT NULL,
    FOREIGN KEY (security_id) REFERENCES security(id) ON DELETE CASCADE,
    FOREIGN KEY (clearing_type_id) REFERENCES clearing_type(id) ON DELETE CASCADE
);
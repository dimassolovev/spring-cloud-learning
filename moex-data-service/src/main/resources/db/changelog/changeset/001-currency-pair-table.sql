CREATE TABLE IF NOT EXISTS "currency-pair" (
    id BIGINT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    pair_code VARCHAR(7) NOT NULL UNIQUE
);
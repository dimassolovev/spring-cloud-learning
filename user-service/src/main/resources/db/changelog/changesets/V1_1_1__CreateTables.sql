CREATE TABLE IF NOT EXISTS role
(
    id   INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS user_credentials
(
    id       INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    username VARCHAR(100) UNIQUE NOT NULL,
    email    VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS user_uuids
(
    id        INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_uuid UUID UNIQUE NOT NULL,
    user_id   INT UNIQUE REFERENCES user_credentials (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS user_roles
(
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_credentials (id),
    FOREIGN KEY (role_id) REFERENCES role (id),
    PRIMARY KEY (user_id, role_id)
);

CREATE TABLE IF NOT EXISTS security
(
    id        INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    pair_code VARCHAR(7) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS user_action
(
    id          INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    action_type VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE IF NOT EXISTS user_history
(
    id             INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id        INT UNIQUE NOT NULL,
    date           DATE       NOT NULL,
    time           TIME       NOT NULL,
    user_action_id INT        NOT NULL,
    FOREIGN KEY (user_action_id) REFERENCES user_action (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user_credentials (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS user_security
(
    user_id     INT,
    security_id INT,
    FOREIGN KEY (user_id) REFERENCES user_credentials (id) ON DELETE CASCADE,
    FOREIGN KEY (security_id) REFERENCES security (id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, security_id)
)
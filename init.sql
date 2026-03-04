# Этот скрипт должен лежать в папках shard1/ и shard2/
USE shard1_db; 

CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE INDEX idx_email ON users(email);

-- В shard1/init.sql:
INSERT INTO users (username, email) VALUES ('user_from_shard1', 'shard1@test.com');

-- В shard2/init.sql:
-- INSERT INTO users (username, email) VALUES ('user_from_shard2', 'shard2@test.com');

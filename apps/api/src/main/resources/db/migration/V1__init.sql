CREATE TABLE job (
                     id BIGSERIAL PRIMARY KEY,
                     title VARCHAR(255),
                     description TEXT,
                     skills VARCHAR(255),
                     location VARCHAR(100),
                     seniority VARCHAR(50),
                     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
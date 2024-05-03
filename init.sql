-- Create category table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL
);


-- Create user table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    avatar VARCHAR(150) DEFAULT 'avatar.png',
    email_verified_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    confirmation_token VARCHAR(200) DEFAULT NULL
);


-- Create threads table
CREATE TABLE threads (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    slug VARCHAR(250) NOT NULL,
    content TEXT,
    user_id INT,
    category_id INT,
    views_count INT DEFAULT 0,
    comments_count INT DEFAULT 0,
    best_comment_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);


-- Create comments table
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    user_id INT,
    thread_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (thread_id) REFERENCES threads(id)
);


-- Add foreign key constraint to threads table for best_comment_id
ALTER TABLE threads
ADD CONSTRAINT fk_best_comment_id
FOREIGN KEY (best_comment_id) REFERENCES comments(id);


-- Add created_at column to users table
ALTER TABLE users
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;


-- Add updated_at column to users table
ALTER TABLE users
ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


-- Add created_at column to comments table
INSERT INTO categories (name, slug) VALUES
    ('Nutrition', 'nutrition'),
    ('Fertilization', 'fertilization'),
    ('Disease', 'disease'),
    ('Weather', 'weather'),
    ('Other', 'other');

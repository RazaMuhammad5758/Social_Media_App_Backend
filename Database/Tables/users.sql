-- Creating the users table with various fields and primary key constraint

CREATE TABLE IF NOT EXISTS public.users
(
    id SERIAL NOT NULL PRIMARY KEY,  -- Automatically increments with each new row and set as the primary key
    username VARCHAR(45) NOT NULL,   -- Username, required
    email VARCHAR(45) NOT NULL,      -- Email, required
    password VARCHAR(200) NOT NULL,  -- Password, required
    name VARCHAR(45) NOT NULL,       -- Name, required
    "coverPic" VARCHAR(100),         -- Cover picture URL or path, optional
    "profilePic" VARCHAR(100),       -- 
    city VARCHAR(45),                -- 
    website VARCHAR(45)              -- Website URL, optional
);

-- Setting the owner of the users table to the postgres user
ALTER TABLE IF EXISTS public.users
    OWNER TO postgres;

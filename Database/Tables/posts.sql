-- Creating the posts table with various fields and primary key constraint

CREATE TABLE IF NOT EXISTS public.posts
(
    id SERIAL NOT NULL PRIMARY KEY,         -- Automatically increments with each new row and set as the primary key
    "desc" VARCHAR(200),                    -- Description of the post, optional
    img VARCHAR(200),                       -- Image URL or path for the post, optional
    "userId" INTEGER,                       -- ID of the user who created the post
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp of creation, defaults to current timestamp

    CONSTRAINT fk_user FOREIGN KEY ("userId")
        REFERENCES public.users (id)        -- Foreign key referencing the users table
        ON UPDATE CASCADE                   -- Cascade updates
        ON DELETE CASCADE                   -- Cascade deletions
);

-- Setting the owner of the posts table to the postgres user
ALTER TABLE IF EXISTS public.posts
    OWNER TO postgres;

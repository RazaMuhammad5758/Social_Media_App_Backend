-- Creating the comments table with various fields and primary key constraint

CREATE TABLE IF NOT EXISTS public.stories
(
    id SERIAL NOT NULL PRIMARY KEY,          -- Automatically increments with each new row and set as the primary key
    img VARCHAR(200),                     -- Description of the comment, optional
    "stories_userId" INTEGER,                   -- ID of the user who created the comment
    

    CONSTRAINT fk_user_story FOREIGN KEY ("stories_userId")
        REFERENCES public.users (id)         -- Foreign key referencing the users table
        ON UPDATE CASCADE                    -- Cascade updates
        ON DELETE CASCADE                   -- Cascade deletions

    
);

-- Setting the owner of the comments table to the postgres user
ALTER TABLE IF EXISTS public.stories
    OWNER TO postgres;

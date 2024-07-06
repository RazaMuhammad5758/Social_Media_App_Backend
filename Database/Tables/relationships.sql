-- Creating the comments table with various fields and primary key constraint

CREATE TABLE IF NOT EXISTS public.relationships
(
    id SERIAL NOT NULL PRIMARY KEY,          -- Automatically increments with each new row and set as the primary key
    "followerUserId" INTEGER,                     -- Description of the comment, optional
    "followedUserId" INTEGER,                   -- ID of the user who created the comment
    

    CONSTRAINT fk_user_follower FOREIGN KEY ("followerUserId")
        REFERENCES public.users (id)         -- Foreign key referencing the users table
        ON UPDATE CASCADE                    -- Cascade updates
        ON DELETE CASCADE,                   -- Cascade deletions
	CONSTRAINT fk_user_followed FOREIGN KEY ("followedUserId")
        REFERENCES public.users (id)         -- Foreign key referencing the users table
        ON UPDATE CASCADE                    -- Cascade updates
        ON DELETE CASCADE                   -- Cascade deletions
    
);

-- Setting the owner of the comments table to the postgres user
ALTER TABLE IF EXISTS public.relationships
    OWNER TO postgres;

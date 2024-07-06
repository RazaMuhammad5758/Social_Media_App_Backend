-- Creating the comments table with various fields and primary key constraint

CREATE TABLE IF NOT EXISTS public.likes
(
    id SERIAL NOT NULL PRIMARY KEY,          -- Automatically increments with each new row and set as the primary key
    "likeUserId" INTEGER,                     -- Description of the comment, optional
    "likePostId" INTEGER,                   -- ID of the user who created the comment
    

    CONSTRAINT fk_user_follower FOREIGN KEY ("likeUserId")
        REFERENCES public.users (id)         -- Foreign key referencing the users table
        ON UPDATE CASCADE                    -- Cascade updates
        ON DELETE CASCADE,                   -- Cascade deletions
	CONSTRAINT fk_user_followed FOREIGN KEY ("likePostId")
        REFERENCES public.posts (id)         -- Foreign key referencing the users table
        ON UPDATE CASCADE                    -- Cascade updates
        ON DELETE CASCADE                   -- Cascade deletions
    
);

-- Setting the owner of the comments table to the postgres user
ALTER TABLE IF EXISTS public.likes
    OWNER TO postgres;

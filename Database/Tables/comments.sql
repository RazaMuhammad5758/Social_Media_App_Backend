-- Creating the comments table with various fields and primary key constraint

CREATE TABLE IF NOT EXISTS public.comments
(
    id SERIAL NOT NULL PRIMARY KEY,          -- Automatically increments with each new row and set as the primary key
    "desc" VARCHAR(200),                     -- Description of the comment, optional
    created_at TIMESTAMP,                    -- Timestamp for when the comment was created, optional
    "cmnt_userId" INTEGER,                  
    "postId" INTEGER,                      

    CONSTRAINT fk_user_comment FOREIGN KEY ("cmnt_userId")
        REFERENCES public.users (id)         
        ON UPDATE CASCADE                    
        ON DELETE CASCADE,                   

    CONSTRAINT fk_post_comment FOREIGN KEY ("postId")
        REFERENCES public.posts (id)         -- Foreign key referencing the posts table
        ON UPDATE CASCADE                    -- Cascade updates
        ON DELETE CASCADE                    -- Cascade deletions
);

-- Setting the owner of the comments table to the postgres user
ALTER TABLE IF EXISTS public.comments
    OWNER TO postgres;

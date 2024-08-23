import { pool } from "../connetsDB.js";

export const getPosts = (req, res) => {
    const q = `
        SELECT p.*, u.id AS "userId", u.name, u."profilePic" 
        FROM posts AS p 
        JOIN users AS u ON u.id = p."userId"
    `;

    pool.query(q, (err, data) => {
        if (err) return res.status(500).json(err);

        return res.status(200).json(data.rows); // Use data.rows to get the actual rows from the result
    });
};

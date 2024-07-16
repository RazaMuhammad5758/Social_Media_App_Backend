import { pool } from "../connetsDB.js";
import bcrypt from "bcryptjs";

export const register = async (req, res) => {
    try {
        // Check if user exists
        const userCheckQuery = "SELECT * FROM users WHERE username = $1";
        const userCheckResult = await pool.query(userCheckQuery, [req.body.username]);
        
        if (userCheckResult.rows.length > 0) {
            return res.status(409).json("User already exists!");
        }

        // Create a new user
        // Hash the password
        const salt = bcrypt.genSaltSync(10);
        const hashedPassword = bcrypt.hashSync(req.body.password, salt);

        const insertUserQuery = 'INSERT INTO users (username, email, password, name) VALUES ($1, $2, $3, $4)';
        const values = [req.body.username, req.body.email, hashedPassword, req.body.name];

        await pool.query(insertUserQuery, values);
        return res.status(200).json("User has been created.");
    } catch (err) {
        return res.status(500).json(err);
    }
};

export const login = async (req, res) => {
    // Implement login functionality here
};

export const logout = async (req, res) => {
    // Implement logout functionality here
};

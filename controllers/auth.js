import { pool } from "../connetsDB.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";

// Register Function
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

// Login Function
export const login = async (req, res) => {
    try {
        const q = "SELECT * FROM users WHERE username = $1";
        const { rows } = await pool.query(q, [req.body.username]);

        if (rows.length === 0) return res.status(404).json("User not found");

        const user = rows[0];
        const checkPassword = bcrypt.compareSync(req.body.password, user.password);

        if (!checkPassword) return res.status(400).json("Wrong Password or Username");

        const token = jwt.sign({ id: user.id }, "secretkey");

        const { password, ...others } = user;

        res.cookie("accessToken", token, {
            httpOnly: true
        }).status(200).json(others);
    } catch (err) {
        return res.status(500).json(err);
    }
};

// Logout Function
export const logout = async (req, res) => {
    // Implement logout functionality
    res.clearCookie("accessToken");
    return res.status(200).json("User has been logged out.");
};

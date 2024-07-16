import pkg from 'pg';
const { Pool } = pkg;

export const pool = new Pool({
    host: "localhost",
    user: "postgres",
    password: "password",
    database: "social",
    port: 5432, // Default port for PostgreSQL
    max: 20, // Maximum number of connections in the pool
    idleTimeoutMillis: 30000, // Close idle clients after 30 seconds
    connectionTimeoutMillis: 2000, // Return an error after 2 seconds if connection could not be established
});

pool.on('connect', () => {
    console.log('Connected to PostgreSQL');
});

pool.on('error', (err) => {
    console.error('Unexpected error on idle client', err);
    process.exit(-1);
});

const { Pool } = require('pg')
const pool = new Pool({
    host: '192.168.57.101',
    database: 'microservices',
    user: 'postgres',
    password: 'times@123',
    max: 5,
    idleTimeoutMillis: 30000,
    connectionTimeoutMillis: 2000,
})

let execute = async (query, values) => {
    let response = {}
    const client = await pool.connect()
    try {
        response = await client.query(query, values)
    } finally {
        client.release()
    }
    return response
}

module.exports.execute = execute
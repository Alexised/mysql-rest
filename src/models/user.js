const mysql = require('mysql')

connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'torneos'
});

let userModel = {};

userModel.getUsers = (callback) => {
    if (connection) {
        connection.query('SELECT *FROM championship ORDER BY idChampionship',
            (err, rows) => {
                if (err) {
                    throw err;
                } else {
                    callback(null, rows)
                }
            })
    }
}
module.exports = userModel;

userModel.insertchampionship = (chapionshipData, callback) => {
    if (connection) {
        connection.query(
            'INSERT INTO championship SET ?', chapionshipData,
            (err, result) => {
                if (err) {
                    throw err;
                } else {
                    callback(null, {
                        'InsertId': result.insertId
                    });
                }
            }
        )
    }
};
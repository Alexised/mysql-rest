const mysql = require('mysql')

connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'torneos'
});

let userModel = {};

userModel.getChapionship = (callback) => {
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
                        'insertId': result.insertId
                    });
                }
            }
        )
    }
};
userModel.insertGroups = (GroupData, callback) => {
    if (connection) {
        connection.query(
            'INSERT INTO groups SET ?', GroupData,
            (err, result) => {
                if (err) {
                    throw err;
                } else {
                    callback(null, {
                        'insertId': result.insertId
                    });
                }
            }
        )
    }
};
userModel.getGroups = (callback) => {
    if (connection) {
        connection.query('SELECT *FROM Groups ORDER BY idGroups',
            (err, rows) => {
                if (err) {
                    throw err;
                } else {
                    callback(null, rows)
                }
            })
    }
}
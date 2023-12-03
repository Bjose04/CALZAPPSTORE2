let mysql = require('mysql');


let conexion = mysql.createConnection({
    host: 'localhost',
    database: 'bdzapatoapp',
    user: 'root',
    password: 'root'
});

conexion.connect(function (error) {
    if (error) {
        console.error('Error de conexion: ' + error);
    } else {
        console.log('Conexion correcta.');
    }
});

conexion.end();



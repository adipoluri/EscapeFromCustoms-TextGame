var mysql = require('mysql');
var PStats;
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password:"password",
    database: "PlayerStats"
});



con.connect(function(err){
    if (err) throw err;
    console.log("Connected!");
    con.query("Select * FROM PStats", function (err, result, fields) {
        if (err) throw err;
        console.log(result);
        PStats = [result[0].STR,
                  result[0].DEX,
                  result[0].PERC,
                  result[0].PREC];
        return PStats
    });
});

setTimeout(function(){exports.PStats = PStats;}, 100);
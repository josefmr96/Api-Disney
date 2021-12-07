import Sequelize from 'sequelize';
const db = new Sequelize('disney', 'root', '', {
    host: 'localhost',
    port: 'port',
    dialect: 'mysql',
    define: {
        timestamps : false
    },
    pool: {
        max: 5,
        min: 0,
        acquiere: 30000,
        idle: 10000
    },
    operatorAliases: false
});
export default db;

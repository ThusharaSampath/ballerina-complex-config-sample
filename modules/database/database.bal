public type OracleDBConfig record {|
    string host;
    string user;
    string password;
    string database;
    int port;
|};

configurable OracleDBConfig dbConfig = ?;
configurable boolean isDebugEnabled = ?;

public function getConfig() returns map<anydata> {
    return {
        "isDebugEnabled": isDebugEnabled,
        "dbConfig.host": dbConfig.host,
        "dbConfig.user": dbConfig.user,
        "dbConfig.password": dbConfig.password,
        "dbConfig.database": dbConfig.database,
        "dbConfig.port": dbConfig.port
    };
}

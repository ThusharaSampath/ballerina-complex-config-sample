public type OracleDBConfig record {|
    string host;
    string user;
    string password;
    string database;
    int port;
|};

configurable OracleDBConfig dbConfig = ?;
configurable boolean isDebugEnabled = ?;

public type OracleDBConfig record {|
    string host;
    string user;
    string password;
    string database;
    int port;
    map<string> options;
|};

public type ReplicaConfig record {|
    string host;
    int port;
|};

configurable OracleDBConfig dbConfig = ?;
configurable boolean isDebugEnabled = ?;
configurable map<string> dbMetadata = {};
configurable map<ReplicaConfig> replicaConfigs = {};

public function getConfig() returns map<anydata> {
    map<anydata> config = {
        "isDebugEnabled": isDebugEnabled,
        "dbConfig.host": dbConfig.host,
        "dbConfig.user": dbConfig.user,
        "dbConfig.password": dbConfig.password,
        "dbConfig.database": dbConfig.database,
        "dbConfig.port": dbConfig.port
    };

    foreach [string, string] [k, v] in dbMetadata.entries() {
        config["dbMetadata." + k] = v;
    }

    foreach [string, ReplicaConfig] [name, replica] in replicaConfigs.entries() {
        config["replicaConfigs." + name + ".host"] = replica.host;
        config["replicaConfigs." + name + ".port"] = replica.port;
    }

    return config;
}

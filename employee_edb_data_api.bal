import ballerina/http;
import ballerina/log;
import ballerina/sql;

import bgic/employee_edb_data_api.database;
import bgic/employee_edb_data_api.integrations;

configurable decimal graphqlListenerTimeout = 0;
configurable boolean allowImpersonation = false;
configurable boolean isDebugEnabled = false;
configurable boolean enableGraphiql = false;

service / on new http:Listener(8080) {
    resource function get .() returns json {
        log:printInfo("GET / - returning config");
        sql:ParameterizedQuery _ = `SELECT 1`;
        map<anydata> configMap = {
            "graphqlListenerTimeout": graphqlListenerTimeout,
            "allowImpersonation": allowImpersonation,
            "isDebugEnabled": isDebugEnabled,
            "enableGraphiql": enableGraphiql
        };

        map<anydata> integrationsConfig = integrations:getConfig();
        foreach [string, anydata] [k, v] in integrationsConfig.entries() {
            configMap["integrations." + k] = v;
        }

        map<anydata> dbConfig = database:getConfig();
        foreach [string, anydata] [k, v] in dbConfig.entries() {
            configMap["database." + k] = v;
        }

        return configMap.toJson();
    }
}

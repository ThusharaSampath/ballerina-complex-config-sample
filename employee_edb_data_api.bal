import ballerina/http;
import ballerina/log;
import ballerina/sql;

import bgic/employee_edb_data_api.database;
import bgic/employee_edb_data_api.integrations;

configurable decimal graphqlListenerTimeout = 0;
configurable boolean allowImpersonation = false;
configurable boolean isDebugEnabled = false;
configurable boolean enableGraphiql = false;

public function main() returns error? {
    database:OracleDBConfig _ = {host: "", user: "", password: "", database: "", port: 0};
    string _ = integrations:getBaseUrl();

    http:Client _ = check new ("https://example.com");
    log:printInfo("Hello");
    sql:ParameterizedQuery _ = `SELECT 1`;
}

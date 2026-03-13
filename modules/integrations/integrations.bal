configurable string employeeProfileBaseUrl = "";
configurable string employeeProfileConsumerKey = "";
configurable string employeeProfileConsumerSecret = "";
configurable string employeeProfileTokenURL = "";

public function getBaseUrl() returns string {
    return employeeProfileBaseUrl;
}

public function getConfig() returns map<anydata> {
    return {
        "employeeProfileBaseUrl": employeeProfileBaseUrl,
        "employeeProfileConsumerKey": employeeProfileConsumerKey,
        "employeeProfileConsumerSecret": employeeProfileConsumerSecret,
        "employeeProfileTokenURL": employeeProfileTokenURL
    };
}

library("RForcecom")

username <- "allister.mckenzie@makerbot.com"
password <- "N2!tiT!0nELS2EYbsKvgYJhFNG15vmc64"
instanceURL <- "https://na13.salesforce.com/"
apiVersion <- "30.0"
session <- rforcecom.login(username, password, instanceURL, apiVersion)


runQuery <- function(x,y) {
  soqlQuery = paste0("SELECT mbsu_Time_to_Repair__c, mbsu_Case_Product__c, CreatedDate FROM Case 
                    WHERE CreatedDate >= ",x,"T00:00:00.000Z 
                    AND CreatedDate <= ",y,"T23:59:00.000Z")
  rforcecom.query(session, soqlQuery)
}
public with sharing class ApexLoggingCheckController {
   
        @AuraEnabled(cacheable=true)
        public static List<Contact> findContacts(String searchKey) {
            String key = '%' + searchKey + '%';
            return [
                SELECT Id, Name, Title, Phone, Email
                FROM Contact
                WHERE Name LIKE :key 
                WITH SECURITY_ENFORCED
                LIMIT 10
            ];
        }
    
        @AuraEnabled
        public static void createTask() {
            String strUserId = UserInfo.getUserId();
            String strSubject = 'Test Task ' + String.valueOf(datetime.now());
            insert new Task(subject=strSubject, OwnerId=strUserId);
        }
    }

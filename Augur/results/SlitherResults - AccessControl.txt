Contract AccessControlContract
+---------------------------+-------------+
|          Variable         | Influencers |
+---------------------------+-------------+
|       roleAssignment      |      []     |
|    marketCreatorCounter   |      []     |
| designatedReporterCounter |      []     |
|    openReporterCounter    |      []     |
|       managerCounter      |      []     |
+---------------------------+-------------+
+-----------------------------------------------------+---------------------------------------------------------------------+
|                       Function                      |                      Internal & External Calls                      |
+-----------------------------------------------------+---------------------------------------------------------------------+
|                 constructor(address)                |                                  []                                 |
|   checkAccess(address,AccessControlContract.Roles)  |                                  []                                 |
|    changeMarketCreatorRoleForEntity(address,bool)   | ['checkAccess(address,AccessControlContract.Roles)', 'onlyAdmin()'] |
| changeDesignatedReporterRoleForEntity(address,bool) | ['checkAccess(address,AccessControlContract.Roles)', 'onlyAdmin()'] |
|    changeOpenReporterRoleForEntity(address,bool)    | ['checkAccess(address,AccessControlContract.Roles)', 'onlyAdmin()'] |
|     changeShareholderRoleForEntity(address,bool)    | ['checkAccess(address,AccessControlContract.Roles)', 'onlyAdmin()'] |
|       changeManagerRoleForEntity(address,bool)      | ['checkAccess(address,AccessControlContract.Roles)', 'onlyAdmin()'] |
|        changeAdminRoleForEntity(address,bool)       | ['checkAccess(address,AccessControlContract.Roles)', 'onlyAdmin()'] |
|            slitherConstructorVariables()            |                                  []                                 |
|                     onlyAdmin()                     |         ['checkAccess(address,AccessControlContract.Roles)']        |
+-----------------------------------------------------+---------------------------------------------------------------------+
Function constructor(address)
+-------------------------------------------------+-------------+
|                     Variable                    | Influencers |
+-------------------------------------------------+-------------+
|       AccessControlContract.roleAssignment      |      []     |
|    AccessControlContract.marketCreatorCounter   |      []     |
| AccessControlContract.designatedReporterCounter |      []     |
|    AccessControlContract.openReporterCounter    |      []     |
|       AccessControlContract.managerCounter      |      []     |
+-------------------------------------------------+-------------+
Function checkAccess(address,AccessControlContract.Roles)
+-------------------------------------------------+-------------+
|                     Variable                    | Influencers |
+-------------------------------------------------+-------------+
|       AccessControlContract.roleAssignment      |      []     |
|    AccessControlContract.marketCreatorCounter   |      []     |
| AccessControlContract.designatedReporterCounter |      []     |
|    AccessControlContract.openReporterCounter    |      []     |
|       AccessControlContract.managerCounter      |      []     |
+-------------------------------------------------+-------------+
Function changeMarketCreatorRoleForEntity(address,bool)
+-------------------------------------------------+-------------------------------------+
|                     Variable                    |             Influencers             |
+-------------------------------------------------+-------------------------------------+
|       AccessControlContract.roleAssignment      |                  []                 |
|    AccessControlContract.marketCreatorCounter   | ['giveRole', 'msg.sender', 'Roles'] |
| AccessControlContract.designatedReporterCounter |                  []                 |
|    AccessControlContract.openReporterCounter    |                  []                 |
|       AccessControlContract.managerCounter      |                  []                 |
+-------------------------------------------------+-------------------------------------+
Function changeDesignatedReporterRoleForEntity(address,bool)
+-------------------------------------------------+-------------------------------------+
|                     Variable                    |             Influencers             |
+-------------------------------------------------+-------------------------------------+
|       AccessControlContract.roleAssignment      |                  []                 |
|    AccessControlContract.marketCreatorCounter   |                  []                 |
| AccessControlContract.designatedReporterCounter | ['giveRole', 'msg.sender', 'Roles'] |
|    AccessControlContract.openReporterCounter    |                  []                 |
|       AccessControlContract.managerCounter      |                  []                 |
+-------------------------------------------------+-------------------------------------+
Function changeOpenReporterRoleForEntity(address,bool)
+-------------------------------------------------+-------------------------------------+
|                     Variable                    |             Influencers             |
+-------------------------------------------------+-------------------------------------+
|       AccessControlContract.roleAssignment      |                  []                 |
|    AccessControlContract.marketCreatorCounter   |                  []                 |
| AccessControlContract.designatedReporterCounter |                  []                 |
|    AccessControlContract.openReporterCounter    | ['giveRole', 'msg.sender', 'Roles'] |
|       AccessControlContract.managerCounter      |                  []                 |
+-------------------------------------------------+-------------------------------------+
Function changeShareholderRoleForEntity(address,bool)
+-------------------------------------------------+-------------+
|                     Variable                    | Influencers |
+-------------------------------------------------+-------------+
|       AccessControlContract.roleAssignment      |      []     |
|    AccessControlContract.marketCreatorCounter   |      []     |
| AccessControlContract.designatedReporterCounter |      []     |
|    AccessControlContract.openReporterCounter    |      []     |
|       AccessControlContract.managerCounter      |      []     |
+-------------------------------------------------+-------------+
Function changeManagerRoleForEntity(address,bool)
+-------------------------------------------------+-------------------------------------+
|                     Variable                    |             Influencers             |
+-------------------------------------------------+-------------------------------------+
|       AccessControlContract.roleAssignment      |                  []                 |
|    AccessControlContract.marketCreatorCounter   |                  []                 |
| AccessControlContract.designatedReporterCounter |                  []                 |
|    AccessControlContract.openReporterCounter    |                  []                 |
|       AccessControlContract.managerCounter      | ['giveRole', 'msg.sender', 'Roles'] |
+-------------------------------------------------+-------------------------------------+
Function changeAdminRoleForEntity(address,bool)
+-------------------------------------------------+-------------+
|                     Variable                    | Influencers |
+-------------------------------------------------+-------------+
|       AccessControlContract.roleAssignment      |      []     |
|    AccessControlContract.marketCreatorCounter   |      []     |
| AccessControlContract.designatedReporterCounter |      []     |
|    AccessControlContract.openReporterCounter    |      []     |
|       AccessControlContract.managerCounter      |      []     |
+-------------------------------------------------+-------------+
Function slitherConstructorVariables()
+-------------------------------------------------+-------------+
|                     Variable                    | Influencers |
+-------------------------------------------------+-------------+
|       AccessControlContract.roleAssignment      |      []     |
|    AccessControlContract.marketCreatorCounter   |      []     |
| AccessControlContract.designatedReporterCounter |      []     |
|    AccessControlContract.openReporterCounter    |      []     |
|       AccessControlContract.managerCounter      |      []     |
+-------------------------------------------------+-------------+
Function onlyAdmin()
+-------------------------------------------------+-------------+
|                     Variable                    | Influencers |
+-------------------------------------------------+-------------+
|       AccessControlContract.roleAssignment      |      []     |
|    AccessControlContract.marketCreatorCounter   |      []     |
| AccessControlContract.designatedReporterCounter |      []     |
|    AccessControlContract.openReporterCounter    |      []     |
|       AccessControlContract.managerCounter      |      []     |
+-------------------------------------------------+-------------+

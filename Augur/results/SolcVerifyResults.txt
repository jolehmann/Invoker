# Warnings:
solc-verify warning: Balance modifications due to gas consumption or miner rewards are not modeled

# Checking all functions
AccessControlContract::[constructor]: OK
AccessControlContract::checkAccess: OK
AccessControlContract::changeMarketCreatorRoleForEntity: OK
AccessControlContract::changeDesignatedReporterRoleForEntity: OK
AccessControlContract::changeOpenReporterRoleForEntity: OK
AccessControlContract::changeShareholderRoleForEntity: OK
AccessControlContract::changeManagerRoleForEntity: OK
AccessControlContract::changeAdminRoleForEntity: OK
Market::[constructor]: OK
Market::setReporter: OK
Market::setBonds: OK
Market::buyShares: OK
Market::sellShares: ERROR
 - Market.sol:134:2: Postcondition 'address(this).balance >= __verifier_old_uint(address(this).balance)' might not hold at end of function.
Market::claimReporterRole: OK
Market::designatedReport: OK
Market::openReport: OK
Market::disputeOutcome: OK
Market::closeTrading: OK
Market::allowOpenReport: ERROR
 - Market.sol:209:2: Function might modify 'openReporter' illegally
Market::closeDisputingWindow: ERROR
 - Market.sol:230:2: Function might modify balances illegally
 - Market.sol:219:2: Function might modify 'reportedOutcome' illegally
MarketManagement::createNewMarket: OK
MarketManagement::[implicit_constructor]: OK
Errors were found by the verifier.

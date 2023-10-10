// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract AccessControlContract {
	enum Roles { MARKET_CREATOR, DESIGNATED_REPORTER, OPEN_REPORTER, SHAREHOLDER, MANAGER, ADMIN }

	mapping(address => mapping(Roles => bool)) private roleAssignment;
	uint private marketCreatorCounter = 0;
	uint private designatedReporterCounter = 0;
	uint private openReporterCounter = 0;
	uint private managerCounter = 0;

	constructor(address admin) {
		roleAssignment[admin][Roles.ADMIN] = true;
	}

	function checkAccess(address entity, Roles role) public view returns(bool result) {
		return roleAssignment[entity][role];
	}

	/// @notice modifies roleAssignment[entity][Roles.MARKET_CREATOR]
	/// @notice modifies marketCreatorCounter
	function changeMarketCreatorRoleForEntity(address entity, bool giveRole) external onlyAdmin {
		if(giveRole) {
			require(!checkAccess(msg.sender, Roles.DESIGNATED_REPORTER), "The address cannot be a Designated Reporter as well.");
			require(!checkAccess(msg.sender, Roles.OPEN_REPORTER), "The address cannot be a Open Reporter as well.");
			require(!checkAccess(msg.sender, Roles.MANAGER), "The address cannot be a Manager as well.");
			require(marketCreatorCounter < 1, "There are already 1 Market Creator(s).");
			marketCreatorCounter++;
		} else {
			require(marketCreatorCounter > 0, "There needs to be at least one Market Creator before any role can be removed.");
			marketCreatorCounter--;
		}
		
		roleAssignment[entity][Roles.MARKET_CREATOR] = giveRole;
	}

	/// @notice modifies roleAssignment[entity][Roles.DESIGNATED_REPORTER]
	/// @notice modifies designatedReporterCounter
	function changeDesignatedReporterRoleForEntity(address entity, bool giveRole) external onlyAdmin {
		if(giveRole) {
			require(!checkAccess(msg.sender, Roles.MARKET_CREATOR), "The address cannot be a Market Creator as well.");
			require(!checkAccess(msg.sender, Roles.OPEN_REPORTER), "The address cannot be a Open Reporter as well.");
			require(designatedReporterCounter < 1, "There are already 1 Designated Reporter(s).");
			designatedReporterCounter++;
		} else {
			require(designatedReporterCounter > 0, "There needs to be at least one Designated Reporter before any role can be removed.");
			designatedReporterCounter--;
		}
		
		roleAssignment[entity][Roles.DESIGNATED_REPORTER] = giveRole;
	}

	/// @notice modifies roleAssignment[entity][Roles.OPEN_REPORTER]
	/// @notice modifies openReporterCounter
	function changeOpenReporterRoleForEntity(address entity, bool giveRole) external onlyAdmin {
		if(giveRole) {
			require(checkAccess(msg.sender, Roles.SHAREHOLDER), "The address needs to be a Shareholder as well.");
			require(!checkAccess(msg.sender, Roles.DESIGNATED_REPORTER), "The address cannot be a Designated Reporter as well.");
			require(!checkAccess(msg.sender, Roles.MARKET_CREATOR), "The address cannot be a Market Creator as well.");
			require(openReporterCounter < 1, "There are already 1 Open Reporter(s).");
			openReporterCounter++;
		} else {
			require(openReporterCounter > 0, "There needs to be at least one Open Reporter before any role can be removed.");
			openReporterCounter--;
		}
		
		roleAssignment[entity][Roles.OPEN_REPORTER] = giveRole;
	}

	/// @notice modifies roleAssignment[entity][Roles.SHAREHOLDER]
	function changeShareholderRoleForEntity(address entity, bool giveRole) external onlyAdmin {
		
		roleAssignment[entity][Roles.SHAREHOLDER] = giveRole;
	}

	/// @notice modifies roleAssignment[entity][Roles.MANAGER]
	/// @notice modifies managerCounter
	function changeManagerRoleForEntity(address entity, bool giveRole) external onlyAdmin {
		if(giveRole) {
			require(!checkAccess(msg.sender, Roles.MARKET_CREATOR), "The address cannot be a Market Creator as well.");
			require(managerCounter < 1, "There are already 1 Manager(s).");
			managerCounter++;
		} else {
			require(managerCounter > 0, "There needs to be at least one Manager before any role can be removed.");
			managerCounter--;
		}
		
		roleAssignment[entity][Roles.MANAGER] = giveRole;
	}
	/// @notice modifies roleAssignment[entity][Roles.ADMIN]
	function changeAdminRoleForEntity(address entity, bool giveRole) external onlyAdmin {
		roleAssignment[entity][Roles.ADMIN] = giveRole;
	}

	modifier onlyAdmin {
		require(checkAccess(msg.sender, Roles.ADMIN), "Access denied due to missing role!");
		_;
	}
}
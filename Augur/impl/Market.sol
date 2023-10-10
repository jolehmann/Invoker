// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./AccessControlContract.sol";

contract Market {
	enum OutcomeAcceptance { Agree, Disagree }

	AccessControlContract private accCtrl = new AccessControlContract(address(this)); // Auto-generated Field
	// Modification by: MARKET_CREATOR
	// Influence by: None
	address private designatedReporter; // Auto-generated Field

	// Modification by: SHAREHOLDER
	// Influence by: None
	address private openReporter; // Auto-generated Field

	// Modification by: MARKET_CREATOR
	// Influence by: None
	uint public validityBond; // Auto-generated Field

	// Modification by: MARKET_CREATOR
	// Influence by: None
	uint public creationBond; // Auto-generated Field

	// Modification by: MANAGER
	// Influence by: None
	bool private creationBondPaidOut; // Auto-generated Field

	// Modification by: SHAREHOLDER
	// Influence by: MARKET_CREATOR
	mapping(address => uint) private shares; // Auto-generated Field

	// Modification by: SHAREHOLDER
	// Influence by: None
	uint public disagreeCounter; // Auto-generated Field

	// Modification by: SHAREHOLDER
	// Influence by: None
	uint public agreeCounter; // Auto-generated Field

	// Modification by: SHAREHOLDER
	// Influence by: None
	mapping(address => OutcomeAcceptance) private disputes; // Auto-generated Field

	// Modification by: DESIGNATED_REPORTER, OPEN_REPORTER
	// Influence by: None
	string public reportedOutcome; // Auto-generated Field

	// Modification by: MARKET_CREATOR
	// Influence by: None
	bool private createdBonds; // Auto-generated Field

	// Modification by: MARKET_CREATOR
	// Influence by: None
	bool private reporterSet; // Auto-generated Field

	// Modification by: MANAGER
	// Influence by: MARKET_CREATOR
	bool private tradingActive; // Auto-generated Field

	// Modification by: DESIGNATED_REPORTER, OPEN_REPORTER, MANAGER
	// Influence by: None
	bool private designatedReportAllowed; // Auto-generated Field

	// Modification by: DESIGNATED_REPORTER, OPEN_REPORTER, MANAGER
	// Influence by: None
	bool private openReportAllowed; // Auto-generated Field

	// Modification by: DESIGNATED_REPORTER, OPEN_REPORTER, MANAGER
	// Influence by: None
	bool private disputesAllowed; // Auto-generated Field

	// Modification by: MANAGER
	// Influence by: None
	bool private settlementPhaseActive; // Auto-generated Field

	// Modification by: DESIGNATED_REPORTER
	// Influence by: None
	bool private designatedReporterReported; // Auto-generated Field

	constructor(address creator) {
		accCtrl.changeManagerRoleForEntity(msg.sender, true);
		accCtrl.changeMarketCreatorRoleForEntity(creator, true);
	}

	/// @notice modifies designatedReporter if !reporterSet
	/// @notice modifies reporterSet if !reporterSet
	/// @notice modifies tradingActive if createdBonds && !reporterSet
	function setReporter(address reporter) external onlyMarketCreator {
		require(!reporterSet, "Reporter is already set");
		designatedReporter = reporter;
		reporterSet = true;
		accCtrl.changeDesignatedReporterRoleForEntity(reporter, true);
		
		if(createdBonds) {
		    tradingActive = true;
		}
	}

	/// @notice modifies creationBond if !createdBonds
	/// @notice modifies validityBond if !createdBonds
	/// @notice modifies createdBonds if !createdBonds
	/// @notice modifies tradingActive if reporterSet && !createdBonds
	function setBonds(uint creation, uint validation) external onlyMarketCreator {
		require(!createdBonds, "Bonds are already created");
		creationBond = creation;
		validityBond = validation;
		createdBonds = true;
		
		if(reporterSet) {
		    tradingActive = true;
		}
	}

	/// @notice modifies shares[msg.sender] if tradingActive
	/// @notice modifies msg.sender.balance
	/// @notice modifies address(this).balance
	/// @notice postcondition address(this).balance >= __verifier_old_uint(address(this).balance)
	function buyShares() external payable {
		require(tradingActive, "Buying shares is currently not allowed");
		shares[msg.sender] += msg.value;
		
		if(shares[msg.sender] > 0) {
		    accCtrl.changeShareholderRoleForEntity(msg.sender, true);
		}
	}

	/// @notice modifies shares[msg.sender] if tradingActive
	/// @notice modifies msg.sender.balance
	/// @notice postcondition msg.sender.balance >= __verifier_old_uint(msg.sender.balance)
	/// @notice modifies address(this).balance
	/// @notice postcondition address(this).balance >= __verifier_old_uint(address(this).balance)
	function sellShares(uint toSell) external onlyShareholder {
		require(tradingActive, "Selling shares is currently not allowed");
		require(shares[msg.sender] >= toSell, "Cannot sell more shares than you have");
		
		uint amountBefore = shares[msg.sender];
		shares[msg.sender] -= toSell;
		if(!payable(msg.sender).send(toSell)) {
			shares[msg.sender] = amountBefore;
		}
		if(shares[msg.sender] == 0) {
		    accCtrl.changeShareholderRoleForEntity(msg.sender, false);
		}
	}

	/// @notice modifies openReporter if openReportAllowed
	function claimReporterRole() public onlyShareholder {
		require(openReportAllowed, "Open report is currently not allowed");
	    require(openReporter == address(0), "Role has already been claimed");
	    openReporter = msg.sender;
		accCtrl.changeOpenReporterRoleForEntity(msg.sender, true);
	}

	/// @notice modifies reportedOutcome if designatedReportAllowed
	/// @notice modifies designatedReporterReported if designatedReportAllowed
	/// @notice modifies designatedReportAllowed if designatedReportAllowed
	/// @notice modifies openReportAllowed if designatedReportAllowed
	/// @notice modifies disputesAllowed if designatedReportAllowed
	function designatedReport(string memory outcome) external onlyDesignatedReporter {
		require(designatedReportAllowed, "Designated report is currently not allowed");
		designatedReporterReported = true;
		report(outcome);
	}

	/// @notice modifies reportedOutcome if openReportAllowed
	/// @notice modifies designatedReportAllowed if openReportAllowed
	/// @notice modifies openReportAllowed if openReportAllowed
	/// @notice modifies disputesAllowed if openReportAllowed
	function openReport(string memory outcome) external onlyOpenReporter {
		require(openReportAllowed, "Open report is currently not allowed");
		report(outcome);
	}

	/// @notice modifies reportedOutcome 
	/// @notice modifies designatedReportAllowed 
	/// @notice modifies openReportAllowed 
	/// @notice modifies disputesAllowed 
	function report(string memory outcome) private onlyOpenReporterDesignatedReporter {
		reportedOutcome = outcome;
		designatedReportAllowed = false;
		openReportAllowed = false;
		disputesAllowed = true;
	}

	/// @notice modifies agreeCounter if disputesAllowed
	/// @notice modifies disagreeCounter if disputesAllowed
	/// @notice modifies disputes[msg.sender] if disputesAllowed
	function disputeOutcome(OutcomeAcceptance acceptance) external onlyShareholder {
		require(disputesAllowed, "No disputes are currently allowed");
		disputes[msg.sender] = acceptance;
		if(acceptance == OutcomeAcceptance.Agree) {
		    agreeCounter++;
		} else {
		    disagreeCounter++;
		}
	}

	/// @notice modifies tradingActive 
	/// @notice modifies designatedReportAllowed 
	function closeTrading() external onlyManager {
		tradingActive = false;
	    designatedReportAllowed = true;
	}

	/// @notice modifies designatedReportAllowed if !designatedReporterReported
	/// @notice modifies openReportAllowed if !designatedReporterReported
	function allowOpenReport() external onlyManager {
		require(!designatedReporterReported, "An outcome was reported by the designated reporter");
	    designatedReportAllowed = false;
	    openReportAllowed = true;
	    claimReporterRole();
	}

	/// @notice modifies disputesAllowed 
	/// @notice modifies creationBondPaidOut 
	/// @notice modifies settlementPhaseActive 
	function closeDisputingWindow() external onlyManager {
		disputesAllowed = false;
	    if(agreeCounter > disagreeCounter) {
	        settlementPhaseActive = true;
	        sentCreationBond();
	    } else {
	        reportedOutcome = "";
	    }
	}

	/// @notice modifies creationBondPaidOut if settlementPhaseActive
	function sentCreationBond() private onlyManager {
		require(settlementPhaseActive, "The creation bond cannot be sent yet");
		if(designatedReporterReported) {
		    creationBondPaidOut = true;
			if(!payable(designatedReporter).send(creationBond)) {
				creationBondPaidOut = false;
			}
		} else {
		    creationBondPaidOut = true;
			if(!payable(openReporter).send(creationBond)) {
				creationBondPaidOut = false;
			}
		}
	}

	modifier onlyMarketCreator {
		require(accCtrl.checkAccess(msg.sender, AccessControlContract.Roles.MARKET_CREATOR), "Access denied due to missing role!");
		_;
	}

	modifier onlyShareholder {
		require(accCtrl.checkAccess(msg.sender, AccessControlContract.Roles.SHAREHOLDER), "Access denied due to missing role!");
		_;
	}

	modifier onlyDesignatedReporter {
		require(accCtrl.checkAccess(msg.sender, AccessControlContract.Roles.DESIGNATED_REPORTER), "Access denied due to missing role!");
		_;
	}

	modifier onlyOpenReporter {
		require(accCtrl.checkAccess(msg.sender, AccessControlContract.Roles.OPEN_REPORTER), "Access denied due to missing role!");
		_;
	}

	modifier onlyOpenReporterDesignatedReporter {
		require(accCtrl.checkAccess(msg.sender, AccessControlContract.Roles.OPEN_REPORTER) ||
				accCtrl.checkAccess(msg.sender, AccessControlContract.Roles.DESIGNATED_REPORTER), "Access denied due to missing role!");
		_;
	}

	modifier onlyManager {
		require(accCtrl.checkAccess(msg.sender, AccessControlContract.Roles.MANAGER), "Access denied due to missing role!");
		_;
	}

}
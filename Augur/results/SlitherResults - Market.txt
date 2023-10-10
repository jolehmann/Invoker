Contract Market
+----------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|          Variable          |                                                                                                                    Influencers                                                                                                                     |
+----------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|          accCtrl           |                                                                                                                         []                                                                                                                         |
|     designatedReporter     |                                                                                                                  ['reporterSet']                                                                                                                   |
|        openReporter        |                                                                                   ['designatedReportAllowed', 'designatedReporterReported', 'openReportAllowed']                                                                                   |
|        validityBond        |                                                                                                                  ['createdBonds']                                                                                                                  |
|        creationBond        |                                                                                                                  ['createdBonds']                                                                                                                  |
|    creationBondPaidOut     | ['openReporter', 'designatedReporterReported', 'agreeCounter', 'designatedReportAllowed', 'creationBond', 'openReportAllowed', 'settlementPhaseActive', 'disputesAllowed', 'createdBonds', 'designatedReporter', 'reporterSet', 'disagreeCounter'] |
|           shares           |                                                                                                  ['tradingActive', 'reporterSet', 'createdBonds']                                                                                                  |
|      disagreeCounter       |                                                                                                                ['disputesAllowed']                                                                                                                 |
|        agreeCounter        |                                                                                                                ['disputesAllowed']                                                                                                                 |
|          disputes          |                                                                                                                ['disputesAllowed']                                                                                                                 |
|      reportedOutcome       |                                                                                               ['disagreeCounter', 'agreeCounter', 'disputesAllowed']                                                                                               |
|        createdBonds        |                                                                                                                         []                                                                                                                         |
|        reporterSet         |                                                                                                                         []                                                                                                                         |
|       tradingActive        |                                                                                                          ['reporterSet', 'createdBonds']                                                                                                           |
|  designatedReportAllowed   |                                                                                                           ['designatedReporterReported']                                                                                                           |
|     openReportAllowed      |                                                                                             ['designatedReportAllowed', 'designatedReporterReported']                                                                                              |
|      disputesAllowed       |                                                                                                                         []                                                                                                                         |
|   settlementPhaseActive    |                                                                                               ['disagreeCounter', 'agreeCounter', 'disputesAllowed']                                                                                               |
| designatedReporterReported |                                                                                                            ['designatedReportAllowed']                                                                                                             |
+----------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
+------------------------------------------+----------------------------------------------------------------------------------------+
|                 Function                 |                               Internal & External Calls                                |
+------------------------------------------+----------------------------------------------------------------------------------------+
|           constructor(address)           |                                           []                                           |
|           setReporter(address)           |                                ['onlyMarketCreator()']                                 |
|        setBonds(uint256,uint256)         |                                ['onlyMarketCreator()']                                 |
|               buyShares()                |                                           []                                           |
|           sellShares(uint256)            |                                 ['onlyShareholder()']                                  |
|           claimReporterRole()            |                                 ['onlyShareholder()']                                  |
|         designatedReport(string)         | ['report(string)', 'onlyDesignatedReporter()', 'onlyOpenReporterDesignatedReporter()'] |
|            openReport(string)            |    ['onlyOpenReporter()', 'report(string)', 'onlyOpenReporterDesignatedReporter()']    |
|              report(string)              |                        ['onlyOpenReporterDesignatedReporter()']                        |
| disputeOutcome(Market.OutcomeAcceptance) |                                 ['onlyShareholder()']                                  |
|              closeTrading()              |                                   ['onlyManager()']                                    |
|            allowOpenReport()             |             ['onlyShareholder()', 'onlyManager()', 'claimReporterRole()']              |
|          closeDisputingWindow()          |                        ['onlyManager()', 'sentCreationBond()']                         |
|            sentCreationBond()            |                                   ['onlyManager()']                                    |
|      slitherConstructorVariables()       |                                           []                                           |
|           onlyMarketCreator()            |                                           []                                           |
|            onlyShareholder()             |                                           []                                           |
|         onlyDesignatedReporter()         |                                           []                                           |
|            onlyOpenReporter()            |                                           []                                           |
|   onlyOpenReporterDesignatedReporter()   |                                           []                                           |
|              onlyManager()               |                                           []                                           |
+------------------------------------------+----------------------------------------------------------------------------------------+
Function constructor(address)
+-----------------------------------+-------------+
|              Variable             | Influencers |
+-----------------------------------+-------------+
|           Market.accCtrl          |      []     |
|     Market.designatedReporter     |      []     |
|        Market.openReporter        |      []     |
|        Market.validityBond        |      []     |
|        Market.creationBond        |      []     |
|     Market.creationBondPaidOut    |      []     |
|           Market.shares           |      []     |
|       Market.disagreeCounter      |      []     |
|        Market.agreeCounter        |      []     |
|          Market.disputes          |      []     |
|       Market.reportedOutcome      |      []     |
|        Market.createdBonds        |      []     |
|         Market.reporterSet        |      []     |
|        Market.tradingActive       |      []     |
|   Market.designatedReportAllowed  |      []     |
|      Market.openReportAllowed     |      []     |
|       Market.disputesAllowed      |      []     |
|    Market.settlementPhaseActive   |      []     |
| Market.designatedReporterReported |      []     |
+-----------------------------------+-------------+
Function setReporter(address)
+-----------------------------------+---------------------------------+
|              Variable             |           Influencers           |
+-----------------------------------+---------------------------------+
|           Market.accCtrl          |                []               |
|     Market.designatedReporter     |   ['reporter', 'reporterSet']   |
|        Market.openReporter        |                []               |
|        Market.validityBond        |                []               |
|        Market.creationBond        |                []               |
|     Market.creationBondPaidOut    |                []               |
|           Market.shares           |                []               |
|       Market.disagreeCounter      |                []               |
|        Market.agreeCounter        |                []               |
|          Market.disputes          |                []               |
|       Market.reportedOutcome      |                []               |
|        Market.createdBonds        |                []               |
|         Market.reporterSet        |                []               |
|        Market.tradingActive       | ['reporterSet', 'createdBonds'] |
|   Market.designatedReportAllowed  |                []               |
|      Market.openReportAllowed     |                []               |
|       Market.disputesAllowed      |                []               |
|    Market.settlementPhaseActive   |                []               |
| Market.designatedReporterReported |                []               |
+-----------------------------------+---------------------------------+
Function setBonds(uint256,uint256)
+-----------------------------------+---------------------------------+
|              Variable             |           Influencers           |
+-----------------------------------+---------------------------------+
|           Market.accCtrl          |                []               |
|     Market.designatedReporter     |                []               |
|        Market.openReporter        |                []               |
|        Market.validityBond        |  ['createdBonds', 'validation'] |
|        Market.creationBond        |   ['creation', 'createdBonds']  |
|     Market.creationBondPaidOut    |                []               |
|           Market.shares           |                []               |
|       Market.disagreeCounter      |                []               |
|        Market.agreeCounter        |                []               |
|          Market.disputes          |                []               |
|       Market.reportedOutcome      |                []               |
|        Market.createdBonds        |                []               |
|         Market.reporterSet        |                []               |
|        Market.tradingActive       | ['reporterSet', 'createdBonds'] |
|   Market.designatedReportAllowed  |                []               |
|      Market.openReportAllowed     |                []               |
|       Market.disputesAllowed      |                []               |
|    Market.settlementPhaseActive   |                []               |
| Market.designatedReporterReported |                []               |
+-----------------------------------+---------------------------------+
Function buyShares()
+-----------------------------------+--------------------------------+
|              Variable             |          Influencers           |
+-----------------------------------+--------------------------------+
|           Market.accCtrl          |               []               |
|     Market.designatedReporter     |               []               |
|        Market.openReporter        |               []               |
|        Market.validityBond        |               []               |
|        Market.creationBond        |               []               |
|     Market.creationBondPaidOut    |               []               |
|           Market.shares           | ['msg.value', 'tradingActive'] |
|       Market.disagreeCounter      |               []               |
|        Market.agreeCounter        |               []               |
|          Market.disputes          |               []               |
|       Market.reportedOutcome      |               []               |
|        Market.createdBonds        |               []               |
|         Market.reporterSet        |               []               |
|        Market.tradingActive       |               []               |
|   Market.designatedReportAllowed  |               []               |
|      Market.openReportAllowed     |               []               |
|       Market.disputesAllowed      |               []               |
|    Market.settlementPhaseActive   |               []               |
| Market.designatedReporterReported |               []               |
+-----------------------------------+--------------------------------+
Function sellShares(uint256)
+-----------------------------------+-----------------------------------------------------------+
|              Variable             |                        Influencers                        |
+-----------------------------------+-----------------------------------------------------------+
|           Market.accCtrl          |                             []                            |
|     Market.designatedReporter     |                             []                            |
|        Market.openReporter        |                             []                            |
|        Market.validityBond        |                             []                            |
|        Market.creationBond        |                             []                            |
|     Market.creationBondPaidOut    |                             []                            |
|           Market.shares           | ['toSell', 'amountBefore', 'tradingActive', 'msg.sender'] |
|       Market.disagreeCounter      |                             []                            |
|        Market.agreeCounter        |                             []                            |
|          Market.disputes          |                             []                            |
|       Market.reportedOutcome      |                             []                            |
|        Market.createdBonds        |                             []                            |
|         Market.reporterSet        |                             []                            |
|        Market.tradingActive       |                             []                            |
|   Market.designatedReportAllowed  |                             []                            |
|      Market.openReportAllowed     |                             []                            |
|       Market.disputesAllowed      |                             []                            |
|    Market.settlementPhaseActive   |                             []                            |
| Market.designatedReporterReported |                             []                            |
+-----------------------------------+-----------------------------------------------------------+
Function claimReporterRole()
+-----------------------------------+-------------------------------------+
|              Variable             |             Influencers             |
+-----------------------------------+-------------------------------------+
|           Market.accCtrl          |                  []                 |
|     Market.designatedReporter     |                  []                 |
|        Market.openReporter        | ['openReportAllowed', 'msg.sender'] |
|        Market.validityBond        |                  []                 |
|        Market.creationBond        |                  []                 |
|     Market.creationBondPaidOut    |                  []                 |
|           Market.shares           |                  []                 |
|       Market.disagreeCounter      |                  []                 |
|        Market.agreeCounter        |                  []                 |
|          Market.disputes          |                  []                 |
|       Market.reportedOutcome      |                  []                 |
|        Market.createdBonds        |                  []                 |
|         Market.reporterSet        |                  []                 |
|        Market.tradingActive       |                  []                 |
|   Market.designatedReportAllowed  |                  []                 |
|      Market.openReportAllowed     |                  []                 |
|       Market.disputesAllowed      |                  []                 |
|    Market.settlementPhaseActive   |                  []                 |
| Market.designatedReporterReported |                  []                 |
+-----------------------------------+-------------------------------------+
Function designatedReport(string)
+-----------------------------------+-----------------------------+
|              Variable             |         Influencers         |
+-----------------------------------+-----------------------------+
|           Market.accCtrl          |              []             |
|     Market.designatedReporter     |              []             |
|        Market.openReporter        |              []             |
|        Market.validityBond        |              []             |
|        Market.creationBond        |              []             |
|     Market.creationBondPaidOut    |              []             |
|           Market.shares           |              []             |
|       Market.disagreeCounter      |              []             |
|        Market.agreeCounter        |              []             |
|          Market.disputes          |              []             |
|       Market.reportedOutcome      |              []             |
|        Market.createdBonds        |              []             |
|         Market.reporterSet        |              []             |
|        Market.tradingActive       |              []             |
|   Market.designatedReportAllowed  |              []             |
|      Market.openReportAllowed     |              []             |
|       Market.disputesAllowed      |              []             |
|    Market.settlementPhaseActive   |              []             |
| Market.designatedReporterReported | ['designatedReportAllowed'] |
+-----------------------------------+-----------------------------+
Function openReport(string)
+-----------------------------------+-------------+
|              Variable             | Influencers |
+-----------------------------------+-------------+
|           Market.accCtrl          |      []     |
|     Market.designatedReporter     |      []     |
|        Market.openReporter        |      []     |
|        Market.validityBond        |      []     |
|        Market.creationBond        |      []     |
|     Market.creationBondPaidOut    |      []     |
|           Market.shares           |      []     |
|       Market.disagreeCounter      |      []     |
|        Market.agreeCounter        |      []     |
|          Market.disputes          |      []     |
|       Market.reportedOutcome      |      []     |
|        Market.createdBonds        |      []     |
|         Market.reporterSet        |      []     |
|        Market.tradingActive       |      []     |
|   Market.designatedReportAllowed  |      []     |
|      Market.openReportAllowed     |      []     |
|       Market.disputesAllowed      |      []     |
|    Market.settlementPhaseActive   |      []     |
| Market.designatedReporterReported |      []     |
+-----------------------------------+-------------+
Function report(string)
+-----------------------------------+-------------+
|              Variable             | Influencers |
+-----------------------------------+-------------+
|           Market.accCtrl          |      []     |
|     Market.designatedReporter     |      []     |
|        Market.openReporter        |      []     |
|        Market.validityBond        |      []     |
|        Market.creationBond        |      []     |
|     Market.creationBondPaidOut    |      []     |
|           Market.shares           |      []     |
|       Market.disagreeCounter      |      []     |
|        Market.agreeCounter        |      []     |
|          Market.disputes          |      []     |
|       Market.reportedOutcome      | ['outcome'] |
|        Market.createdBonds        |      []     |
|         Market.reporterSet        |      []     |
|        Market.tradingActive       |      []     |
|   Market.designatedReportAllowed  |      []     |
|      Market.openReportAllowed     |      []     |
|       Market.disputesAllowed      |      []     |
|    Market.settlementPhaseActive   |      []     |
| Market.designatedReporterReported |      []     |
+-----------------------------------+-------------+
Function disputeOutcome(Market.OutcomeAcceptance)
+-----------------------------------+--------------------------------------------------------+
|              Variable             |                      Influencers                       |
+-----------------------------------+--------------------------------------------------------+
|           Market.accCtrl          |                           []                           |
|     Market.designatedReporter     |                           []                           |
|        Market.openReporter        |                           []                           |
|        Market.validityBond        |                           []                           |
|        Market.creationBond        |                           []                           |
|     Market.creationBondPaidOut    |                           []                           |
|           Market.shares           |                           []                           |
|       Market.disagreeCounter      | ['OutcomeAcceptance', 'disputesAllowed', 'acceptance'] |
|        Market.agreeCounter        | ['OutcomeAcceptance', 'disputesAllowed', 'acceptance'] |
|          Market.disputes          |           ['disputesAllowed', 'acceptance']            |
|       Market.reportedOutcome      |                           []                           |
|        Market.createdBonds        |                           []                           |
|         Market.reporterSet        |                           []                           |
|        Market.tradingActive       |                           []                           |
|   Market.designatedReportAllowed  |                           []                           |
|      Market.openReportAllowed     |                           []                           |
|       Market.disputesAllowed      |                           []                           |
|    Market.settlementPhaseActive   |                           []                           |
| Market.designatedReporterReported |                           []                           |
+-----------------------------------+--------------------------------------------------------+
Function closeTrading()
+-----------------------------------+-------------+
|              Variable             | Influencers |
+-----------------------------------+-------------+
|           Market.accCtrl          |      []     |
|     Market.designatedReporter     |      []     |
|        Market.openReporter        |      []     |
|        Market.validityBond        |      []     |
|        Market.creationBond        |      []     |
|     Market.creationBondPaidOut    |      []     |
|           Market.shares           |      []     |
|       Market.disagreeCounter      |      []     |
|        Market.agreeCounter        |      []     |
|          Market.disputes          |      []     |
|       Market.reportedOutcome      |      []     |
|        Market.createdBonds        |      []     |
|         Market.reporterSet        |      []     |
|        Market.tradingActive       |      []     |
|   Market.designatedReportAllowed  |      []     |
|      Market.openReportAllowed     |      []     |
|       Market.disputesAllowed      |      []     |
|    Market.settlementPhaseActive   |      []     |
| Market.designatedReporterReported |      []     |
+-----------------------------------+-------------+
Function allowOpenReport()
+-----------------------------------+--------------------------------+
|              Variable             |          Influencers           |
+-----------------------------------+--------------------------------+
|           Market.accCtrl          |               []               |
|     Market.designatedReporter     |               []               |
|        Market.openReporter        |               []               |
|        Market.validityBond        |               []               |
|        Market.creationBond        |               []               |
|     Market.creationBondPaidOut    |               []               |
|           Market.shares           |               []               |
|       Market.disagreeCounter      |               []               |
|        Market.agreeCounter        |               []               |
|          Market.disputes          |               []               |
|       Market.reportedOutcome      |               []               |
|        Market.createdBonds        |               []               |
|         Market.reporterSet        |               []               |
|        Market.tradingActive       |               []               |
|   Market.designatedReportAllowed  | ['designatedReporterReported'] |
|      Market.openReportAllowed     | ['designatedReporterReported'] |
|       Market.disputesAllowed      |               []               |
|    Market.settlementPhaseActive   |               []               |
| Market.designatedReporterReported |               []               |
+-----------------------------------+--------------------------------+
Function closeDisputingWindow()
+-----------------------------------+-------------------------------------+
|              Variable             |             Influencers             |
+-----------------------------------+-------------------------------------+
|           Market.accCtrl          |                  []                 |
|     Market.designatedReporter     |                  []                 |
|        Market.openReporter        |                  []                 |
|        Market.validityBond        |                  []                 |
|        Market.creationBond        |                  []                 |
|     Market.creationBondPaidOut    |                  []                 |
|           Market.shares           |                  []                 |
|       Market.disagreeCounter      |                  []                 |
|        Market.agreeCounter        |                  []                 |
|          Market.disputes          |                  []                 |
|       Market.reportedOutcome      | ['disagreeCounter', 'agreeCounter'] |
|        Market.createdBonds        |                  []                 |
|         Market.reporterSet        |                  []                 |
|        Market.tradingActive       |                  []                 |
|   Market.designatedReportAllowed  |                  []                 |
|      Market.openReportAllowed     |                  []                 |
|       Market.disputesAllowed      |                  []                 |
|    Market.settlementPhaseActive   | ['disagreeCounter', 'agreeCounter'] |
| Market.designatedReporterReported |                  []                 |
+-----------------------------------+-------------------------------------+
Function sentCreationBond()
+-----------------------------------+---------------------------------------------------------------------------------------------------------------+
|              Variable             |                                                  Influencers                                                  |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------+
|           Market.accCtrl          |                                                       []                                                      |
|     Market.designatedReporter     |                                                       []                                                      |
|        Market.openReporter        |                                                       []                                                      |
|        Market.validityBond        |                                                       []                                                      |
|        Market.creationBond        |                                                       []                                                      |
|     Market.creationBondPaidOut    | ['openReporter', 'creationBond', 'settlementPhaseActive', 'designatedReporter', 'designatedReporterReported'] |
|           Market.shares           |                                                       []                                                      |
|       Market.disagreeCounter      |                                                       []                                                      |
|        Market.agreeCounter        |                                                       []                                                      |
|          Market.disputes          |                                                       []                                                      |
|       Market.reportedOutcome      |                                                       []                                                      |
|        Market.createdBonds        |                                                       []                                                      |
|         Market.reporterSet        |                                                       []                                                      |
|        Market.tradingActive       |                                                       []                                                      |
|   Market.designatedReportAllowed  |                                                       []                                                      |
|      Market.openReportAllowed     |                                                       []                                                      |
|       Market.disputesAllowed      |                                                       []                                                      |
|    Market.settlementPhaseActive   |                                                       []                                                      |
| Market.designatedReporterReported |                                                       []                                                      |
+-----------------------------------+---------------------------------------------------------------------------------------------------------------+
Function slitherConstructorVariables()
+-----------------------------------+-------------+
|              Variable             | Influencers |
+-----------------------------------+-------------+
|           Market.accCtrl          |      []     |
|     Market.designatedReporter     |      []     |
|        Market.openReporter        |      []     |
|        Market.validityBond        |      []     |
|        Market.creationBond        |      []     |
|     Market.creationBondPaidOut    |      []     |
|           Market.shares           |      []     |
|       Market.disagreeCounter      |      []     |
|        Market.agreeCounter        |      []     |
|          Market.disputes          |      []     |
|       Market.reportedOutcome      |      []     |
|        Market.createdBonds        |      []     |
|         Market.reporterSet        |      []     |
|        Market.tradingActive       |      []     |
|   Market.designatedReportAllowed  |      []     |
|      Market.openReportAllowed     |      []     |
|       Market.disputesAllowed      |      []     |
|    Market.settlementPhaseActive   |      []     |
| Market.designatedReporterReported |      []     |
+-----------------------------------+-------------+
Function onlyMarketCreator()
+-----------------------------------+-------------+
|              Variable             | Influencers |
+-----------------------------------+-------------+
|           Market.accCtrl          |      []     |
|     Market.designatedReporter     |      []     |
|        Market.openReporter        |      []     |
|        Market.validityBond        |      []     |
|        Market.creationBond        |      []     |
|     Market.creationBondPaidOut    |      []     |
|           Market.shares           |      []     |
|       Market.disagreeCounter      |      []     |
|        Market.agreeCounter        |      []     |
|          Market.disputes          |      []     |
|       Market.reportedOutcome      |      []     |
|        Market.createdBonds        |      []     |
|         Market.reporterSet        |      []     |
|        Market.tradingActive       |      []     |
|   Market.designatedReportAllowed  |      []     |
|      Market.openReportAllowed     |      []     |
|       Market.disputesAllowed      |      []     |
|    Market.settlementPhaseActive   |      []     |
| Market.designatedReporterReported |      []     |
+-----------------------------------+-------------+
Function onlyShareholder()
+-----------------------------------+-------------+
|              Variable             | Influencers |
+-----------------------------------+-------------+
|           Market.accCtrl          |      []     |
|     Market.designatedReporter     |      []     |
|        Market.openReporter        |      []     |
|        Market.validityBond        |      []     |
|        Market.creationBond        |      []     |
|     Market.creationBondPaidOut    |      []     |
|           Market.shares           |      []     |
|       Market.disagreeCounter      |      []     |
|        Market.agreeCounter        |      []     |
|          Market.disputes          |      []     |
|       Market.reportedOutcome      |      []     |
|        Market.createdBonds        |      []     |
|         Market.reporterSet        |      []     |
|        Market.tradingActive       |      []     |
|   Market.designatedReportAllowed  |      []     |
|      Market.openReportAllowed     |      []     |
|       Market.disputesAllowed      |      []     |
|    Market.settlementPhaseActive   |      []     |
| Market.designatedReporterReported |      []     |
+-----------------------------------+-------------+
Function onlyDesignatedReporter()
+-----------------------------------+-------------+
|              Variable             | Influencers |
+-----------------------------------+-------------+
|           Market.accCtrl          |      []     |
|     Market.designatedReporter     |      []     |
|        Market.openReporter        |      []     |
|        Market.validityBond        |      []     |
|        Market.creationBond        |      []     |
|     Market.creationBondPaidOut    |      []     |
|           Market.shares           |      []     |
|       Market.disagreeCounter      |      []     |
|        Market.agreeCounter        |      []     |
|          Market.disputes          |      []     |
|       Market.reportedOutcome      |      []     |
|        Market.createdBonds        |      []     |
|         Market.reporterSet        |      []     |
|        Market.tradingActive       |      []     |
|   Market.designatedReportAllowed  |      []     |
|      Market.openReportAllowed     |      []     |
|       Market.disputesAllowed      |      []     |
|    Market.settlementPhaseActive   |      []     |
| Market.designatedReporterReported |      []     |
+-----------------------------------+-------------+
Function onlyOpenReporter()
+-----------------------------------+-------------+
|              Variable             | Influencers |
+-----------------------------------+-------------+
|           Market.accCtrl          |      []     |
|     Market.designatedReporter     |      []     |
|        Market.openReporter        |      []     |
|        Market.validityBond        |      []     |
|        Market.creationBond        |      []     |
|     Market.creationBondPaidOut    |      []     |
|           Market.shares           |      []     |
|       Market.disagreeCounter      |      []     |
|        Market.agreeCounter        |      []     |
|          Market.disputes          |      []     |
|       Market.reportedOutcome      |      []     |
|        Market.createdBonds        |      []     |
|         Market.reporterSet        |      []     |
|        Market.tradingActive       |      []     |
|   Market.designatedReportAllowed  |      []     |
|      Market.openReportAllowed     |      []     |
|       Market.disputesAllowed      |      []     |
|    Market.settlementPhaseActive   |      []     |
| Market.designatedReporterReported |      []     |
+-----------------------------------+-------------+
Function onlyOpenReporterDesignatedReporter()
+-----------------------------------+-------------+
|              Variable             | Influencers |
+-----------------------------------+-------------+
|           Market.accCtrl          |      []     |
|     Market.designatedReporter     |      []     |
|        Market.openReporter        |      []     |
|        Market.validityBond        |      []     |
|        Market.creationBond        |      []     |
|     Market.creationBondPaidOut    |      []     |
|           Market.shares           |      []     |
|       Market.disagreeCounter      |      []     |
|        Market.agreeCounter        |      []     |
|          Market.disputes          |      []     |
|       Market.reportedOutcome      |      []     |
|        Market.createdBonds        |      []     |
|         Market.reporterSet        |      []     |
|        Market.tradingActive       |      []     |
|   Market.designatedReportAllowed  |      []     |
|      Market.openReportAllowed     |      []     |
|       Market.disputesAllowed      |      []     |
|    Market.settlementPhaseActive   |      []     |
| Market.designatedReporterReported |      []     |
+-----------------------------------+-------------+
Function onlyManager()
+-----------------------------------+-------------+
|              Variable             | Influencers |
+-----------------------------------+-------------+
|           Market.accCtrl          |      []     |
|     Market.designatedReporter     |      []     |
|        Market.openReporter        |      []     |
|        Market.validityBond        |      []     |
|        Market.creationBond        |      []     |
|     Market.creationBondPaidOut    |      []     |
|           Market.shares           |      []     |
|       Market.disagreeCounter      |      []     |
|        Market.agreeCounter        |      []     |
|          Market.disputes          |      []     |
|       Market.reportedOutcome      |      []     |
|        Market.createdBonds        |      []     |
|         Market.reporterSet        |      []     |
|        Market.tradingActive       |      []     |
|   Market.designatedReportAllowed  |      []     |
|      Market.openReportAllowed     |      []     |
|       Market.disputesAllowed      |      []     |
|    Market.settlementPhaseActive   |      []     |
| Market.designatedReporterReported |      []     |
+-----------------------------------+-------------+


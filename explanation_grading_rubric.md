# Topics

## User Interface Requirements
  ### Run app on a dev server locally for testing/grading (connecting to Rinkeby if required)
  
  Application is made with Truffle. The structure of library in GitHub reflect the structure of Truffle. 
  It was programmed with Visual Code on Ubuntu 16.04. On my test environment, it answers to COMPILE, MIGRATE and TEST commands. 
  It is mandatory launch ganache-cli before to lauch Truffle command
  
  Used Software: ubuntu 16.04 node 10.4.1 truffle 4.1.11 (core 4.1.11) solidity v0.4.24 (solc.js) ganache-cli v6.1.6 (ganache-core 2.1.5)
  
  ### Should be able to visit a URL and interact with the app (can be localhost)
  
  I'M NOT A jAVASCRIPT PROGRAMMER. I LEARNT  JAVASACRIPT TO MAKE THIS COURSE: SO MY UI, INTERACTION AND INTERFACE ARE AT AMATORIAL LEVEL...
  
  This is the Cloud9 URL to see the application: 
  
  http://18.223.68.224:8080/home
  
 
  The first page take some seconds (between 8 and 10) to load becuase have to load  all the numbers status,  making 100 calls
  The are implemented also the buyNumber function and the combine number function (remember that the two numbers of the combineNumbers function have to be owned by the sender of the function)
  There is a link to betStatus screen  (not to be deployed in a production environment) that show and allow to change the default account (and privatekey!!!!!!!), and the address of the two contracts on Rinkeby

  ### The applications should have the following features
  
  #### Display the current account
 Yes under betStatus
  #### Using Metamask
 
 Due to the pure Node implementation of the main application, it was not possible including the MeatMaks signing.
    So I made another page in HTML/Javascript to show the integration with metamask of one transaction: buyNumber
    the URL is
    
  http://18.223.68.224:8080/web3api 
 
  (can be reached also from the /home page under the menu item "Metamask")
    
  again please tell me if it doesnt work. 
    
  #### Reflect updates to to the contract state
   yes, if you buy a number or combine two numbers, and go home again (some seconds to wait), you will see that a new number is bought
  
     

## Testing
  ### 5 tests (Javascript or Solidity or both) with explanations for each smart contract written (where appropriate)
  5 test are written with more assert for almost every test. Description of tests in README.md
  
  ### Tests are properly structured (ie sets up context, executes a call on  the function to be tested, and verifies the result is correct)
  They are structured (I hope)
  
  ### Tests provide adequate coverage for the contracts
  The main functions (createBet, buyNumber, combineNumber and endBet) are included
  
  ### All tests pass
  In my dev machine yes

## Design Pattern Requirements
  ### Implement a circuit breaker / emergency stop
  A pause (and unpause) function only executable by the owner is implemented with the test modifer in the other functions
  
  ### What other design patterns have you used or  not used?
  I included a description of the decisions about what pattern are used. In the description of security choice, there is also a description about why the pseudo random functions are made in this way
  https://github.com/rickzanussi/cryptobet/blob/master/design_pattern_decisions.md

## Security Tools / Common Attacks
  ### Explain what measures they’ve taken to ensure that their contracts are not susceptible to common attacks
  There is a file explaining what decison were made against common attacks
  https://github.com/rickzanussi/cryptobet/blob/master/avoiding_common_attacks.md
  

## Library / EthPM
  ### At least one of the project contracts includes an import from a library/contract or an ethPM package
  I used the safe math library from OpenZeppelin

## Additional Requirements
 ### Smart Contract code should be commented  according to the specs in the documentation https://solidity.readthedocs.io/en/v0.4.21/layout-of-source-files.html#comments
 I followed the specifications and comment the code. Almost all the instructions are commented

## Stretch Goals for bonus points
  ### Project uses IPFS
  In the webpage I started to use IPFS to log all the page (and more the called functions, with account. Actually is only on the 'betStatus' page to test but ready to be deployed in the other pages. All the data are stored in a path with the address of the GenericContract as main directory and the hash of the context + .txt as file
  ### Project uses uPort
  NO
  ### Project uses the Ethereum Name Service
  NO
  ### Project uses an Oracle
  NO
  ### Project implements an Upgradable Pattern Registry or Delegation
  NO
  ### Project includes one of their smart contracts implemented in LLL / Vyper
  NO
  ### Testnet Deployment:  The addresses provided in deployed_addresses.txt correctly point to deployed  contracts on the rinkeby testnet
  I deployed the contract in Rinkeby. the address are online and in the required file

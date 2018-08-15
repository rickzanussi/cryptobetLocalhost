pragma solidity ^0.4.23;

import '../node_modules/openzeppelin-solidity/contracts/math/SafeMath.sol';



contract GenericBet {
    using SafeMath for uint;
    struct betNumber {
        address betNumberOwner;
        uint    betNumberIndexFreeNumbers;
    }
    mapping  (uint => betNumber) public betNumbers;
    uint  public  numberOfNumbers;
    uint  public numberOfPossibleWinners;
    uint  public  sumNumbers; // sum of all the numbers 
    address public thisAddress;
    
    address public owner;
    bool public ended;
    bool public  paused;
    
   // address[] public   numberOwners; 
    uint[] public  freeNumbers;
    uint public freeNumbersLength;
    uint public prizeNumbers;
    uint public numbersSum;
    uint public prizeNumberLow;
    uint public prizeNumberHigh;
    address public feeAccount;
    uint public newNumberPrice;    
    uint public feePercentage;
    uint public betPrize;
    uint public  boughtNumber;
    uint public indexBoughtNumber;
    
    uint public winnerNumber;
    uint public prize;
    modifier ownerOnly {
        require(msg.sender == owner);
        _;
    }
   
    uint public resultNumber;


    event numberIsBought(uint, address);
    event numberIsCombined(uint, address);
    event numberIsNotCombined(uint, address);
    event betIsFinished(uint, address, address, uint);
    event pausedSet(address);
    event restarted(address);


     modifier notEnded {
        require(ended == false);
        _;
    }


     modifier notPaused {
        require(paused == false);
        _;
    }


    modifier numberOwner (uint number) {
        require(number > 0);
        require(number <= sumNumbers);
        require(betNumbers[number].betNumberOwner == msg.sender);
        _;
    }
     modifier enoughFee () {
        require(msg.value > newNumberPrice);
        _;
    }
     


    // Constructor,set all the necesary variables
    constructor(address _feeAccount,  uint _feePercentage, 
        uint _newNumberPrice, uint _numberOfNumbers, uint _numberOfPossibleWinners, uint  _sumNumbers, address _owner) public {
    
        owner = _owner;
        feeAccount = _feeAccount;
      
        
       
        // The range ofpossible winner numbers smaller than the full numbers, make economical convenient combine numbers outside
        // the winner range to have a number inside the winner range. That make possible more sophisticated strategy and bets and timed trasactions
       
        feePercentage = _feePercentage;
        newNumberPrice = _newNumberPrice;
        numberOfNumbers = _numberOfNumbers;
        numberOfPossibleWinners = _numberOfPossibleWinners;
        sumNumbers = _sumNumbers;
        numbersSum = sumNumbers;
        
        prizeNumberLow =  randomAddress(address(this), numberOfNumbers - numberOfPossibleWinners);
        prizeNumberHigh = SafeMath.add(prizeNumberLow , numberOfPossibleWinners) - 1;
        freeNumbersLength = numberOfNumbers;
        prizeNumbers = numberOfPossibleWinners;
        thisAddress = this;
        ended = false;
        paused = false;
       
        // the only loop in the contract
        for(uint i=0;i<numberOfNumbers;i++)
        {
            freeNumbers.push(i+1);
            // numberOwners.push(0x0);
            betNumbers[i+1] = betNumber(0x0,i);
        }
       


    }
    // the bought numbers are assigned randomly
    function buyNumber() public payable  notEnded notPaused enoughFee returns (uint) {
      
    
      
        //sum all the bought values to have a seed
        // if numbersSum = original sum of all the numbers  is the first time
        if(numbersSum == sumNumbers) {
              // the random for the first time use the address of the contract. Due to the fact that every bet is a new contract, make 
              // this choice some randomly
              boughtNumber = randomAddress(thisAddress, numberOfNumbers);
              indexBoughtNumber = boughtNumber -1;
        } else{
              // the number assigne after the first one, are using the sum of the remaining number and contract address as sed of the random)
         indexBoughtNumber = randomUint(thisAddress, numbersSum, freeNumbersLength - 1);
        boughtNumber = freeNumbers[indexBoughtNumber];
         }
          
        betPrize += newNumberPrice;
        // given back the money if the sender send more money than the cost of a new number
        msg.sender.transfer(SafeMath.sub(msg.value, newNumberPrice));
       
        
        // remove the number just bought for the remaining free numbers
        remove(indexBoughtNumber);
        // subtract from the sum of the remaining numbers
        numbersSum -= boughtNumber;
        // assign the number to the send address
        // numberOwners[boughtNumber - 1] = msg.sender;
        
        betNumbers[boughtNumber] = betNumber(msg.sender,999); /////////////////////////////////////////////////
        
        // check if the bought number is in the range of winner numbers
        if(boughtNumber >= prizeNumberLow && boughtNumber <= prizeNumberHigh){
            prizeNumbers -= 1;
        }
        emit numberIsBought(boughtNumber, msg.sender);
        // end bet when the number in the magic interval are all bought
        if(freeNumbersLength == 0 || prizeNumbers ==0) {
            endBet();
        }
            
        return(boughtNumber);
  
    }


    // a player can combine two numbers in another number (average) to try to have a number in the winner range
    // if the resulting number is free is assigned to the sender. But the two number used, are freed
    function combineNumbers(uint number1, uint number2) public notEnded notPaused 
                    numberOwner(number1) numberOwner(number2) returns(uint newNumber){
        sumNumbers = number1 + number2;
        if(sumNumbers%2 == 1){
            sumNumbers -= 1;
        }
        resultNumber = sumNumbers / 2;


        if(betNumbers[resultNumber].betNumberOwner == 0x0){
            //numberOwners[number1] = 0x0;
            //numberOwners[number2] = 0x0;
            
            // numberOwners[resultNumber - 1] = msg.sender;
            
            remove(betNumbers[resultNumber].betNumberIndexFreeNumbers);
            betNumbers[resultNumber] = betNumber(msg.sender,999);
            freeNumbers[freeNumbersLength] = number1;
            betNumbers[number1] = betNumber(0x0, freeNumbersLength);
            freeNumbers[freeNumbersLength + 1] = number2;
            betNumbers[number2] = betNumber(0x0, freeNumbersLength + 1);
            freeNumbersLength += 2;
             if(resultNumber >= prizeNumberLow && resultNumber <= prizeNumberHigh){
            prizeNumbers -= 1;
        }
            emit numberIsCombined(resultNumber, msg.sender);
        
        // end bet when the number in the magic interval are all bought
        if(freeNumbersLength == 0 || prizeNumbers ==0) {
            endBet();
            return resultNumber;
        }
        } else{
             emit numberIsNotCombined(resultNumber, msg.sender);
            return 0;
        } 
    }



        function endBet() private notEnded notPaused {
            // set the flag to ended and pause (for security)
            ended = true;
            paused = true;
           
            // find the winner number ramdomized with contract address and address of the owner of the last bought number
            // find the number in the range of possobile winners
            // winnerNumber = randomUintAA(thisAddress, numberOwners[boughtNumber - 1], numberOfPossibleWinners);
            winnerNumber += uint(prizeNumberLow);
            
            // tranfer money to the winner except for the fee
            prize = thisAddress.balance;
           
            feeAccount.transfer(prize * feePercentage /100);
           // numberOwners[winnerNumber - 1].transfer(prize * (100 - feePercentage)  /100);
            betNumber storage  betNumberWinner = betNumbers[winnerNumber];
            betNumberWinner.betNumberOwner.transfer(prize * (100 - feePercentage)  /100);
            
            emit betIsFinished(winnerNumber, thisAddress, betNumbers[winnerNumber].betNumberOwner, prize);
             // TODO empty contract balance
            return;


        }
        // remove a number for the array of free numbers
    function remove(uint index) private   {
        require(index <= freeNumbersLength);
        freeNumbers[index] = freeNumbers[freeNumbersLength - 1];
        betNumbers[freeNumbers[freeNumbersLength - 1]] = betNumber(0x0,index);  ///////////
        delete freeNumbers[freeNumbersLength - 1];
        freeNumbersLength -= 1;
        return;
    }
    
    function pauseOn() public  ownerOnly {
        paused = true;
        emit pausedSet(thisAddress);
    }
      function pauseOff() public  ownerOnly {
        paused = false;
        emit restarted(thisAddress);
    }


   
    // random function with an address and one number)
    function randomUint(address seed1, uint seed2, uint modulo) private pure returns (uint) {
      return uint(uint256(keccak256(abi.encodePacked(seed1, seed2)))%modulo);   }


    // random function with two address
    function randomUintAA(address  seed, address seed1, uint modulo) private pure returns (uint) {
      return uint(uint256(keccak256(abi.encodePacked(seed,seed1)))%modulo);   }


      //function duplicated not to make it public
    function randomAddress(address seed, uint modulo) private pure returns (uint) {
      return uint(uint256(keccak256(abi.encodePacked(seed)))%modulo);   }


      
    //fallback function
    function () payable public {}
}   


//contract MainBet {
contract MainBet  {
    using SafeMath for uint;
    address public feeAccount; 
    uint public feePercentage;
    uint public newNumberPrice;
    uint public  numberOfNumbers;
    uint public numberOfPossibleWinners;
    uint public sumNumbers; // sum of the numbers from 1 to 100
    string betName;
   


/* addrees of the contract of the actual bet. only one bet at time is allowed */
    address public actualBetContractAddress;
    GenericBet actualBetContract;
    address public owner ;
 modifier ownerOnly {
        require(msg.sender == owner);
        _;
    }
    // event bet created ok
    event betCreated(address actualBetContractAddress);


    // Constructor    
    constructor(address _feeAccount,  uint _feePercentage, 
        uint _newNumberPrice, string _betName, uint _numberOfNumbers, uint _numberOfPossibleWinners, uint _sumNumbers ) public {
        /* Set the bets variable of this generation of cruptobet */
        require(_feePercentage > 0 && _feePercentage < 100);
        require(_newNumberPrice > 0);
        require(_feeAccount != 0x0);
        require(_sumNumbers > 0);
        require(_numberOfNumbers > _numberOfPossibleWinners);
        require(_numberOfNumbers < 101);
        owner = msg.sender;
        feeAccount = _feeAccount;
        feePercentage = _feePercentage;
        newNumberPrice = _newNumberPrice;
        betName = _betName;
        numberOfNumbers = _numberOfNumbers;
        numberOfPossibleWinners = _numberOfPossibleWinners;
        sumNumbers = _sumNumbers; // sum of the numbers from 1 to 100. Is given as parameters not to coume too much gas
        
    }


    function createBet() public ownerOnly returns(address) {
        /*  test if address is zero for the first time */
        if( (address(actualBetContract) != 0x0 && actualBetContract.ended() ) || address(actualBetContract) == 0x0){
               // starting value of the range of winner numbers
            actualBetContract = new GenericBet( feeAccount,feePercentage,newNumberPrice,numberOfNumbers,numberOfPossibleWinners, sumNumbers, owner);
            actualBetContractAddress = address(actualBetContract);
            emit betCreated(actualBetContractAddress);
            return actualBetContractAddress;
        }
        return;
    }


  function randomAddress(address seed, uint modulo) private pure returns (uint) {
      return uint(uint256(keccak256(abi.encodePacked(seed)))%modulo);   }


    }
var MainBet = artifacts.require("./MainBet.sol");

contract('MainBet', function(accounts) {

  const owner = accounts[0]
  const feeAccount = accounts[1];
  const player = accounts[2];
  var GenContract2;
  
  var bought2;

  it("should create the main bet", async () => {
    const mainbet = await MainBet.deployed();

    
    const generatedBetAddress  = await mainbet.createBet({from: owner,gas: 4000000});
    assert.notEqual(generatedBetAddress, 0x0,'Specific Bet contract not generated, check createBet of the MainBet contract' );
    
    
    const betCreated = await mainbet.allEvents();
    const log = await new Promise(function(resolve, reject) {
    betCreated.watch(function(error, log){ resolve(log);});});
    const AbetContractAddress = log.args.actualBetContractAddress;

    assert.notEqual(AbetContractAddress, 0x0,'Specific Bet contract not generated, check createBet of the MainBet contract' );
    
    
    var fs = require("fs");
    var abi = fs.readFileSync('../cryptobet/build/contracts/GenericBet.json', 'utf8');
    var abiJson = JSON.parse(abi);
    var abiJsonAbi = abiJson.abi;
    const deposit = web3.toBigNumber(5);

    var version = web3.version.api;
    console.log(version);
    
    var MyContract = web3.eth.contract(abiJsonAbi);
    var contractInstance = MyContract.at(AbetContractAddress);
    GenContract2 = contractInstance;
    

  });
  it("should be the sumNumbers equal to sum of the numbers possible to buy", async () => {
    const dummyGen = await GenContract2.sumNumbers({from: owner});
    console.log(dummyGen, Number(dummyGen));
    assert.equal(Number(dummyGen), 210, 'sumNumbers is  incorrect, check constructor function');
  });

  it("should be equal the numbersSUm after + boughtNumber to numbersSUm before", async () => {
    const  numbersSumBefore = await GenContract2.numbersSum({from: owner});
    var resultTrans = await GenContract2.buyNumber({from: owner, value: 5, gas: 4000000});
    const numbersSumAfter = await GenContract2.numbersSum({from: owner});
    const boughtNumber = await GenContract2.boughtNumber({from: owner});
    
    console.log(numbersSumBefore, numbersSumAfter,boughtNumber)
    assert.equal(Number(numbersSumBefore) - Number(boughtNumber), Number(numbersSumAfter), 'numbersSUm is  incorrect, check  buyNumber function');
  });
  it("should be the computation of the combined number ok", async () => {
    var resultTrans0 = await GenContract2.buyNumber({from: owner, value: 5, gas: 4000000});
    const boughtNumber0 = await GenContract2.boughtNumber({from: owner});
    var resultTrans1 = await GenContract2.buyNumber({from: owner, value: 5, gas: 4000000});
    const boughtNumber = await GenContract2.boughtNumber({from: owner});
    var resultTrans2 = await GenContract2.combineNumbers(boughtNumber0, boughtNumber,{from: owner,  gas: 4000000});
    const resultNumber = await GenContract2.resultNumber({from: owner});
    var combinedNumber = await GenContract2.betNumbers(resultNumber,{from: owner});
    var sumNumbers = Number(boughtNumber) + Number(boughtNumber0);
    
        if(sumNumbers % 2 == 1){
            sumNumbers -= 1;
        }
    const averageNumber = sumNumbers / 2;
    
    
    assert.equal(averageNumber, resultNumber,'average of combined number wrong');
    assert.equal(combinedNumber[1], 999, 'numbercombined was not free by combineNumers function');
  });
  it("should be the winner number  in the right interval ", async () => {
    var betEnded = false;
    for(var i =0; betEnded == false;i++){
      var resultEnd =await GenContract2.buyNumber({from: owner, value: 5,gas: 4000000});
      betEnded = await GenContract2.ended({from: owner});
    }
    const winnerNumber = await GenContract2.winnerNumber({from: owner});
    const winnerNumberLow = await GenContract2.prizeNumberLow({from: owner});
    const winnerNumberHigh = await GenContract2.prizeNumberHigh({from: owner});
    console.log(winnerNumber, winnerNumberHigh,winnerNumberLow);
    assert.operator(Number(winnerNumberHigh) + 1, '>', Number(winnerNumber), 'winner number not less or equal bigger number of range winner ');
    assert.operator(Number(winnerNumberLow) - 1, '<', Number(winnerNumber), 'winner number not greater or equal less number of range winner ');
  });
/*


    

  */

});

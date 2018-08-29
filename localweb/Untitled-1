


// Require Web3 Module
var Web3 = require('web3');
const express = require('express');
var async = require('async');
//const Tx = require('ethereumjs-tx');
var bodyParser = require('body-parser');
var fs = require('fs');


var ipfsAPI = require('ipfs-api');

const ipfs = ipfsAPI('ipfs.infura.io', '5001', {protocol: 'https'});

var Buffer2 = require('buffer/').Buffer;

var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = "pencil opinion retreat corn off bunker hill erosion retire engine latin begin"; // 12 word mnemonic
var providerHDW = new HDWalletProvider(mnemonic, 'https://rinkeby.infura.io/v3/16035fa5a7244ef5be298ac8c72379ae');
var Web3HDW = require('web3');
var web3HDW = new Web3HDW();
web3HDW.setProvider(providerHDW);



console.log(process.version);  
const app = express();
// middleware for bodyParser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
var resultNumberOfNumbers = 0 ;
var resultBetNumber = 0;
var resultFreeNumber = 0;
var resultFA = 0;
var resultNumbersSum = 0;
var resultFeePercentage = 0;
var resultBetPrize = 0;
var resultNewNumberFee = 0;
var resultBoughtNumber = 0;
var ii;
var pageMessage = '';
  var  numbersArray = new Array();
 var resultGeneral;
 var stylecss = '<style> body {   margin: 0;   font-family: Arial, Helvetica, sans-serif; }  .topnav {   overflow: hidden;   background-color: #333; }  .topnav a {   float: left;   color: #f2f2f2;   text-align: center;   padding: 14px 16px;   text-decoration: none;   font-size: 17px; }  .topnav a:hover {   background-color: #ddd;   color: black; }  .topnav a.active {   background-color: #4CAF50;   color: white; } </style>';
 
 var topPage = '<div class="topnav"><a class="active" href="home">Home</a><a href="buy">Buy Number</a><a href="combine">Combine</a><a href=betStatus>Bet Status</a><a href="web3api">MetaMask</a></div><br />';
 
//  var topPageManager = '<div class="topnav"><a class="active" >CryptoBet</a><a href="manager">Manager</a><a href="player">Player</a><a href="about">About</a></div>';
 
 var pageBottom = '<form><input type="button" value="Next Link" onclick="window.location.href=';
 pageBottom += "'ppp'";
 pageBottom += '" /></form>';
 
 var inputNumbers = '<form action="" method="POST">    <div class="input-group">       <input type="text" class="form-control" name="num1" placeholder="Enter the first number to combine" > 	  <input type="text" class="form-control" name="num2" placeholder="Enter the second number to combine" >       <div class="input-group-append">            <button class="w3-button w3-black" id="numCombine" type="submit">Combine</button>     </div>  </div> </form>';
 

 var pageLink = ' <a href="ppp">Google</a>';
   
// Show web3 where it needs to look for the Ethereum node
web3 = new Web3(new Web3.providers.HttpProvider('https://rinkeby.infura.io/v3/16035fa5a7244ef5be298ac8c72379ae'));

// Write to the console the script will run shortly
//console.log('Contract-ing Ebola.....');

var key =  'a634fd77ebb7642d7860d8ebc3e9360d21265f1b01ef3800385a021ae32b2d61';
var account = '0x950346D74c6CFa5bBDEaf092022d187a9E6c22d2';

// Define the ABI of the contract, used to return the desired values
var abi = [{"constant":true,"inputs":[],"name":"sumNumbers","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"newNumberPrice","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"feeAccount","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"numberOfPossibleWinners","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"feePercentage","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"actualBetContractAddress","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"numberOfNumbers","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"createBet","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"_feeAccount","type":"address"},{"name":"_feePercentage","type":"uint256"},{"name":"_newNumberPrice","type":"uint256"},{"name":"_betName","type":"string"},{"name":"_numberOfNumbers","type":"uint256"},{"name":"_numberOfPossibleWinners","type":"uint256"},{"name":"_sumNumbers","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"actualBetContractAddress","type":"address"}],"name":"betCreated","type":"event"}];
var GenBetabi = [{"constant":true,"inputs":[],"name":"ended","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"prizeNumberHigh","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"freeNumbers","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"sumNumbers","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"winnerNumber","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"newNumberPrice","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"paused","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"feeAccount","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"pauseOn","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"prizeNumberLow","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"boughtNumber","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"resultNumber","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"freeNumbersLength","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"numberOfPossibleWinners","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"buyNumber","outputs":[{"name":"","type":"uint256"}],"payable":true,"stateMutability":"payable","type":"function"},{"constant":true,"inputs":[],"name":"prizeNumbers","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"betNumbers","outputs":[{"name":"betNumberOwner","type":"address"},{"name":"betNumberIndexFreeNumbers","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"number1","type":"uint256"},{"name":"number2","type":"uint256"}],"name":"combineNumbers","outputs":[{"name":"newNumber","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"feePercentage","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"betPrize","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"pauseOff","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"thisAddress","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"numberOfNumbers","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"numbersSum","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"prize","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"indexBoughtNumber","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"_feeAccount","type":"address"},{"name":"_feePercentage","type":"uint256"},{"name":"_newNumberPrice","type":"uint256"},{"name":"_numberOfNumbers","type":"uint256"},{"name":"_numberOfPossibleWinners","type":"uint256"},{"name":"_sumNumbers","type":"uint256"},{"name":"_owner","type":"address"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"payable":true,"stateMutability":"payable","type":"fallback"},{"anonymous":false,"inputs":[{"indexed":false,"name":"","type":"uint256"},{"indexed":false,"name":"","type":"address"}],"name":"numberIsBought","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"","type":"uint256"},{"indexed":false,"name":"","type":"address"}],"name":"numberIsCombined","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"","type":"uint256"},{"indexed":false,"name":"","type":"address"}],"name":"numberIsNotCombined","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"","type":"uint256"},{"indexed":false,"name":"","type":"address"},{"indexed":false,"name":"","type":"address"},{"indexed":false,"name":"","type":"uint256"}],"name":"betIsFinished","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"","type":"address"}],"name":"pausedSet","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"","type":"address"}],"name":"restarted","type":"event"}];
// The Ethereum address of the smart contract
var addr = "0x2a33ce1f9a3bcbb5d694bc81cd64eb4e7942a3b9";
var GenBetAddr = '0x8D9Dc9597C46D3C38cc3A84D50E4a3585F5F788C';
// Build a new variable based on the web3 API including the ABI and address of the contract
var MainBetContract = new web3.eth.Contract(abi, addr);
var GenBetContract = new web3.eth.Contract(GenBetabi, GenBetAddr);
 var GenBetContractHDW = new web3HDW.eth.Contract(GenBetabi, GenBetAddr);

// Put it all together in a call and return the result to the console
// FUNCTION can be "getEbola", "getInfo", "tipCreator" and "kill"




function sortFunction(a, b) {
    if (a[1] === b[1]) {
        return 0;
    }
    else {
        return (a[1] < b[1]) ? -1 : 1;
    }
}


var getNumberOfNumbers = function() {
     return new Promise(resolve =>{
    GenBetContract.methods.numberOfNumbers().call(function(err, result) {
    if(err) {
        console.log('err ' + err);
    } else {
        // console.log('ok  numberOfNumbers ' + result);
          
        resultNumberOfNumbers = result;
        resolve();
    }
    });
    })
    };
var getFeePercentage = function() {
     return new Promise(resolve =>{
    GenBetContract.methods.feePercentage().call(function(err, result) {
    if(err) {
        console.log('err ' + err);
    } else {
        // console.log('ok  numberOfNumbers ' + result);
        resultFeePercentage = result;
          resolve();
       
    }
    });
    })
    };

var getNewNumberPrice =  function(){
    return new Promise(resolve =>{
 GenBetContract.methods.newNumberPrice().call(function(err, result) {
    if(err) {
        console.log('err ' + err);
    } else {
        // console.log('ok  newNumberPrice ' + result);
        resultNewNumberFee = result;
        resolve();
        
    }
    });
    })
    };

var getBetPrize =  function(){
     return new Promise(resolve =>{
 GenBetContract.methods.betPrize().call(function(err, result) {
    if(err) {
        console.log('err ' + err);
    } else {
       //  console.log('--ok  betPrize ' + result);
        resultBetPrize = result;
        resolve()
    }
    });
    })
    };

/*
        GenBetContract.methods.freeNumbers(Number(resultBetNumber[1])).call(function(err, result) {
                if(err) {console.log('err ' + err); } else {
                let resultFreeNumber = result;
                            //console.log('ok  freeNumber ' + resultFreeNumber);
                 console.log('ok  betNumber ' + ii + ' ' +  resultBetNumber[0] + ' ' + resultBetNumber[1] + ' ' + resultFreeNumber);
                            
                numbersArray.push(new Array(resultBetNumber[0],Number(ii)));
               // console.log('Array length ' + numbersArray.length);
                           
                }
        });
    
   
    };
    */

var prizeNumberLow = 0;
var getPrizeNumberLow = function () {
    return new Promise(resolve =>{
    
        GenBetContract.methods.prizeNumberLow().call(function(err, result) {
                if(err) {console.log('err ' + err); } else {
                 prizeNumberLow = result;
               //  console.log('ok  prizeNumberLow ' + prizeNumberLow);
                  resolve('resolvedPrizeNumberLow');
                }
        });
    
    });
    };
var prizeNumberHigh = 0;
var getPrizeNumberHigh = function () {
    return new Promise(resolve =>{
    
        GenBetContract.methods.prizeNumberHigh().call(function(err, result) {
                if(err) {console.log('err ' + err); } else {
                 prizeNumberHigh = result;
               //  console.log('ok  prizeNumberHigh ' + prizeNumberHigh);
                  resolve('resolvedPrizeNumberHigh');
                }
        });
    
    });
    };




var getNumberStruct = async function(ii){
        await GenBetContract.methods.betNumbers(Number(ii)).call(function(err, result) {
                if(err) { console.log('err ' + err);} else {
                    //console.log('xxx');
                    let resultBetNumber = result;
                   // console.log('ok  betNumber ' + ii + ' ' +  resultBetNumber[0] + ' ' + resultBetNumber[1] + ' ' + resultFreeNumber);
                            
                    numbersArray.push(new Array(resultBetNumber[0],Number(ii)));
                   // console.log('Array length ' + numbersArray.length);
                };
        });
            
    }


var getNumbersStructBig =  async  function () {
    
       // console.log('enter in getNumberStruc. ResultNumberOfNumbers ' + resultNumberOfNumbers);
        numbersArray= [];
        for(var ii=1; ii < (Number(resultNumberOfNumbers) + 1); ii++)
        {
            await GenBetContract.methods.betNumbers(Number(ii)).call(function(err, result) {
                if(err) { console.log('err ' + err);} else {
                     resultBetNumber = result;
                    numbersArray.push(new Array(resultBetNumber[0],Number(ii)));
                     // console.log('ok  betNumber ' + ii + ' ' +  resultBetNumber[0] + ' ' + resultBetNumber[1] + ' ' + resultFreeNumber  + ' al ' + numbersArray.length);
                    
                };
        });
            
        }
   
};
    


var resultNumberSumOut = function () {
    return new Promise(resolve =>{
    var resultNumbersSum
    GenBetContract.methods.numbersSum().call(function(err, result) {
    if(err) {
        console.log('err ' + err);
            } else {
       // console.log('ok  numbersSum ' + result);
        resultNumbersSum = result;
            }
   /// console.log('numbersSum 2 ' + resultNumbersSum);
    });
    });
};


var getBoughtNumber =   function () {
    return new Promise(resolve =>{
    
    GenBetContract.methods.boughtNumber().call(function(err, result) {
    if(err) {
        console.log('err ' + err);
            } else {
       // console.log('ok  numbersSum ' + result);
        resultBoughtNumber = result;
        console.log('bought number ' + result);
        resolve();
            }
   /// console.log('numbersSum 2 ' + resultNumbersSum);
    });
    });
};



    
var displayData =  function () {
    return new Promise(resolve =>{
       // console.log('start dsiplayData0');
       // console.log('Array length outside b ' + numbersArray.length);
      //  console.log('array b ' + numbersArray[1]);
         resolve('resolved');
    });
};


var displayData1 =  function () {
    return new Promise(resolve =>{
       // console.log('start dsiplayData1');
       // console.log('Array length outside b1 ' + numbersArray.length);
       // console.log('array b1 ' + numbersArray[1]);
         resolve('resolved1');
    });
};



var renderData = async function (res) {
    return new Promise(resolve =>{
       // console.log('renderData');
       // console.log('Array length render ' + numbersArray.length);
        numbersArray.sort(sortFunction);
          //console.log('prizeNumberHigh = ' + prizeNumberHigh);
          let result = stylecss;
          //  result += topPageManager;
             result += topPage + pageMessage;
             pageMessage = '';
            result += '<table border="1" cellspacing="0" cellpadding="4">';
            var yellow = "#FFFF00"; // bought by other
            var red = "#FF0000";  // bought by me
            var aqua = "#00FFFF"; // prize number empty
            var blue = "#0000ff"; // prize number bought
            var fucsia = "#FF00FF";
            
            // white = free
            
            for (let el in numbersArray) {
               var trLabel;
               var mod10 = el % 10;
               if(mod10 == 0){trLabel = "</tr><tr>"} else {trLabel = ""};
               
              var backColor = "#FFFFFF";
                if( (numbersArray[el][1] >= prizeNumberLow) &&  (numbersArray[el][1] <= prizeNumberHigh))
                    {if (numbersArray[el][0] == "0x0000000000000000000000000000000000000000") {backColor = aqua} else {backColor = blue};
                    };
                    
              if(numbersArray[el][0] == account) {backColor = red};
              if((numbersArray[el][0] != account) && (numbersArray[el][0] != "0x0000000000000000000000000000000000000000")) {backColor = yellow};
              result += trLabel + "<td bgcolor=" + backColor +">" +  numbersArray[el][1] + "</td>";
              }
            result += '</table>';
            result+= '<br></br>';
            result += '<p>CELL COLOR CODE';
               result+= '<br></br>';
            result += 'White    = Free number';
               result+= '<br></br>';
            result += 'Aqua     = Free number in the winner zone';
               result+= '<br></br>';
            result += 'Red      = Bought by default account';
               result+= '<br></br>';
            result += 'Yellow   = Bought not by default account';
               result+= '<br></br>';
                  result+= '</p>';
            
           
            resultGeneral = result;
            //resultGeneral += pageBottom;
            //resultGeneral += pageLink;
            //console.log('ready to send');
            res.send(resultGeneral);

         resolve('resolvedRender');
    });
};









//////////////////////////////////////////////////

var betStatus = async function(res){
    
    var buffer = stylecss;
   //buffer += topPageManager ;
    buffer += topPage + pageMessage;
    pageMessage = '';
    buffer += '<form action="" id="form-control" method="POST">    ';
    buffer += '<table border="1" cellspacing="0" cellpadding="4">';
     buffer   += '<tr><td>account '+'</td><td><input type="text" class="form-control" name="inputAccount" value="'  + account +'" /> <button class="w3-button w3-black" value"account"  form="form-control" id="changeAccount" name="changeAccount" type="submit">Save account</button> </td></tr>';
     buffer   += '<tr><td>private key '+'</td><td><input type="text" class="form-control" name="inputKey" value="'  + key +'" /><button class="w3-button w3-black" value"key"  form="form-control" id="changeKey" name="changeKey" type="submit">Save key</button> </td></tr>';
    buffer   += '<tr><td>MainBet Contract Address '+'</td><td><input type="text" class="form-control" name="inputMAddress" value="'  + addr +'" /><button class="w3-button w3-black" value"MAddress"  form="form-control" id="changeMAddress" name="changeMAddress" type="submit">Save Main Bet Address</button> </td></tr>';
   // buffer  += 'MainBet Contract ABI  ' +'</td><td>' + abi;
    buffer  += '<tr><td>GenBet  Contract Address '+'</td><td><input type="text" class="form-control" name="inputGAddress" value="'  + GenBetAddr +'" /><button class="w3-button w3-black"  value"GAddress" form="form-control" id="changeGAddress" name="changeGAddress" type="submit">Save Gen Bet Address</button></td></tr>';
  //  buffer  += 'GenBet  Contract ABI  '+'</td><td>' + GenBetabi;
    await getNewNumberPrice();
    buffer  += '<tr><td>new Number Price '+'</td><td>' + resultNewNumberFee +'</td></tr>';
    await getFeePercentage(); 
    buffer  += '<tr><td>fee Percentage ' +'</td><td>'+ resultFeePercentage +'</td></tr>';
    await getNumberOfNumbers();
    buffer  += '<tr><td>Number Of Numbers ' +'</td><td>'+ resultNumberOfNumbers +'</td></tr>';
    await getBetPrize();
    buffer  += '<tr><td>Bet Prize '+'</td><td>' + resultBetPrize + '</td></tr>';
    buffer  += '</table> </form>';
   
   
    res.send(buffer);
}



var buyNumber2 = function() {
        var myAddress = account;
        var privateKey = Buffer.from(key, 'hex')
        var toAddress = account;
    
     
        GenBetContractHDW.methods.buyNumber().send({
        from: account,
        value: web3HDW.utils.toWei('2','ether'),
        data: GenBetContractHDW.methods.buyNumber().encodeABI(),
        gasPrice: web3HDW.utils.toHex(3 * 1e9),
        gasLimit: web3HDW.utils.toHex('3000000'),
        chainId: 4
       })
        .on('error', console.error)
        .then(function(receipt){
             getBoughtNumber();
        });
          
         
        
};


var combineNumbersN = function(num1,num2) {
        console.log('num1' + num1 + '-' + 'num2' + num2);
        GenBetContractHDW.methods.combineNumbers(Number(num1), Number(num2)).send({
        from: account,
       
        data: GenBetContractHDW.methods.combineNumbers(Number(num1), Number(num2)).encodeABI(),
        gasPrice: web3HDW.utils.toHex(3 * 1e9),
        gasLimit: web3HDW.utils.toHex('3000000'),
        chainId: 4
       })
        .on('error', console.error)
        .then(function(receipt){
            //console.log(receipt);
        });
};



var sequentialStart = async function (res) {
    //console.log('start sequentialStart 1 ');
    await GenBetContract.methods.numbersSum().call(function(err, result) {
        if(err) {
         console.log('err ' + err);
        } else {
        //    console.log('ok  numbersSum ' + result);
            resultNumbersSum = result;
        }
       // console.log('numbersSum 2 ' + resultNumbersSum);
    });

   // console.log('start sequentialStart 2 ');
    await GenBetContract.methods.numberOfNumbers().call(function(err, result) {
        if(err) { console.log('err ' + err);} else {
        //console.log('ok  numberOfNumbers ' + result);
        resultNumberOfNumbers = result;
       // console.log('ok  numberOfNumbers before loop ' + resultNumberOfNumbers);
                };
        
    });
    //console.log('start sequentialStart 2a ');
     await getPrizeNumberHigh();
   // console.log('start sequentialStart 2b ');
    await getPrizeNumberLow();
  //   console.log('start sequentialStart 3 ');
    await getNumbersStructBig();
  //   console.log('start sequentialStart 4 ');
    
    await displayData();
  //  console.log('start sequentialStart 5 ');
    await displayData1();
  //  console.log('start sequentialStart 6 ');
    await renderData(res);
   // console.log('start sequentialStart 7 ');
   
};


  app.get('/web3api', (req, res) => {
        console.log('web3api');
        fs.readFile("web3api.html",function(error, data){
         if (error) {
            res.writeHead(404);
             res.write('Contents you are looking for-not found');
             res.end();
            }  else {
             res.writeHead(200, {
                'Content-Type': 'text/html'
             });
             res.write(stylecss.toString());
             res.write(topPage.toString());
            res.write(data.toString());
            res.end();
    }
  });
        });


  
    app.get('/', (req, res) => {
        sequentialStart(res);
        });
    app.get('/home', (req, res) => {
        sequentialStart(res);
        
        
        });
        
    app.get('/buy', (req, res) => {
        buyNumber2();
        //pageMessage = 'Bought a number: ' + resultBoughtNumber;
         res.redirect('home');
        });
        
    app.get('/betStatus', (req, res) => {
        betStatus(res);
        
        var d = new Date();
        var originalString = account + '-betStatus-' + d.getTime();
        var hashedString = web3.utils.soliditySha3(originalString);
        console.log(originalString);
        fileBuffer = new Uint8Array(originalString);
       // const buffer = Buffer.from('BetStatus ' + account);
       // console.log('buffer ' + buffer);
        var dataIpfs = {
                path: '/' + GenBetAddr + '/' + hashedString + '.txt' ,
                content: Buffer.from(fileBuffer)
                };
                
        
               ipfs.add(dataIpfs, function (err, res) {
             if (err || !res) return console.log(err)

                for (var i = 0; i < res.length; i++) {
                    console.log(res[i])
                }
})
       
        });
        
    app.get('/combine', (req, res) => {
         
         var buffern = stylecss;
         buffern += topPage;
         buffern += inputNumbers;
         res.send(buffern);
       
        });
	
	
	app.post('/combine', function(req, res) {
             var num1 = req.body.num1;
             var num2 = req.body.num2;
             //   console.log(num1 + ' ' + num2);
            combineNumbersN(num1,num2);
            res.redirect('home');
});

        
    app.post('/betStatus', function(req, res) {
           // console.log(req.body);
             var  iAccount = req.body.inputAccount;
            if(req.body.changeAccount == ''){
                console.log('account to  change ' + iAccount)
                pageMessage = 'Account changed';
                account = iAccount;
            };
             var  iKey = req.body.inputKey;
            if(req.body.changeKey == ''){
                console.log('key to  change ' + iKey)
                pageMessage = 'Key changed';
                key = iKey;
            };
             var  iMAddress = req.body.inputMAddress;
            if(req.body.changeMAddress == ''){
                console.log('MAddress to  change ' + iMAddress)
                pageMessage = 'Main Bet Address changed';
                addr = iMAddress;
            };
             var  iGAddress = req.body.inputGAddress;
            if(req.body.changeGAddress == ''){
                console.log('GAddress to  change ' + iGAddress)
                 pageMessage = 'Generic Bet Address changed';
                GenBetAddr = iGAddress;
            };
            res.redirect('betStatus');
            
});



 app.listen(8080, () => console.log('Example app listening on port 8080!'));



 MainBetContract.methods.feePercentage().call(function(err, result) {
    if(err) {
        console.log('err ' + err);
    } else {
      //  console.log('ok  feePercentage ' + result);
        
    }
});





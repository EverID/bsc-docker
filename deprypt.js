

var keyth=require('keythereum')
var keyobj=keyth.importFromFile('0xc32ec0115bcb6693d4b4854531ca5e6a99217abf','./')
var privateKey=keyth.recover([],keyobj)
console.log(privateKey.toString('hex')) 


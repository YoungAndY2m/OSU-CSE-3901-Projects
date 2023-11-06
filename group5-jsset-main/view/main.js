/* Model methods */
const INITIAL_TABLE_SIZE = 12
class Cards {
    constructor(color, number, shape, shading, cardName) {
        this.color = color;
        this.number = number;
        this.shape = shape;
        this.shading = shading;
        this.cardName = cardName;
    }
}

class Player{
    constructor(id){
        this.score = 0;
        this.id = id;
    }

    name(){
        return this.id +1
    }
}

function createPlayers(numberOfPlayer){
    let players = [];
    for (let i = 0; i < numberOfPlayer; i++){
        let player = new Player(i);
        players.push(player);
    }
    return players
}

/*Rearranges an array into a random sequeence
  Helper method for createStack
  @param arr:   array to rearrange
  @returns an array
  */
function shuffle(arr){
    let idx = 0;
    for (let i = 0; i < arr.length; i++){
        idx = Math.floor(Math.random()*(i+1));
        let temp = arr[i];
        arr[i] = arr[idx];
        arr[idx] = temp;
    }
    return arr;
}

/*Function to create the stack
*/
function createStack(){
    let colors = ["red", "green", "purple"];
    let numbers = [1, 2, 3];
    let shapes = ["diamond","squiggle","oval"];
    let shadings = ["line","blank","solid"];
    let cardDeck = [];
    for (let i = 0; i < 3; i++){
        for (let j = 0; j < 3; j++){
            for (let k = 0; k < 3; k++){
                for (let a = 0; a < 3; a++){
                    let name = colors[i][0]+shapes[k][0]+numbers[j]+shadings[a][0];
                    const card = new Cards(colors[i], numbers[j], shapes[k], shadings[a], name)
                    cardDeck.push(card);
                }
            }
        }
    }
    shuffle(cardDeck);
    return cardDeck
}

/*Create table*/
function createTable(stack){
    const table = []
    for(let i = 0; i < INITIAL_TABLE_SIZE; i++){
        table.push(stack.pop())
    }
    return table
}

class Model{
    /*Create Stack
    Create Table
    Create players
    */
   constructor(){
    this.stack = createStack()
    this.table = createTable(this.stack)
    this.players = createPlayers(5)
    this.changePlayer(0)
   }

   /*Adds 3 cards to table from stack*/
   dealMoreCards(){
       if (this.stack.length < 1){
           return false
       }
       else{
           for (let i=1; i <=3; i++){
               this.table.push(this.stack.pop())
           }
           return true
       }
   }

   replaceCardsOnTable(idx1, idx2, idx3){
    if(idx1 >= this.table.length || idx2 >= this.table.length || idx3 >= this.table.length){
    }
    else{
        this.table[idx1] = this.stack.pop();
        this.table[idx2] = this.stack.pop();
        this.table[idx3] = this.stack.pop();
    }
    }

    removeCardsOnTable(idx1, idx2, idx3){
        const table = []
        for(let i=0; i < this.table.length; i++){
            if (i != idx1 && i!=idx2 && i!=idx3){
                table.push(this.table[i])
            }
        }
        this.table = table
    }

    //Functions that work on player
    changePlayer(id){
        this.currentPlayer = id;
    }

    increaseScore(){
        this.players[this.currentPlayer].score += 3;
    }
}

/* Controller methods */
class Controller{
    constructor(model){
        this.model = model
    }
    setCurrentPlayer(id){
        this.model.changePlayer(id);
    }
    getPlayer(id){
        this.model.players[id - 1];
    }
    /*Add three more cards to table if there is no set on the table
      and the size of the table < 12
      @return true is there is a set in the table
      */
    handleDealMoreCards(){
        let flag = this.isThereASet()
        if (!flag){
            this.model.dealMoreCards();
        }
        return flag;
    }

    handleSelection(card1, card2, card3){ 
       if (isSet(model.table[card1], model.table[card2], model.table[card3])){
            model.increaseScore()
            if (model.table.length > 12 || model.stack.length == 0){
                model.removeCardsOnTable(card1, card2, card3)
            }
            else{
                model.replaceCardsOnTable(card1,card2, card3)
            }
            return true
       }
       else{
           return false
       }
    }

    isThereASet(){
        let length = model.table.length;
        let flag = false;
        for (let i = 0; i < length -2; i++){
            for (let j = i+1; j < length -1; j++){
                for (let k = j+1; k < length; k++){
                    flag = flag || (isSet(model.table[i], model.table[j], model.table[k]));
                }
            }
        }
        return flag;
    }

    hint(table){
        let length = table.length;
        let hintArr = [0, 0, 0];
        for (let i = 0; i < length -2; i++){
            for (let j = i+1; j < length -1; j++){
                for (let k = j+1; k < length; k++){
                    if (isSet(table[i], table[j], table[k])){
                        hintArr[0] = i;
                        hintArr[1] = j;
                        hintArr[2] = k;
                    }
                }
            }
        }
        return hintArr;
    }

    checkEndOfGame(){
        let rt=false;
        let b= this.isThereASet();
        if (this.model.stack.length == 0){
        if (!(b)){
            rt=true;
            }
        }
        return rt;
    }

    showStats(){
        let max=this.model.players[0].score;
        let array=[];
        let i=0;
        for (i=0;i<5;i++){
        if (this.model.players[i].score >= max){
            max=this.model.players[i].score;
        }
        }
        for (i=0;i<5;i++){
        if (this.model.players[i].score == max){
            array.push(this.model.players[i].id);
        }
        }
        return array;
    }

    // Just for fun
    currentTime(){
        const time = new Date();
        let hrs = time.getHours();
        let min = time.getMinutes();
        let sec = time.getSeconds();
        setTimeout(currentTime, 1000);
    }
}

function checkAttribute(att1, att2, att3){
    let checkAttr = false;
    if(att1 == att2 && att1 == att3){
        checkAttr = true;
    }
    else if(!(att1 == att2) && !(att1 == att3) && !(att2 == att3)){
        checkAttr = true;
    }
    return checkAttr;
}

 function isSet(card1, card2, card3){
    let checkColor = checkAttribute(card1.color, card2.color, card3.color);
    let checkNumber = checkAttribute(card1.number, card2.number, card3.number);
    let checkShape = checkAttribute(card1.shape, card2.shape, card3.shape);
    let checkShading = checkAttribute(card1.shading, card2.shading, card3.shading);
    return checkColor && checkNumber && checkShape && checkShading;
}

/* The main part */
const model = new Model
const controller = new Controller(model)
const table = document.getElementById("table")
const playerPanel = document.getElementById("playerPanel")
const submit = document.getElementById("submit")
const hint = document.getElementById("hint")
const addMoreCards = document.getElementById("plus")
const game = document.getElementById("game")
const popup = document.getElementById("popup")
const players = []
const playersNames = ["Thomas", "Rhino", "Lee"," Jane", "Olivia"]
let currentPlayer
let cardsSelected = []
let playerSelected =[]
let tableArray = []
let isGameOver = false

/*Initialize display of the game*/
function begin(){
    drawPopup()
    drawTable()
    drawPlayers()
}


/*Draws table*/
function drawTable(){
    /*remove all cards from table
      create new display cards
      add cards to table as children
      */
    table.innerHTML = ""
    tableArray = []
    for(let i =0; i < controller.model.table.length; i++){
        const displayCard = document.createElement("div")
        displayCard.className = "card"
        displayCard.id = i 
        
        //create player image inside card
        const cardImg = document.createElement("img")
        cardImg.src = "./images/" + controller.model.table[i].cardName + ".png"
        displayCard.appendChild(cardImg)

        addListerner(displayCard)
        table.appendChild(displayCard)
        tableArray.push(displayCard)
    }
}

/*Makes the card select when clicked*/
function addListerner(card){
    card.addEventListener('click', ()=>{
        card.classList.remove("hint")
        if (card.classList.contains("selected")){
            card.classList.toggle("selected")
            cardsSelected = cardsSelected.filter(element => element !== card)
        }
        else if(cardsSelected.length < 3){
            card.classList.toggle("selected")
            cardsSelected.push(card)
        }
    })
}

/*Draws players*/
function drawPlayers() {
    playerPanel.innerHTML = ""
    const panelTitle = document.createElement("h1")
    panelTitle.innerHTML = "Players:"
    playerPanel.appendChild(panelTitle)

    //create row and attach it to panel
    const panelRow = document.createElement("div")
    panelRow.className = "row"
    playerPanel.appendChild(panelRow)

    var count = 0;

    controller.model.players.forEach(player => {

        //create columns within row for each card
        const rowCol = document.createElement("div")
        rowCol.className = "column"
        panelRow.appendChild(rowCol)

        //create card within column
        const displayPlayer = drawPlayer(player)
        addListernerPlayer(displayPlayer)

        //attach the player card to the column
        rowCol.appendChild(displayPlayer)
        displayPlayer.id = count
        count = count + 1
        players.push(displayPlayer)
    });
    /*Make first player selected by default*/
    currentPlayer = controller.model.currentPlayer
    players[currentPlayer].classList.add("selected")

    const instruction = document.createElement("div")
    instruction.className = "instruction"
    playerPanel.appendChild(instruction);
    instruction.innerHTML = "Instructions: <ul><li>The timer will start running when you start playing.</li> <li>Make sure your player is selected before you submit you selection</li><li>Choose three cards to form a set and click submit to check your answer. 3 points will be earned if it is a set.</li> <li>Becareful not to give your points away to another player</li><li>You can choose to play solo or with others. Click on the icon of your player to highlight it when checking your answer.</li> <li>The player with the highest score wins when the game ends.</li> <li>The hints icon will highlight the three cards that can form a set when you click on it. The hint icon will highlight the first card if there is not a set.</li> <li>Click on the green plus if there is not a set. Another three cards will only appear when there are no sets. Click the plus icon.</li> <li>Thomas is an AI. He is also notorious for stealing others score</li><li>The game ends if the timers runs out or there is no set in the game.</li> <li>Good luck and Enjoy!</li></ul>";
}

function drawPlayer(player){
    const displayPlayer = document.createElement("div")
    displayPlayer.className = "player"

    const playerImg = document.createElement("img")
    playerImg.src = "./images/gameImage" + player.name() + ".jpg"
    displayPlayer.appendChild(playerImg)

    const name = document.createElement("p")
    name.innerHTML = "Name: " + playersNames[player.name()-1]
    displayPlayer.appendChild(name)

    const score = document.createElement("p")
    score.innerHTML = "Score: " + player.score
    displayPlayer.appendChild(score)

    return displayPlayer
}

/*Makes the card select when clicked*/
function addListernerPlayer(card){
    card.addEventListener('click', ()=>{
        players.forEach(player =>{
            player.classList.remove("selected")
        })
        card.classList.add("selected")
        currentPlayer = card.id
        controller.model.currentPlayer = card.id
    })
}

/*Add eventlistener to submit button*/
submit.addEventListener('click', ()=>{
    if (cardsSelected.length < 3){
        return
    }
    else {
        controller.handleSelection(cardsSelected[0].id, cardsSelected[1].id, cardsSelected[2].id)
        drawTable()
        players[currentPlayer].innerHTML = drawPlayer(controller.model.players[currentPlayer]).innerHTML
        cardsSelected = []
    }
})

/*Add eventlistener to hint button*/
hint.addEventListener('click', ()=>{
   let hintArr = controller.hint(controller.model.table)
   while (hintArr[0] == hintArr[1]){
    controller.handleDealMoreCards()
    hintArr = controller.hint(controller.model.table)
    drawTable()
   }
   for(let i=0; i < hintArr.length; i++){
    tableArray[hintArr[i]].classList.toggle("hint")
    }
})

function popUp() {
    document.getElementById('popup').style.display = "none";
    timer()
    aIplayerTimer()
    Event.preventDefault;
}
            
/*Create popup on page*/
function drawPopup() {
    const popupTitle = document.createElement("h2")
    popupTitle.innerHTML = "Welcome to the Game of Set! Here are the rules:"
    popup.appendChild(popupTitle)

    //create row and attach it to panel
    const popupText = document.createElement("p")
    popupText.innerHTML = "The timer will start running when you start playing. Choose three cards to form a set and click submit to check your answer. 3 points will be earned if it is a set. You can choose to play solo or with others. Click on the icon of your player to highlight it when checking your answer. The player with the highest score wins when the game ends. The hints icon will highlight the three cards that can form a set when you click on it. The hint icon will not respond if there is not a set. Click on the green plus if there is not a set. Another three cards will only appear when there are no sets. The game ends if the timers runs out or there is no set in the game. You are responsible to ensure that your character is selected before you submit the cards you have choosen, so that the point earn would appropriately award to you. Stealing points is allowed in this game. Beware of Thomas, the AI, he notorious for stealing others points. Good luck and Enjoy!"
    popup.appendChild(popupText)

    const popupInput = document.createElement("input")
    popupInput.type = "submit"
    popupInput.id = "popupSubmit"
    popupInput.value = "Got it, Let's Start!"
    popupInput.onclick = popUp
    popup.appendChild(popupInput)
}
    
/*Add timer function
  This function is being called in the html file
*/
function timer() {
    let countDownDate = new Date(new Date().getTime() + 5 * 60000);
    let x = setInterval(function() {
        let now = new Date().getTime();
        let timeLeft = countDownDate - now; // should be 5 minutes
        let minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
        let seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);
        document.getElementById("timer").innerHTML = "Time Left: " + minutes + " min " + seconds + " s ";
        if (timeLeft < 0) {
            clearInterval(x);
            document.getElementById("timer").innerHTML = "Time Off!";
            gameOver()
        } else if (controller.checkEndOfGame()){
            clearInterval(x)
            gameOver()
        }
    }, 1000);
}
 
function gameOver(){
    isGameOver = true
    const over = document.createElement("div")
    over.className = "gameOver popup"

    //create image inside card
    const gameOver = document.createElement("h2")
    gameOver.textContent = "Game Over!"
    over.appendChild(gameOver)

    const winner = document.createElement("div")
    winner.id = "winner"
    const announce = document.createElement("h3")
    announce.textContent = "Winner"
    winner.appendChild(announce)
    let winnerId = controller.showStats()
    let winnerScore = 0
    for (let i = 0; i < winnerId.length; i++){
        let playerNo = winnerId[i] + 1
        const winnerImg = document.createElement("img")
        winnerImg.id = "winnerPlayer"
        winnerImg.src = "./images/gameImage" + playerNo + ".jpg"
        winner.appendChild(winnerImg)
        winnerScore = model.players[winnerId[i]].score
    }
    over.appendChild(winner)

    const winScore = document.createElement("h2")
    winScore.textContent = "Score: " + winnerScore
    over.appendChild(winScore)

    function restart(){
        //document.getElementsByClassName("gameOver popup")
        window.location.reload()
    }

    const inputTag = document.createElement("input")
    inputTag.type = "submit"
    inputTag.name = "Restart"
    inputTag.value = "Restart"
    inputTag.addEventListener("click", restart, false)
    over.appendChild(inputTag)

    game.appendChild(over)
}


/*Add eventlistener to addMoreCards*/
addMoreCards.addEventListener('click', ()=>{
    /*Ask controller to deal more cards
      
      update table display
    */
   if (controller.handleDealMoreCards() != true){
        drawTable()
        cardsSelected = []
    }
})

begin()

function aIplayerTimer() {
    if (isGameOver){
        return
    }
    var min = 12,
      max = 20;
    var rand = Math.floor(Math.random() * (max - min + 1) + min); //Generate Random number between 5 - 10
    setTimeout(aIplayer, rand * 1000);
  }
  
/*Sets AI player as current player*/
function aIplayer(){
    if (isGameOver){
        return
    }
    players.forEach(player =>{
        player.classList.remove("selected")
    })
    players[0].classList.add("selected")
    currentPlayer = 0
    controller.model.currentPlayer = 0
    aISelectCards()
}

function aISelectCards(){
    if (isGameOver){
        return
    }
    let cards = controller.hint(controller.model.table)
    /*Unselect cards on table
      select cards
      wait
      submit
      */
      while (cards[0] == cards[1]){
        controller.handleDealMoreCards()
        drawTable()
        cards = controller.hint(controller.model.table)
     }
     tableArray.forEach(card =>{
         card.classList.remove("selected")
         cardsSelected = []
     })
     cards.forEach(card =>{
         tableArray[card].classList.add("selected")
         cardsSelected.push(tableArray[card])
     })
     controller.handleSelection(cards[0], cards[1], cards[2])
     drawTable()
     players[currentPlayer].innerHTML = drawPlayer(controller.model.players[currentPlayer]).innerHTML
     cardsSelected = []
     if (isGameOver){
         return
     }
     aIplayerTimer()
}
  
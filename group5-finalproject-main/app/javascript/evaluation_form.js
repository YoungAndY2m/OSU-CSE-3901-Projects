function validateCheckboxes(){
    var chkList = document.querySelectorAll('input[type="radio"]:checked');
    if (chkList.length < 20){
        alert('Error: Make sure all checkboxes are filled out before submitting.');
        event.preventDefault();
    }
    return;
}

function totalCheckboxes(){
    var i = 1;
    var sum = 0;
    var value = 0;
    while (i <= 20){
        var el_id = "inlineRadio" .concat(i);
        value = parseInt(document.getElementById(el_id).value);
        sum = sum + value;
        i = i + 1;
    }
    return sum;
}

function checkInput(){
    validateCheckboxes();
    var score = totalCheckboxes();
    alert('Score: ' +score);
    event.preventDefault();
}

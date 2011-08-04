var rating_one = new Control.Rating('rating_one');  
var rating_two = new Control.Rating('rating_two',{value: 2.4});  
var rating_four = new Control.Rating('rating_four',{value: 4,rated: true});  
var rating_five = new Control.Rating('rating_five',{value: 6,rated: false,max:9});  
var rating_six = new Control.Rating('rating_six',{  
    value: 6,  
    rated: false,  
    min: 3,  
    max: 12,  
    multiple: true,  
    reverse: true  
});  
var rating_seven = new Control.Rating('rating_seven',{  
    input: 'rating_seven_input',  
    multiple: true  
});  
var rating_eight = new Control.Rating('rating_eight',{  
    input: 'rating_eight_select',  
    multiple: true  
});
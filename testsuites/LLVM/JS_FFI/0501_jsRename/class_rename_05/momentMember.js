let cangjiejs = require('./cangjie');

function getB(){
    return new cangjiejs.Int64(1)
}

function isMoment(a, b){
    if(a.equals(b) ){
        return true;
    }
    return false;
}

module.exports =  {
    isMoment,
    getB
}
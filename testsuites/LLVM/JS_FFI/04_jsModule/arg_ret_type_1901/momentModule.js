function isMoment(group1){
    if( typeof group1== Number){
        return "Number"
    } else if(typeof group1 == String){
        return  group1
    }
}

module.exports =  isMoment

function isMoment(group1){
    if( group1 == Number){
        return "Number"
    } else if(group1 == String){
        return  group1
    }
}

module.exports =  {
    isMoment
}
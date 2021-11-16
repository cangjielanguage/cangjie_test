// EXEC: %compiler %cmp_opt %f -o %output

func main(): Int64 {
    return 0
}

// if-else's Type is Nothing ,is Sub of Bool.but while block will not visit.
// T0 is Unit,T1 is Unit
func case05(){
    while(if(true){return ()}else{return ()}){
        print("yes")
    }
}

// inner while return Bool,is a lambda expression.
func case09(){
    while({while(true){break};true}()){
        print("yes")
    }
}


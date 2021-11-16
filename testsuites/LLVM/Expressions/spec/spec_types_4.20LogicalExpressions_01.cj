// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let expr1 = false
    let expr2 = true
    !true  // Logical NOT, return false.
    1 > 2 && expr1  // Logical AND, return false without computing the value of expr1.
    1 < 2 || expr2  // Logical OR, return true without computing the value of expr2

    if(!((!true)&&(1 > 2 && expr1))){
       print("false")
    }
    if(1 < 2 || expr2){
       print("true")
    }
    return 0
     
}



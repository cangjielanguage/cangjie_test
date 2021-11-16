// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{
    let bool1: Bool = true
    var bool2: Bool = false
    bool2 = true  // assignment
    bool2 &&= bool1  // bool2=true
    bool2 ||= bool1  // bool2=true
    true == false  // return false
    true != false  // return true
    !false  // logical NOT, return true
    true && false  // logical AND, return false
    false || false  // logical OR, return false
    if(bool2&&(!(true == false))&&(true != false)&&(!false)&&(!(true && false))&&(!(false || false))){
        return 0
    }
    return 1 
}

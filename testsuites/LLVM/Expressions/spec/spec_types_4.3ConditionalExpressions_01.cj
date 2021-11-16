// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{ 
    let x = 100
    // if expression without else branch
    if (x > 0) {
        print("x is larger than 0")
    }
 
    // if expression with else branch
    if (x > 0) {
        print("x is larger than 0")
    }else {
      print("x is not larger than 0")
    }
    
    // if expression with nested if expression
    if (x > 0) {
        print("x is larger than 0")
    }else if(x < 0) {
      print("x is lesser than 0")
    }else{
      print("x equals to 0")
    }
   
    return 0
}


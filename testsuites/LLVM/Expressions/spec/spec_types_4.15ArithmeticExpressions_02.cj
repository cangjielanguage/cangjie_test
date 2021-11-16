// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

@overflowWrapping
func test(x: Int8, y: Int8) {
    let z1 = x * y // No exception will be thrown when overflow occurs
}

func main(){
    test(127,127)    
    return 0
}


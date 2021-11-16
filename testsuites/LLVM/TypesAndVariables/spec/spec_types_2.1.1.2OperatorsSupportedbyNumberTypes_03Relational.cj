// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{
    if((2 != 3)&&(8<10)&&(9<=9)&&(!(24>28))&&(24>=23)){
        print("true ")
    }
    return 0 
}

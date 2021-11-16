// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{
    if((0b0001_1000 == 24)&&(0o30 == 24)&&(0x18 == 24)){
        return 0
    }
    return 1
}

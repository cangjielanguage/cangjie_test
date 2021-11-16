// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{
    if((2 + 3) == 5){
        print(" add result: 5 ")
    }
    if((3 - 1) == 2){
        print("sub result: 2 ")
    }
    if((3 * 9) == 27){
        print("mul result: 27 ")
    }
    if((24 / 8) == 3){
        print("div result: 3 ")
    }
    if((7 % 3) == 1){
        print("mod result: 1 ")
    }
    if((2 ** 3) == 8){
        print("power result: 8 ")
    }
    if((5 + 15 - 2 * 10 / 4) == 15){
        print("result: 15 ")
    }
    if((5 + 10 - 3 * 4 ** 2 / 3 % 5) == 14){
        print("result: 14 ")
    }
    return 0 
}

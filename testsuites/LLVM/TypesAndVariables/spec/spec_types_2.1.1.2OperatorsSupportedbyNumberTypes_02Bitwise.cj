// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{
    if((!10) == -11){
        print("bitwise logical NOT operator: -11 ")
    }
    if((10 << 1) == 20){
        print("left shift operator: 10*2=20 ")
    }
    if((10 >> 1) == 5){
        print("left shift operator: 10/2=5 ")
    }
    if((10 & 15) == 10){
        print("bitwise logical AND operator: 10 ")
    }
    if((10 ^ 15) == 5){
        print("mod result: 1 ")
    }
    if((10 | 15) == 15){
        print("bitwise logical OR operator: 15 ")
    }
    if((0b1010 & 0b1110 ^ 0b1111 | 0b0101) == 0b0101){
        print("result: 0b0101")
    }
    return 0 
}

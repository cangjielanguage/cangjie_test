// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Int8>([1,9,5,3,2,0])

a1.sort()

func main(): Int64 {
    if(a1[0]==0 && a1[1]==1 && a1[2]==2 && a1[3]==3 && a1[4]==5 && a1[5]==9){
        return 0
    } 
    return 1
}

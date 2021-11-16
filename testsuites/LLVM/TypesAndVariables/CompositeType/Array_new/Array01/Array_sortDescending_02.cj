// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Int8>([1,9,5,3,2,0])

a1.sortDescending()

func main(): Int64 {
    if(a1[0]==9 && a1[1]==5 && a1[2]==3 && a1[3]==2 && a1[4]==1 && a1[5]==0){
        return 0
    } 
    return 1
}

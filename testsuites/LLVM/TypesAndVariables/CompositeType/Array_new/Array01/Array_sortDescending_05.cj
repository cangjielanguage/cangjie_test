// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Array<Float16>>([Array<Float16>([1.00,2.00,0.00]),Array<Float16>([4.00,0.00,1.00])])

a1.sortDescending()
a1[0].sortDescending()
a1[1].sortDescending()

func main(): Int64 {
    
    if(a1[0][0]==2.00 && a1[0][1]==1.00 && a1[0][2]==0.00 && a1[1][0]==4.00 && a1[1][1]==1.00 && a1[1][2]==0.00 ){
        return 0
    }

    return 1
}

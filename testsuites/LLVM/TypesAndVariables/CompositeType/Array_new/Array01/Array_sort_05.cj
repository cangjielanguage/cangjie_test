// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<Array<Float16>>([Array<Float16>([1.00,2.00,0.00]),Array<Float16>([4.00,0.00,1.00])])

a1.sort()
a1[0].sort()
a1[1].sort()

func main(): Int64 {
    
    if(a1[0][0]!=0.00 || a1[0][1]!=1.00 || a1[0][2]!=2.00 || a1[1][0]!=0.00 || a1[1][1]!=1.00 || a1[1][2]!=4.00 ){
        return 1
    }

    return 0
}

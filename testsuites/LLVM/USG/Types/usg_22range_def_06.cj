// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let range1: Range<Int64> = 0..10
    let range2: Range<Int64> = -10..10:2
    let range3 = 0..=10
    let range4 = -10..=10:2

    let array1 = ArrayList<Int64>([0,1,2,3,4,5,6,7,8,9])
    let array2 = ArrayList<Int64>([-10,-8,-6,-4,-2,0,2,4,6,8])
    let array3 = ArrayList<Int64>([0,1,2,3,4,5,6,7,8,9,10])
    let array4 = ArrayList<Int64>([-10,-8,-6,-4,-2,0,2,4,6,8,10])

    var tmp1 =0
    for (i in range1) {
        if ( i != array1[tmp1] ) {
            return 1
        }
        tmp1 = tmp1 + 1
    }

    var tmp2 =0
    for (i in range2) {
        if ( i != array2[tmp2] ) {
            return 1
        }
        tmp2 = tmp2 + 1
    }

    var tmp3 =0
    for (i in range3) {
        if ( i != array3[tmp3] ) {
            return 1
        }
        tmp3 = tmp3 + 1
    }

    var tmp4 =0
    for (i in range4) {
        if ( i != array4[tmp4] ) {
            return 1
        }
        tmp4 = tmp4 + 1
    }
    0
}
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let range1 = 0..10:1
    let range2 = 0..=10:2
    let range3 = 10..0:-2
    let range4 = 10..=0:-1
    let range5 = 10..0:1
    let range6 = 0..0:1
    let range7 = 0..=0:1
    let range8 = 0..=10:-1

    let array1 = ArrayList<Int64>([0,1,2,3,4,5,6,7,8,9])
    for (i in range1) {
        if ( i != array1[i] ) {
            return 1
        }
    }

    var tmp2 =0
    let array2 = ArrayList<Int64>([0,2,4,6,8,10])
    for (i in range2) {
        if ( i != array2[tmp2] ) {
            return 1
        }
        tmp2 = tmp2 + 1
    }

    var tmp3 =0
    let array3 = ArrayList<Int64>([10,8,6,4,2])
    for (i in range3) {
        if ( i != array3[tmp3] ) {
            return 1
        }
        tmp3 = tmp3 + 1
    }

    var tmp4 =0
    let array4 = ArrayList<Int64>([10,9,8,7,6,5,4,3,2,1,0])
    for (i in range4) {
        if ( i != array4[tmp4] ) {
            return 1
        }
        tmp4 = tmp4 + 1
    }

    var tmp7 =0
    let array7 = ArrayList<Int64>([0])
    for (i in range7) {
        if ( i != array7[tmp7] ) {
            return 1
        }
        tmp7 = tmp7 + 1
    }

    return 0
}
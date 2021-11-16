// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() {
    let array = ArrayList<Int64>([1, 2])
    for (i in 1..3) {
        print(i.toString())
        if ( i != array[i-1] ) {
            return 1
        }
    }
    0
}
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(){
    let range16: Range<Int64> = 0..10 // Define an half-open range [0,10) with step = 1
    let range17: Range<Int64> = -10..10:2  // Define an half-open range [-10,10) with step = 2
    let range18 = 0..=10  // Define a closed range [0,10] with step = 1
    let range19 = -10..=10:2 // Define a closed range [-10,10] with step = 2
    return 0
}


// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    let arr : RefArray<Int64> = RefArray<Int64>([1,2,3,4,5])
    let b = arr[..:2]  //EXPECTED: regex the value of 'step' cannot be set without start or stop for slicing
    let b1 = arr[0..:2]  //EXPECTED: regex the value of 'step' cannot be set without start or stop for slicing
    let b2 = arr[..5:2]  //EXPECTED: regex the value of 'step' cannot be set without start or stop for slicing
    return 2
}

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    let array1: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5])
    let element0 = array1[0]
    array1[1] = 10 // EXPECTED: regex-auto type Class-ArrayList<Int64> does not have operator func [](index, value)
    return 0
}

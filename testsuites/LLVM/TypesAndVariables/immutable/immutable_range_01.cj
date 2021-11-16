// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a1: Range<Int32> = (0..2:1)
    a1.start = 1 // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    a1.stop = 2 // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    a1.step = 2 // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    return 0}

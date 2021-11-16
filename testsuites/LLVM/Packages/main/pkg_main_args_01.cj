// EXEC-PIPE-1: %compiler %cmp_opt  %f  -o %output 2>&1 | compare %f

package default

func main(x:Int32) :Int64{ // EXPECTED: regex error.*passing parameter to binary program is not supported now
    return 0
}
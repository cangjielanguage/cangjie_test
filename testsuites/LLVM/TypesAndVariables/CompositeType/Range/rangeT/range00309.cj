// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var a:Range<Bool> = true..true:0 //EXPECTED: regex generics type arguments do not match the constraint

func main(): Int64 {

    return 0;
}

// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

let a:Range<Char> = 'a'..'b':1 //EXPECTED: regex generics type arguments do not match the constraint


func main(): Int64 {

    return 0;
}

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    let a = Array<String>(3, {i => match(i){
        case 1 => "a"
        case _ => "c"
    }})
    a[1] = 'a'; // EXPECTED: regex-auto cannot convert a character literal to type 'Record-String'
    return 0
}

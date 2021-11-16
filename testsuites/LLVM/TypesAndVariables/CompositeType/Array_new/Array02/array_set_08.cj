// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    let a = Array<String>(3, {i => match(i){
        case 1 => "a"
        case _ => "c"
    }})
    a.set(1, 'a'); //EXPECTED: regex parameters and arguments mismatch
    return 0
}

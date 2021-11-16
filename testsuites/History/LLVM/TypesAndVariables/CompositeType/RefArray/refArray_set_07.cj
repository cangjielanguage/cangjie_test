// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    let a = RefArray<String>(3, {i => match(i){
        case 1 => "a"
        case _ => "c"
    }})
    a[1] = 'a'; // EXPECTED: regex-auto type Class-RefArray<Record-String> does not have operator func [](index, value)

    return 0
}

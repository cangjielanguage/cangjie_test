// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IndexOutOfBoundsException

func main(): Int64 {
    let a = RefArray<String>(3, {i => match(i){
        case 1 => "a"
        case _ => "c"
    }})
    var c = a.get(-1);
    return 0
}

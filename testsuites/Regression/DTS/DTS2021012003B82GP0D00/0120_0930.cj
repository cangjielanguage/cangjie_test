// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    let b = 1
}

func main(): Int64 {
    if (true) {
        Data();
    } else {
        Data();
    }.b;
    return 0;
}
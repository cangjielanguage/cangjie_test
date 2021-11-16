// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


type optInt32 = Option<Int32>

func main(): Int64 {
    var time: optInt32 = Some<Int32>(2019)
    var res: Int32 = match (time) {
        case Some(x) => 2020
        case $None => 1
    }
    if (res == 2020) {
        return 0
    }
    return 1
}

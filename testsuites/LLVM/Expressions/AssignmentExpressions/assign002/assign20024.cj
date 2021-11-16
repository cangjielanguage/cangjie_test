// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum A{ a(Int32) }

func main(): Int64 {
    var l : A = A.a(1)
    var r : A = A.a(2)
    var temp = r
    l = temp
    var res : Int32 = match (l) {
        case a(x) => x
    }
    if (res == 2) {
        return 0
    }
    return 1
}

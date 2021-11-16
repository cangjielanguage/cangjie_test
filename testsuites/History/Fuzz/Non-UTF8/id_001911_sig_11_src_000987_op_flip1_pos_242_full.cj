// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
enum A{ a(Int32) }

func main(): Int64 {
    var l : A = A.a(1)
    var r : A = A.a(2)
    var temp = r
    l = temp
    var res : Int32 = match l {
        case $�(x) => x
    }
    if res == 2 {
        return 0
    }
    return 1
}

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan cccbbb

class C {
    var c : Int64 = 1
    init() {
        print("ccc")
    }
}


class B {
    var b : Int64 = 1
    init(){
        print("bbb")
    }
}


func main() {
    B().b = C().c
    return 0
}

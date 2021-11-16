// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external interface Interface82 {
    func func3762(): Int64 {
        return 0
    }

    func func3708(): Int64 {
        func func3711<T>() : Int64 {
            this.func3762()
        }

        func3711<Int64>()
    }
}

external class C <: Interface82 {}

func main() {
    let obj = C()
    return obj.func3708()
}
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external func func56() {
    func func76<T>() {
        func func86<T>() {}
        func86<Int32>()
    }
    func76<Bool>()
}

func main() {
    func56()
    return 0
}
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

extend String {
    func printSize() {
        this.size()
    }
}
func main():Int64 {
    var len = "123".printSize()
    if (len == 3) {
        return 0
    }
    return 1
}
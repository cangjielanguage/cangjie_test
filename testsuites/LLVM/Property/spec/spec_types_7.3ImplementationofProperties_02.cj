// EXEC: %compiler %cmp_opt %f -o %output

class Foo {
    prop let i: Int64 {
        get() {
            return i // dead loop
        }
    }
}
func main() {
    return 0
}

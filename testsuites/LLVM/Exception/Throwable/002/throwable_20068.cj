// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan cannot assign to value which is an initialized 'let' constant


func main() {
    var exp = Exception()
    try {
        var t = 1
        throw exp
    } catch (t:Throwable) {
        t = Throwable()
        return 0
    }
}

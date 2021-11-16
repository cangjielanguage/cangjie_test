// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan undeclared identifier 'd'

func test(){
    var (a,b,c) = (1,2,3)
    try{
        var (d,e,f) = (a,b/(c-a),c)
    } catch (e:Exception) {
        e.printStackTrace()
    } finally{
        return d
    }
}

func main() {
    test()
    return 0
}

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Throwable
// ASSERT: scan throwable_20028.cj:9)
record B{
    static var b = test(1)
    static func test(x:Int64){
        try{
            throw Throwable();
            ()
        }
        catch (e:Throwable){
            print(e.getMessage())
            print(e.toString())
            e.printStackTrace()
        }
    }
}

func main() {
    B.test(1)
    return 0
}

// EXEC-PIPE-1: %compiler %frontend %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

class C{
        var a = 1
}

func main(){
    var a:C = C()
    var b:C = C()
    var c:List<C> = [a,b]
    print("${c}.\n")
    return 0
}


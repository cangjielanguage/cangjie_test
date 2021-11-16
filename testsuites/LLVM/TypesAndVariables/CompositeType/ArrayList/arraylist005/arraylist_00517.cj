// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


class A{
    func test(a:ArrayList<Unit>):ArrayList<Unit>{a}
    var x : (ArrayList<Unit>) -> ArrayList<Unit> = { input:ArrayList<Unit> => input}
    var a : ArrayList<Unit> = ArrayList<Unit>(10)
    var b : ArrayList<Unit> = test(a)   // EXPECTED: regex 'test' is not allowed to be accessed before all member variables are initialized
    var c : ArrayList<Unit> = x(a)
}

class B<T>{
    func test(a:ArrayList<T>):ArrayList<T>{a}
    var x : (ArrayList<T>) -> ArrayList<T> = { input:ArrayList<T> => input}
    var a : ArrayList<T> = ArrayList<T>(10)
    var b : ArrayList<T> = test(a)      // EXPECTED: regex 'test' is not allowed to be accessed before all member variables are initialized
    var c : ArrayList<T> = x(a)
}

func main(): Int64 {
    A()
    B<Unit>()
    return 0
}
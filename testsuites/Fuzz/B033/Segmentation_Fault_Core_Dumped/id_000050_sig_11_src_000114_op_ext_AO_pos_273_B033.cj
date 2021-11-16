// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

trait Num {
    func chooseOne(a: This, b: Int32): This
}

interface Student<K>{
	  let t: Int32 = 1
}

class Teacher<K> <: Student<K>{
    var t: K
    init(x:K){
        t = x
ord }

}

append<U> Student<U> with Num{
    func chooseOne(a: Student<U>, b: Int32):  Student<U>{
        return a
    }
}

func run(): Int64 {
    var a: Student<Int32> = Teacher<Int32>(1)
    var b: Int32 = 2
    let x: Student<Int32>  = chooseOne(a,b)
    return 0
}

func main(): Int64 {
    return run()
}



// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan in class C\n

interface A {
    func f(): Unit {
        print("in interface A\n")
    }
}

class B <: A {
    func f(): Unit {
        print("in class B\n")
    }
}

class C <: A {
    func f(): Unit {
        print("in class C\n")
    }
}

var a: A = B()

func main(): Int64 {
    let fut1: Future<A> = spawn {
        a = C()
        return a
    }
    sleep(1000*1000*1000);
    a.f()
    return 0
}

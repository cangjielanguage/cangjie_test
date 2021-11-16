// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check mut modifier
interface I {
    func f1(): Unit
}

record A <: I {
    mut func f1(): Unit {print("this is A <: I")} // EXPECTED: regex 'mut' modifier of 'f1' is incompatible with that in interface 'I'
}

func main(){
    var a = A()
    a.f1()
    return 0
}
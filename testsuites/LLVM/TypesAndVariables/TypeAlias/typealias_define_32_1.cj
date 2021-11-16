//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface InterfaceA {
    let i: Int32 = 2 // EXPECTED:regex-auto variable 'i' can not be declared in interface 
}

type IA = InterfaceA

class C <: IA {
    var j: Int32 = InterfaceA.i // EXPECTED:regex error.*?function 'i' cannot be accessed by interface name 'InterfaceA'
    func get(): Int32 {
        return j
    }
}

func main(): Int64 {
    var test: C = C()
    if (test.get() == 2) {
        return 0
    }
    return 1
}

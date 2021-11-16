//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface InterfaceA {
    let i: Int32 = 2 // EXPECTED:regex-auto variable 'i' can not be declared in interface
}

type IA = InterfaceA

func main(): Int64 {
    if (IA.i == 2) {
        return 0
    }
    return 1
}

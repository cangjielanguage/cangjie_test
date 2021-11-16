// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I{
    let i : Array<Int32> = @{0,1,2,3}
    operator func [](inputA:I,inputB:Int32):Int32{
        return I.i[Int64(inputB)]
    }
    operator func [](inputA:I,inputB:Int64):Int32{
        return I.i[inputB]
    }
    operator func [](inputA:Bool,inputB:I):Bool{
        return true
    }
}

class A <: I{}

func main():Int64{
    let a1 : I = A()
    if false[a1] {
        return Int64(a1[Int64(0)]
             + a1[Int32(1)]
             + a1[Int64(2)]
             - a1[Int32(3)])
    }
    return 1
}

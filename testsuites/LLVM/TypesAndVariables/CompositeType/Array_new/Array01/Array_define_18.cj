// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface define18{
    func foo1():Array<Float16>{
        return Array<Float16>([1.00,5.00,3.22])
    }
}

interface define_18{
    static func foo2():Array<UInt32>
}

class A <: define18 & define_18{
    static func foo2():Array<UInt32>{
        return Array<UInt32>([1,5,3])
    }
}

func main(): Int64 {

    if(A().foo1()[0]==1.00 && A().foo1()[1]==5.00 && A().foo1()[2]==3.22 && A.foo2()[0]==1 && A.foo2()[1]==5 && A.foo2()[2]==3){
        return 0
    }

    return 1
}

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a1: Range<Aoo> =(Aoo(1)..Aoo(2):1) // EXPECTED: regex error.*integer type is expected for start, stop and step in range expression
    return 0
}

record Coo {
    var a: Int32 = 1
    let b: Int32 = 1
    init (x: Int32 ){ a = x }
}

class Aoo {
    var a: Int32 = 1
    let b: Int32 = 1
    init (x: Int32 ){ a = x }
}

extend Aoo <:AddInt64<Aoo> & Comparable<Aoo> & Equatable<Aoo>{
    func addInt64(right: Int64): Aoo {
        this
    }
    operator func +(right : Aoo) : Int32 {
        return right.a + this.a
    }
    operator func !=(right : Aoo) : Bool {
        return true
    }
    operator func ==(right : Aoo) : Bool {
        return true
    }
    operator func <(right : Aoo) : Bool {
        return false
    }
    operator func <=(right : Aoo) : Bool {
        return false
    }
    operator func >(right : Aoo) : Bool {
        return false
    }
    operator func >=(right : Aoo) : Bool {
        return false
    }
}

extend Coo <:AddInt64<Coo> & Comparable<Coo> & Equatable<Coo>{
    func addInt64(right: Int64): Coo {
        this
    }
    operator func +(right : Coo) : Int32 {
        return right.a + this.a
    }
    operator func !=(right : Coo) : Bool {
        return true
    }
    operator func ==(right : Coo) : Bool {
        return true
    }
    operator func <(right : Coo) : Bool {
        return false
    }
    operator func <=(right : Coo) : Bool {
        return false
    }
    operator func >(right : Coo) : Bool {
        return false
    }
    operator func >=(right : Coo) : Bool {
        return false
    }

}

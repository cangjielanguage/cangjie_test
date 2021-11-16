// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

record Roo{
    var a:Int64 = 1
    static func foo(x:Int32){ // EXPECTED: regex-not error.*?static and non-static function 'foo' cannot be overloaded
        return 11
    }

    func foo(x:Int64){
        return 12
    }
}

class Coo{
    var a:Int64 = 1
    static func foo(x:Int32){  // EXPECTED: regex error.*?static and non-static function 'foo' cannot be overloaded
        return 11
    }

    func foo(x:Int64){
        return 12
    }
}

class Doo <: Coo {
    func foo(x:String){ // EXPECTED: regex error.*?non-static member 'foo' cannot have the same name with static member in parent class or interfaces
        return 12
    }

}

interface Ioo{
    static func foo(x:Int32){  // EXPECTED: regex error.*?static and non-static function 'foo' cannot be overloaded
        return 11
    }

    func foo(x:Int64){
        return 12
    }
}

interface Joo <: Ioo {
    func foo(x:String){ // EXPECTED: regex error.*?non-static member 'foo' cannot have the same name with static member in parent class or interfaces
        return 12
    }
}

class Goo <: Ioo {
    func foo(x:String){ // EXPECTED: regex error.*?non-static member 'foo' cannot have the same name with static member in parent class or interfaces
        return 12
    }
}

func Foo(){
    static func foo(x:Int32){  // EXPECTED: regex error.*?'static' modifier is illegal for function declaration in function body
        return 11
    }

    func foo(x:Int64){
        return 12
    }
}

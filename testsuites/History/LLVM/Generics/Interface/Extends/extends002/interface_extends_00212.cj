// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{
    func abstract_foo():Int32
    func default_foo():Int32{1}
    let a : Int32 = 1
}

interface B<X> <: A{
    override func default_foo():Int32{2}
}

class C <: B<Int32>{
    func abstract_foo():Int32{2}
}


func main(){
    var b : B<Int32> = C()
    if b.abstract_foo() != Int32(2){
        print("abstract_foo failed!")
        return 1
    }
    print(b.default_foo().toString())
    if b.default_foo() != Int32(2){
        print("default_foo failed!")
        return 1
    }
    return 0
}
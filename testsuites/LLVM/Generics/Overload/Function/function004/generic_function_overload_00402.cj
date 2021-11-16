// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan classb

class A<T>{
    func test(a:T){print("classa")}
}

class B<T>{
    init(input:T){
        a = input
    }
    func test(a:T){print("classb")}
    var a : T
    func i(){
        var b = test(a)
    }
}

func main():Int64{
    B<Int64>(1).i()
    return 0
}
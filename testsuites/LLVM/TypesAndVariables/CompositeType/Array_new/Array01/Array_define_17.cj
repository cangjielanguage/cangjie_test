// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Foo {
    A | B | C

    func f1(): Array<Int64> {
        return Array<Int64>([1,2,3])
    }
    static func f2(): Bool {
        var a1 = Array<Bool>([false,true])
        if(a1[0]){
            return a1[0]
        }else{
            return a1[1]
        }
    }
}

func main(): Int64 {

    if(Foo.f2()){
        var d=Foo.A.f1()
        return d[0] + d[1] - d[2]
    }

    return 1
}

// DEPRECATED TRAIT!


trait Num {
    func chooseOne(a: This, b: Int32): This
}

class Student<K>{
    var t: K
    init(x:K){
        t = x
    }

}

append<U> Student<U> with Num{
    func chooseOne(a: Student<U>, b: Int32):  Student<U>{
        return a
    }
}

func run(): Int64 {
    var a: Student<Int32> = Student<Int32>(1)
    var b: Int32 = 2
    let x: Student<Int32>  = chooseOne(a,b)
    if ( x.t == 1 ) {
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}



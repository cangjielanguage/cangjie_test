// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    a.ifoo11()(a)
    a.ifoo12()()
    a.ifoo13()()
    a.ifoo14()(b)
    a.ifoo15()()
    a.ifoo16()()
    return 0
}

enum Eoo{
    a|b
    func ifoo11(){return ifoo1}
    func ifoo1(x!:Eoo=a){return x} // x = a is call constructor a
    func ifoo2(){var x = a;return x}
    func ifoo3(){return a}
    func ifoo4(x!:Eoo=b){return x}
    func ifoo5(){var x = b;return x}
    func ifoo6(){return b}
    func ifoo12(){return ifoo2}
    func ifoo13(){return ifoo3}
    func ifoo14(){return ifoo4}
    func ifoo15(){return ifoo5}
    func ifoo16(){return ifoo6}
}
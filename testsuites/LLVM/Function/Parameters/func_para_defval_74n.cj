// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

func run(): Int64 {
var res1 = Data().Poo()
var res2 = Data().Qoo()
print(res1.toString()+"n"+res2.toString())
if (res1 == 4 && res2 ==6){
return 0
}
return 1
}


class Data <: Base{
func Poo(a!:Int64=4){
return a
}

func Qoo(a!:Int64=6){
return a
}

}

interface Base{
func Poo(a!:Int64=2):Int64 // EXPECTED: regex error.*?parameter 'a' cannot have default value in abstract function 'Poo'
func Qoo(a!:Int64=3):Int64 // EXPECTED: regex error.*?parameter 'a' cannot have default value in abstract function 'Qoo'
}




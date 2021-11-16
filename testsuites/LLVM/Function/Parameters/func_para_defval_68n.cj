// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

func run(): Int64 {
var res1 = Base(1,2) + Base(3,4)
if (res1.x == 4 && res1.y == 6){
return 0
}
return 1
}


class Base{
var x:Int32 = 4
var y:Int32 = 6
init(x:Int32,y:Int32){
this.x = x
this.y = y
}
operator func + (left: Base, right: Base = Base(3,4)): Base{ // EXPERTED: regex optional parameter can not be used in operator overload function
Base(left.x+right.x, left.y+right.y)
}
}




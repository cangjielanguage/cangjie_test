// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// EXEC: %run %run_opt %output %run_args

package use

import define.*

class X{var x = 1}

@SAME
func main(){
1>>2
1==1
1!=1
1<<2

var a = 1
a += 1
a -= 1
a *= 1
a **= 1
a %= 1
a /= 1
a &= 1
a |= 1
a ^= 1
a <<= 1
a >>= 1

true && false
true || false

var b = true
b &&= true
b ||= true


X().x;
[1,2,3]
(1,2,3)
@{1,2,3}
1**1
1*1
1/1
1+1
1-1
!true
1&1
1|1
1^1

var i : Int64 = 1

var j :(Int64)->Int64 = {x:Int64 => x}

1..1
1..=1

var aaa : ?X = X()
aaa?.x

var bbb : ?Array<Int64> = Array<Int64>([1,2,3])
bbb?[0]

var ccc : ?(Int64)->Int64 = j
ccc?(0)

1<1
1>1
1<=1
1>=1

1 is Int64
1 as Int64

match (1){
    case _ => 0
}


0}

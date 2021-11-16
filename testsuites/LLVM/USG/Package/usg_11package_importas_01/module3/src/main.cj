// DEPENDENCE: ../../module1 ../../module2 ../../module3
// EXEC: %compiler %cmp_opt -c ./module1/src/p1/*.cj -module-name module1 -o module1/p1.%middle  && %copycharjs module1
// EXEC: %compiler %cmp_opt -c ./module2/src/p1/*.cj -module-name module2 -o module2/p1.%middle  && %copycharjs module2
// EXEC: %compiler %cmp_opt -c ./module3/src/p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt module1/p1.%middle module2/p1.%middle p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

from module1 import p1.* as A.*
from module2 import p1.* as B.*
import p2.f1 as a
import p2.f1 as b // OK, a declaration can be renamed multiple times
import p2.f1 as f 

func f(a: Int32) {4} 

func main() {
    A.f1() // OK, package name conflict is resolved by renaming pakcage name.
    B.f2() // OK, package name conflict is resolved by renaming pakcage name.
    a() // OK.
    b() // OK.
    if(A.f1()==1 && B.f2()==2 && a()==3 && b()==3){
        return 0
    }else{
        return 1
    }
}
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f %macro_debug -o %output
// EXEC: %run %run_opt %output %run_args


package use

import define.*

func test(x:()->Unit){}

open class X<T>{}

interface Y<T>{}

@SAME
class A<T,R> <: X<(Int64)->Int64> & Y<(Int32*Int32)> where T <: X<Int8> & Y<Int16>, R <: X<Int8> & Y<Int16>{init(){a = 0};A(var a : Int64){};prop var x : Int64{get(){0}
set(v){}};operator func +(i:Int64){};static func test(){}}



func main(){
0
}

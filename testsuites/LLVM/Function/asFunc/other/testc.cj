package test

external class A{}

external trait X{
    operator func ()(a:This):Int64
}

append A with X{
    operator func ()(a:A):Int64{1}
}
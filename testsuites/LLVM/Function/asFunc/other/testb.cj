package test

external trait X{
    operator func ()(a:This):Int64
}

append Bool with X{
    operator func ()(a:Bool):Int64{1}
}
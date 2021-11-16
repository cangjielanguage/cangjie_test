import lldb 
import re

pattern = re.compile('\n')
patternstep = re.compile(':')
typedict = {}
typedict['unsigned char'] = "UInt8"
typedict['char'] = "Int8"
typedict['unsigned short'] = "UInt16"
typedict['short'] = "Int16"
typedict['unsigned int'] = "UInt32"
typedict['int'] = "Int32"
typedict['unsigned long'] = "UInt64"
typedict['long'] = "Int64"
typedict['__fp16'] = "Float16"
typedict['float'] = "Float32"
typedict['double'] = "Float64"
typedict['char32_t'] = "Char"
typedict['bool'] = "Bool"

def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand('setting set prompt "(cjdb) "')
    debugger.HandleCommand('command script add -f cjcmd.print_cj_locals cj_plocals')
    debugger.HandleCommand('command script add -f cjcmd.print_cj cj_pvar')
    debugger.HandleCommand('command script add -f cjcmd.print_cj_global cj_pglobals')
    debugger.HandleCommand('command script add -f cjcmd.cj_set cj_set')

def is_primitive_type(typeName):
    if typeName in typedict:
        return True
    return False

def is_array_type(typeName):
    res = typeName.split('.')
    if len(res) == 3:
        if res[0] == 'Array':
            return True
    return False
    
def is_string_type(typeName):
    return 'default::String' == typeName

def print_cj(debugger, command, result, internal_dict):
    interpreter = debugger.GetCommandInterpreter()
    returnObject = lldb.SBCommandReturnObject()
    process = debugger.GetSelectedTarget().GetProcess()
    frame = process.GetSelectedThread().GetSelectedFrame()
    var = frame.GetValueForVariablePath(command)
    if var.type.IsPointerType():
        classvar = frame.GetValueForVariablePath('*' + command)
        class_pretty_print(classvar, result, frame)
    else:
        print_var(var, result, frame)
def print_cj_global(debugger, command, result, internal_dict):
    interpreter = debugger.GetCommandInterpreter()
    returnObject = lldb.SBCommandReturnObject()
    interpreter.HandleCommand('target variable ' + command, returnObject)

    if not returnObject.Succeeded():
        result.SetError(returnObject.GetError())

    output = returnObject.GetOutput()
    lines = pattern.split(output)
    for line in lines:
        convert_cj(line, result)

def cj_set(debugger, command, result, internal_dict):
    interpreter = debugger.GetCommandInterpreter()
    returnObject = lldb.SBCommandReturnObject()
    interpreter.HandleCommand('expr ' + command, returnObject)
    if not returnObject.Succeeded():
        result.SetError(returnObject.GetError())
    output = returnObject.GetOutput()
    convertcj(str(output).replace('\n', ''), result)

def print_cj_locals(debugger, command, result, internal_dict):
    interpreter = debugger.GetCommandInterpreter()
    returnObject = lldb.SBCommandReturnObject()
    process = debugger.GetSelectedTarget().GetProcess()
    frame = process.GetSelectedThread().GetSelectedFrame()
    varlist = frame.variables
    for var in varlist:
        print_var(var, result, frame)

def print_var(var, result, frame):
    if is_primitive_type(var.type.name):
        result.AppendMessage(construct_new_info(var))
    elif is_string_type(var.type.name):
        string_pretty_print(var, result, frame)
    elif is_array_type(var.type.name):
        array_pretty_print(var, result, frame)
    else:
        class_pretty_print(var, result, frame)

def class_pretty_print(var, result, frame):
    print(var)
    print(var.type)
    print(var.type.name)
    cjtype = var.type.name.replace('::', '.')
    childrennum = var.GetNumChildren()
    i = 0
    line = '(' + cjtype + ') ' + var.name.replace('*', '' , 1) + " = {\n"
    while i < int(childrennum):
        child = var.GetChildAtIndex(i)
        if is_primitive_type(child.type.name):
            line = line + "  " + child.name + ' = ' + convert(child) + '\n'  
        elif is_string_type(child.type.name):
            line = line + "  " + child.name + ' = ' + string_convert(child,frame) + '\n'
        else:
            line = line + '  ' + child.name + ' = ' + child.value + '\n'
        i = i + 1
    line = line + '}'
    result.AppendMessage(line)

def array_pretty_print(var, result, frame):
    splits = var.type.name.split('.')
    dimstr = splits[2]
    num = dimstr[1 : len(dimstr)]
    i = 0
    typeVal = '(' + var.type.name.split('.')[1]
    while i < int(num):
        typeVal = typeVal + " []"
        i = i + 1
    typeVal = typeVal + ')'
    line = typeVal + ' ' + var.name + ' = {\n'
    i = 0
    while i < int(num):
        size = frame.EvaluateExpression(var.name + '.size')
        j = 0
        if size.value:
            valuesize = size.value
            if int(size.value) > 100:
                valuesize = 100
            while j < int(valuesize) :
                value = frame.EvaluateExpression('*(&' + var.name + '.elements + ' + str(j) + ')')
                line = line +  '  ' + '[' + str(j) + '] = ' + convert(value) + '\n'
                j = j + 1
            if int(size.value) > 100:
                line = line + '  ...\n'
        i = i + 1
        line = line + '}'
    result.AppendMessage(line)

def string_pretty_print(var, result, frame):
    line = '(String) ' + var.name + " = " + string_convert(var, frame)
    result.AppendMessage(line)

def string_convert(var, frame):
    value = frame.EvaluateExpression('&(*' + var.name + '.characters).elements').GetSummary()
    return value[1 : len(value)]

def construct_new_info(var):
    return '(' + typedict[var.type.name] + ') ' + var.name + ' = ' + convert(var)

def convert(var):
    typeName = var.type.name
    value = var.value
    if typeName == 'char':
        value = value[1 : len(value) - 1]
        temp = value.encode('utf-8').decode('unicode_escape')
        bytevalue = bin(ord(temp))
        if len(bytevalue) < 10:
            value = int(bytevalue, 2)
        else:
            val_16 = hex(int(bytevalue, 2))
            val_16 = int(val_16, 16) ^ 0xff
            val_16 = val_16 + 1
            value = str(-val_16)
    if typeName == 'unsigned char':
         value = value[1 : len(value) - 1]
         bb = value.encode('utf-8').decode('unicode_escape')
         value = str(ord(bb))
    if typeName == 'char32_t':
        err = lldb.SBError()
        value = var.GetData().GetString(err, 0)
        if value is None:
            value = '0'
        elif len(value) == 2:
            value = '0'
    return str(value)

def convert_cj(line, result):
    m = line.lstrip().startswith('(')
    if m:
        index = line.find(')')
        oldtype = line[1: index]
        val_start_index = line.find('=')
        val_name = line[index + 1: val_start_index]
        if oldtype in typedict:
            line = line.replace(oldtype, typedict[oldtype], 1)
    result.AppendMessage(line)

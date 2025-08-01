Sub speak()
    ’ VBA script that uses the Magic8Obj COM Server

    ’ declare object
    dim objMagic8 as Magic8Obj

    ’ create object instance
    objMagic8 = createObject("magic8_com.Magic8Obj")

    ’ invoke ’msg’ property and display in message box
    call MsgBox(objMagic8.msg)

    ’ release object from memory
    Set objMagic8 = Nothing
End Sub
Sub elogit()
    ’ Declarations
    Dim objEL As ELogitObj
    Dim resp(0 To 1) As Variant
    On Error GoTo errhandle

    ’ Create object instance
    Set objEL = CreateObject("ELogitSrvr.ELogitObj")

    ’ Read data and names files
    Call objEL.read_datafile("e:\project\ELogit\viral.dat", 5, 3, False)
    Call objEL.read_namesfile("e:\project\ELogit\viral.nam", 3)

    ’ Load the model
    resp(0) = "Y"
    resp(1) = "N"
    objEL.response_byname = resp
    objEL.Intercept = True
    objEL.pred_byname = "LOG_DOSE"

    ’ Run estimation
    Call objEL.modelfit(20, 0.0000000001)

    ’ Write output
    Call objEL.write_results_to_outfile("e:\project\ELogit\excel.out")

    ’ Exit the subroutine
    Exit Sub

    errhandle:

    ’ Handle errors
    If objEL.errMessagePresent Then
        MsgBox objEL.errMessage
    Else
        MsgBox Err.Description
    End If
End Sub
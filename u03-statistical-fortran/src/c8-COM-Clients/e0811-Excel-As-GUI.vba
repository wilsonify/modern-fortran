Sub runELogit()

    ' Declarations
    Dim objEL As ELogitObj
    Dim i As Integer
    Dim vBeta() As Variant
    Dim vCovB() As Variant
    Dim vBetaNames() As Variant

    ' Set up error handling
    On Error GoTo ErrHandler

    ' Instantiate the ELogit COM server object
    Set objEL = CreateObject("ELogitSrvr.ELogitObj")

    ' Load data matrix and metadata
    objEL.data_matrix = Range("DataMatrix").Value
    objEL.var_names = Range("VarNames").Value

    ' Model specification
    objEL.response_byname = Range("Resp").Value
    objEL.Intercept = Range("Inter").Value
    objEL.pred_byname = Range("Pred").Value

    ' Fit the model
    Call objEL.modelfit(Range("Maxits").Value, Range("Eps").Value)

    ' Display convergence status
    If objEL.converged Then
        MsgBox "Algorithm converged in " & objEL.iter & " iterations.", vbInformation
    Else
        MsgBox "Algorithm did not converge by " & objEL.iter & " iterations.", vbExclamation
    End If

    ' === Retrieve and display results ===

    ' Scalar fit statistics
    Range("Loglik").Value = objEL.loglik
    Range("ChiSq").Value = objEL.X2
    Range("GSq").Value = objEL.G2
    Range("df").Value = objEL.df

    ' Get parameter estimates, covariance matrix, and labels
    vBeta = objEL.beta
    vCovB = objEL.cov_beta
    vBetaNames = objEL.beta_names

    ' Display parameter estimates, std errors, z-ratios, and names
    For i = 1 To UBound(vBeta, 1)
        Range("Beta").Cells(i, 1).Value = vBeta(i, 1)
        Range("StdErr").Cells(i, 1).Value = Sqr(vCovB(i, i))
        Range("Ratio").Cells(i, 1).Value = vBeta(i, 1) / Sqr(vCovB(i, i))
        Range("EstimLabel").Cells(i, 1).Value = vBetaNames(i, 1)
    Next i

    ' Cleanup
    Set objEL = Nothing
    Exit Sub

' === Error handler ===
ErrHandler:
    If Not objEL Is Nothing Then
        If objEL.errMsgPresent Then
            MsgBox "Error: " & objEL.errMessage, vbCritical
        Else
            MsgBox "Error: an unspecified error occurred." & vbCrLf & Err.Description, vbCritical
        End If
    Else
        MsgBox "Unexpected error: " & Err.Description, vbCritical
    End If
    Set objEL = Nothing
End Sub

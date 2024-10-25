Set objShell = CreateObject("Shell.Application")
strLocation = WScript.Arguments(0)

' Check if the path is absolute or relative
If Not IsAbsolutePath(strLocation) Then
    ' Convert relative path to absolute path
    strLocation = GetAbsolutePath(strLocation)
End If

objShell.ShellExecute "cmd.exe", "/k cd /d " & Chr(34) & strLocation & Chr(34), "", "runas", 1

Function IsAbsolutePath(path)
    ' Check if a path is absolute
    Set fso = CreateObject("Scripting.FileSystemObject")
    IsAbsolutePath = fso.GetDriveName(path) <> ""
    Set fso = Nothing
End Function

Function GetAbsolutePath(relativePath)
    ' Convert a relative path to an absolute path
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set folder = fso.GetFolder(".")
    parentPath = folder.ParentFolder.Path
    GetAbsolutePath = fso.BuildPath(parentPath, relativePath)
    Set fso = Nothing
End Function

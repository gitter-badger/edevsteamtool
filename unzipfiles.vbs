'========================
'Sub: UnzipFiles
'Language: vbscript
'Usage: UnzipFiles("C:\dir", "extract.zip")
'Definition: UnzipFiles([Directory where zip is located & where files will be extracted], [zip file name])
'========================
Sub UnzipFiles(folder, file)
	Dim sa, filesInzip, zfile, fso, i : i = 1
	Set sa = CreateObject("Shell.Application")
		Set filesInzip=sa.NameSpace(folder&file).items
	For Each zfile In filesInzip
		If Not fso.FileExists(folder & zfile) Then
			sa.NameSpace(folder).CopyHere(zfile), &H100 
			i = i + 1
		End If
		If i = 99 Then
		zCleanup(file, i)
		i = 1
		End If
	Next
	If i > 1 Then 
		zCleanup(file, i)
	End If
	fso.DeleteFile(folder&file)
End Sub

'========================
'Sub: zCleanup
'Language: vbscript
'Usage: zCleanup("filename.zip", 4)
'Definition: zCleanup([Filename of Zip previously extracted], [Number of files within zip container])
'========================
Sub zCleanUp(file, count)   
	'Clean up
	Dim i, fso
	Set fso = CreateObject("Scripting.FileSystemObject")
	For i = 1 To count
	   If fso.FolderExists(fso.GetSpecialFolder(2) & "\Temporary Directory " & i & " for " & file) = True Then
	   text = fso.DeleteFolder(fso.GetSpecialFolder(2) & "\Temporary Directory " & i & " for " & file, True)
	   Else
		  Exit For
	   End If
	Next
End Sub
UnzipFiles "D:\ProgrammingFiles\edevsteamtool\etc\steamcmd", "steamcmd.zip"
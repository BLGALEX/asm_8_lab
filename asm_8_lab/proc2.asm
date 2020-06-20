.686
.model flat, C

option casemap : none
string_len = 128

createFileA PROTO C, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
stdHandle PROTO C, :DWORD
readConsoleA PROTO C, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
writeFileA PROTO C, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
closeHandle PROTO C, :DWORD
readFile PROTO C, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
writeConsole PROTO C, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
exitProcess PROTO C, : DWORD
.data

outHandle DWORD 0
inHandle DWORD 0
bytesRead DWORD 0
bytesWritten DWORD 0
string BYTE string_len dup(?), '0'
filename BYTE "text.txt", 0
fileHandle DWORD 0

;##########

;Часть с чтением с файла

.code

ReadToConsole PROC

push ebp
mov ebp, esp


;Открываем файл

push offset filename
INVOKE createFileA, offset filename, 0, 0, 0, 3, 0, 0
mov fileHandle, eax

;Читаем с файла

INVOKE readFile, fileHandle, addr string, 128, addr bytesRead, 0

;Выполняем вывод

INVOKE stdHandle, -11
mov outHandle, eax

INVOKE writeConsole, outHandle, addr string, bytesRead, addr bytesWritten, 0

;Закрываем файл

INVOKE closeHandle, fileHandle

INVOKE exitProcess, 0

mov esp, ebp
pop ebp
retn

ReadToConsole ENDP
END

end Main
.686
.model flat, C

includelib kernel32.lib
option casemap : none

string_len = 128
includelib msvcrt.lib

createFileA PROTO C, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
stdHandle PROTO C, :DWORD
readConsoleA PROTO C, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
writeFileA PROTO C, :DWORD, :DWORD, :DWORD, :DWORD, :DWORD
closeHandle PROTO C, :DWORD
.data

outHandle DWORD 0
inHandle DWORD 0
bytesRead DWORD 0
string BYTE string_len DUP(?), '0'
filename BYTE "text.txt", 0
fileHandle DWORD 0
bytesWritten DWORD 0

;##########

;Запись в файл с консоли

.code

WriteToFile PROC

push ebp
mov ebp, esp

;Открываем файл

INVOKE createFileA, offset filename, 0, 0, 0, 2, 0, 0
mov fileHandle, eax
;Выполняем ввод

INVOKE stdHandle, -10
mov inHandle,eax

INVOKE readConsoleA, inHandle, addr string, 128, addr bytesRead, 0

;Записываем в открытый файл

mov eax, bytesRead
mov bl, 2h
mul bl
INVOKE writeFileA, fileHandle, addr string, eax, addr bytesWritten, 0
;Закрываем файл

mov eax, bytesWritten
INVOKE closeHandle, fileHandle

mov esp, ebp
pop ebp
retn

WriteToFile ENDP
END

end Main
#include <windows.h>
#include <iostream>
#include <fileapi.h>
#include <conio.h>

using namespace std;

extern "C" {
	void WriteToFile();
   void ReadToConsole();
}

int main() {
	WriteToFile();
	cout << "Press any key to continue and read from file" << endl;
	_getch();
	ReadToConsole();
	return 0;
}

extern "C"
HANDLE createFileA(LPCSTR lpFileName, DWORD dwDesiredAccess,
	DWORD dwShareMode, LPSECURITY_ATTRIBUTES lpSecurityAttributes,
	DWORD dwCreationDisposition, DWORD dwFlagsAndAttributes, HANDLE
	hTemplateFile)
{
	return CreateFileA(lpFileName, 0xC0000000, FILE_SHARE_WRITE,
		lpSecurityAttributes = NULL , dwCreationDisposition, 0x80,
		NULL);
}

extern "C"
VOID exitProcess(UINT r)
{
	return ExitProcess(r);
}

extern "C"
void* stdHandle(DWORD h)
{
	return GetStdHandle(h);
}

extern "C"
BOOL readConsoleA(HANDLE hConsoleInput, LPVOID lpBuffer, DWORD
	nNumberOfCharsToRead, LPDWORD lpNumberOfCharsRead,
	PCONSOLE_READCONSOLE_CONTROL pInputControl)
{
	return ReadConsole(hConsoleInput, lpBuffer, nNumberOfCharsToRead,
		lpNumberOfCharsRead, pInputControl);
}

extern "C"
BOOL writeConsole(HANDLE hConsoleInput, const VOID * lpBuffer, DWORD
	nNumberOfCharsToWrite, LPDWORD lpNumberOfCharsWritten,
	LPVOID lpReserved)
{
	return WriteConsole(hConsoleInput, lpBuffer, nNumberOfCharsToWrite,
		lpNumberOfCharsWritten, lpReserved);
}

extern "C"
BOOL writeFileA(HANDLE hFile, LPCVOID lpBuffer, DWORD
	nNumberOfBytesToWrite, LPDWORD lpNumberOfBytesWritten,
	LPOVERLAPPED lpOverlapped)
{
	return WriteFile(hFile, lpBuffer, nNumberOfBytesToWrite,
		lpNumberOfBytesWritten, lpOverlapped);
}

extern "C"
BOOL readFile(HANDLE hFile, LPVOID lpBuffer, DWORD
	nNumberOfBytesToWrite, LPDWORD lpNumberOfBytesWritten,
	LPOVERLAPPED lpOverlapped)
{
	return ReadFile(hFile, lpBuffer, nNumberOfBytesToWrite,
		lpNumberOfBytesWritten, lpOverlapped);
}

extern "C"
BOOL closeHandle(HANDLE hObject)
{
	return CloseHandle(hObject);
}
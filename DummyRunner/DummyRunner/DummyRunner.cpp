#include <iostream>
#include <windows.h>
#include <string>
#include <vector>

int main() {
    std::wstring pathTemplate = L"C:\\Users\\%USERNAME%\\EatMyShortz\\a.exe";

    DWORD required = ExpandEnvironmentStringsW(pathTemplate.c_str(), nullptr, 0);
    if (required == 0) {
        std::wcerr << L"ExpandEnvironmentStringsW failed: " << GetLastError() << L"\n";
        return 1;
    }

    std::vector<wchar_t> buffer(required);
    if (ExpandEnvironmentStringsW(pathTemplate.c_str(), buffer.data(), required) == 0) {
        std::wcerr << L"ExpandEnvironmentStringsW failed: " << GetLastError() << L"\n";
        return 1;
    }

    std::wstring expandedPath(buffer.data());

    ShellExecuteW(
        NULL,
        L"open",
        expandedPath.c_str(),
        NULL,
        NULL,
        SW_SHOWDEFAULT
    );

    return 0;
}

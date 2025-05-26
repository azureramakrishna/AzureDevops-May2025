$connectTestResult = Test-NetConnection -ComputerName saanvikit16042025.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"saanvikit16042025.file.core.windows.net`" /user:`"localhost\saanvikit16042025`" /pass:`"3SEOR4inGA0FbVoAK+cjqva5KjzssWMVvklB8eGUymjYxQh4U+LB+ymRIP8YKvSO4Md1vahdGJQ/+ASteAcwwQ==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\saanvikit16042025.file.core.windows.net\saanvikit-fs" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}
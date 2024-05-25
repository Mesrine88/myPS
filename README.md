# myPS
This is my PowerShell with OhMyPosh
___

1. Öffne eine elevated PowerShell bzw. das Terminal (Als Administrator ausführen)
2. Stelle sicher, das du Skripte ausführen kannst z.B. Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
3. Falls nicht vorhanden, installiere Git z.B. winget install GH -s winget und winget install git.git -s winget
4. Nun das Terminal neustarten, wieder als Administrator ausführen (elevated), damit git verfügbar ist
5. Naviegiere zum Ordner, wohin das Repo geklont werden soll z.B. Set-Location -Path C:\
6. Klone das Repo z.B. git clone https://github.com/Mesrine88/myPS.git oder Download als Zip
7. Und nun einfach das Installer-Skript starten .\install.ps1

___

## Zusammengefasst
elevated PowerShell bzw. das Terminal (Als Administrator ausführen)

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine

winget install GH -s winget

winget install git.git -s winget

![grafik](https://github.com/Mesrine88/myPS/assets/87695029/7f09ab79-e033-4536-a1ec-cbed747471ae)

**WICHTIG**
Danach das Terminal neustarten, wieder elevated also das Terminal (Als Administrator ausführen), da git sonst nicht verfügbar ist

Set-Location -Path C:\Users\Administrator\Documents\

git clone https://github.com/Mesrine88/myPS.git

![grafik](https://github.com/Mesrine88/myPS/assets/87695029/da06dd47-d4cb-4d9b-9c53-423ff519afe6)


.\install.ps1

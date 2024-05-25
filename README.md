# myPS
This is my PowerShell with OhMyPosh
___

1. Öffne eine elevated PowerShell bzw. das Terminal (Als Administrator ausführen)
2. Stelle sicher, das du Skripte ausführen kannst z.B. Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
3. Falls nicht vorhanden, installiere Git z.B. winget install GH -s winget und winget install git.git -s winget
4. Nun das Terminal neustarten, wieder als Administrator ausführen (elevated), damit git verfügbar ist
5. Naviegiere zum Ordner, wohin das Repo geklont werden soll z.B. Set-Location -Path C:\
6. Klone das Repo z.B. git clone https://github.com/Mesrine88/myPS.git oder Download als Zip
7. Und nun einfach in das Verzeichnis wechseln (cd .\myPS\) und das Installer-Skript starten .\install.ps1

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


cd .\myPS\

.\install.ps1

![grafik](https://github.com/Mesrine88/myPS/assets/87695029/02d54e27-8b6e-4b08-b9a9-e3e90499d78c)

Dadurch, dass mehrere Nerdfonts geladen, entpackt und installiert werden, dauert das natürlich ein wenig. 
Man könnte einzelne Schriften aber auch auskommentieren...

![grafik](https://github.com/Mesrine88/myPS/assets/87695029/0423c29f-2f57-4d50-8f31-6c47d8cfe302)
![grafik](https://github.com/Mesrine88/myPS/assets/87695029/6890331e-f4e4-4094-917e-c4bd12566bd8)


Nun das Terminal neustarten...
Nun sollte aus:   
![grafik](https://github.com/Mesrine88/myPS/assets/87695029/650d7e8a-b039-4af7-b102-b996c7806d27)

Die PowerShell / Terminal in etwa so aussehen...
![grafik](https://github.com/Mesrine88/myPS/assets/87695029/ec94d5a7-8ee8-44f6-8204-ba3af779e92a)

Wobei zufällig bestimmt wird, welcher Style eingesetzt werden soll. Wer diesen anpassen möchte kann es folgendermaßen:
PowerShell öffnen:
notepad $PROFILE

Such die Zeile, die mit oh-my-posh --init --shell pwsh beginnt, kommentiere diese aus und entferne das '# ' einer anderen Zeile...

![grafik](https://github.com/Mesrine88/myPS/assets/87695029/b4915abb-79e5-4ef2-b3c0-c9b004e23d65)

Speichern und Terminal neustarten...

![grafik](https://github.com/Mesrine88/myPS/assets/87695029/e94b49a9-7da3-4ea1-b05e-27e81ffdf1d4)

Oder eigene Anpassungen in der settings.json und $PROFILE vornehmen.

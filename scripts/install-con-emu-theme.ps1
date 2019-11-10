git clone 'https://github.com/joonro/ConEmu-Color-Themes.git' 'con-emu-themes'
cd con-emu-themes
@(Get-ChildItem -Recurse -Filter *.xml -Name) | %{
    echo $_
    .\Install-ConEmuTheme.ps1 -ConfigPath 'C:\Program Files\cmder\vendor\conemu-maximus5\ConEmu.xml' -Operation Add -ThemePathOrName $_
}

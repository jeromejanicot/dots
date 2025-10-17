# config.nu
#
# Installed by:
# version = "0.106.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings,
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R


alias ssh = ssh.exe
alias ssh-add = ssh-add.exe
alias python = ~/.local/bin/python3.13
# alias op = /mnt/c/Users/jerom/AppData/Local/Microsoft/WinGet/Packages/AgileBits.1Password.CLI_Microsoft.Winget.Source_8wekyb3d8bbwe/op.exe

alias dots = /usr/bin/git --git-dir=($env.HOME)/.dots --work-tree=($env.HOME)

def op [...args] {
 /mnt/c/Users/jerom/AppData/Local/Microsoft/WinGet/Packages/AgileBits.1Password.CLI_Microsoft.Winget.Source_8wekyb3d8bbwe/op.exe ...$args
}

$env.path ++= ["~/.local/bin", "~/go/bin"]

$env.config.edit_mode = 'vi'
$env.SHELL = '/usr/sbin/nu'
#$env.DEEPSEEK_API_KEY = op read op://Personal/deepseek_api_key/credential

# proto
$env.PROTO_HOME = ($env.HOME | path join '.proto')
$env.PATH = ($env.PATH | split row (char esep)
  | prepend ($env.PROTO_HOME | path join bin)
  | prepend ($env.PROTO_HOME | path join shims)
  | uniq)

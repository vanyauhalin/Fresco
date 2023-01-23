# Commands

## `fresco`

```sh
fresco -h
```

```
USAGE: fresco <subcommand>

OPTIONS:
  -h, --help              Show help information.

SUBCOMMANDS:
  set (default)           The command to set the icon.
  version                 Print the current fresco version.

  See 'fresco help <subcommand>' for detailed help.
```

## `fresco set`

```sh
fresco set -h
```

```
OVERVIEW: The command to set the icon.

USAGE:   fresco set [-a] [-u] <resource> <target>
         fresco BeautifulIcon.icns ../RegularFile.txt
         fresco -au "https://<...>/UnofficialSFSymbolsIcon.icns" "SF Symbols"

ARGUMENTS:
  <resource>              The path to the resource file.
        The path to the resource file can be either absolute or relative. The
        resource file can be in almost any image format, but .icns is preferred.
  <target>                The path to the target file or directory.
        The path to the target can be either absolute or relative. The target
        can be a file, directory or application.

OPTIONS:
  -a                      Indicates that the target is the application.
        Fresco will try to find an application in the system directory
        (/Applications) and in the user directory (~/Applications, where ~ is
        the user’s home directory) by the passed name. The application name can
        be with or without an extension.
  -u                      Indicates that the resource is the URL.
        Fresco will try to fetch a resource from the remote server. The URL
        should end with a file extension.
  -h, --help              Show help information.

```

## `fresco version`

```sh
fresco version -h
```

```
OVERVIEW: Print the current fresco version.

USAGE: fresco version

OPTIONS:
  -h, --help              Show help information.

```

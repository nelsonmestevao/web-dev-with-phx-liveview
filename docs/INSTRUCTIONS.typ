#import "@preview/obsidius:0.1.0": *

#show: notes.with("Functional Web Development with Phoenix LiveView");


#image("./elixir.png", width: 100pt)

Elixir runs on the Erlang VM, known for creating low-latency, distributed, and fault-tolerant systems. These capabilities and Elixir tooling allow developers to be productive in several domains, such as web development, embedded software, machine learning, data pipelines, and multimedia processing, across a wide range of industries. Here is a peek:

```elixir
iex> "Elixir" |> String.graphemes() |> Enum.frequencies()
%{"E" => 1, "i" => 2, "l" => 1, "r" => 1, "x" => 1}
```

= Preparation for the  Workshop

#import "@preview/cheq:0.2.2": checklist

#show: checklist.with(stroke: rgb("#6F05E7"))

#let todo(content) = {
  callout(emoji.notepad, "TODO", content,
    (rgb("#6F05E7"), rgb("#EDE8FD"), rgb("#C4B3FF")))  // hint: use tailwind colors 700, 100, 300
}

#todo[
  - [x] register for the workshop
  - [x] join the WhatsApp group
  - [ ] install Elixir (and Erlang) on your computer
  - [ ] make sure your Text Editor of choice is installed and configured to your liking
  - [ ] install docker (and docker-compose) on your computer (might be useful to configure databases and other accessories)
  - [ ] (optional) install extensions for Elixir/Phoenix in your editor
]

= Installation of Elixir

The quickest way to install Elixir is through install scripts, operating system package manager, or using one of the available version managers.

== Version Managers

There are many tools that allow developers to install and manage multiple Erlang and Elixir versions. They are useful if you have multiple projects running on different Elixir or Erlang versions, can’t install Erlang or Elixir as mentioned above or if the version provided by your package manager is outdated.

- #highlight[#link("https://asdf-vm.com/", "asdf")] - The Multiple Runtime Version Manager
- #highlight[#link("https://mise.jdx.dev/", "mise")] - The front-end for your dev env


== Install Scripts

Elixir and Erlang/OTP can be quickly installed for macOS, Windows, or Ubuntu using an `install.sh/install.bat` script.

If you are using bash (macOS/Ubuntu/Windows), run:

```bash
curl -fsSO https://elixir-lang.org/install.sh
sh install.sh elixir@1.18.3 otp@27.2.3
installs_dir=$HOME/.elixir-install/installs
export PATH=$installs_dir/otp/27.2.3/bin:$PATH
export PATH=$installs_dir/elixir/1.18.3-otp-27/bin:$PATH
iex
```

If you are using PowerShell (Windows), run:

```powershell
curl.exe -fsSO https://elixir-lang.org/install.bat
.\install.bat elixir@1.18.3 otp@27.2.3
$installs_dir = "$env:USERPROFILE\.elixir-install\installs"
$env:PATH = "$installs_dir\otp\27.2.3\bin;$env:PATH"
$env:PATH = "$installs_dir\elixir\1.18.3-otp-27\bin;$env:PATH"
iex.bat
```

Use `install.sh --help` or `install.bat --help` to learn more about available arguments and options.

It is highly recommended to add Elixir’s bin path to your `$PATH` environment variable to ease development.

On Windows, there are #highlight[#link("https://www.computerhope.com/issues/ch000549.htm", "instructions for different versions")]  explaining the process.

On Unix systems, you need to #highlight[#link("https://unix.stackexchange.com/questions/117467/how-to-permanently-set-environmental-variables/117470#117470","find your shell profile file")], and then add to the end of this file the following line reflecting the path to your Elixir installation:

```bash
export PATH="$PATH:/path/to/elixir/bin"
```

== System Package Manager

=== GNU/Linux

#box(
  inset: 12pt,
  fill: luma(245),
  radius: 6pt,
  [
    #strong[Arch Linux] (Community repository)

    ```bash
    pacman -S elixir
    ```

    #strong[Fedora]

    Fedora’s Rawhide repository keeps more recent versions.

    ```bash
    sudo dnf --repo=rawhide install elixir elixir-doc erlang erlang-doc
    ```

    You may use the default distribution, but those often lag behind.

    ```bash
    sudo dnf install elixir erlang
    ```

    Documentation is available in separate packages.

    ```bash
    sudo dnf install elixir-doc erlang-doc
    ```

    #strong[Gentoo]

    ```bash
    emerge --ask dev-lang/elixir
    ```

    #strong[GNU Guix]

    ```bash
    guix package -i elixir
    ```

    #strong[Ubuntu]

    The packages in apt tend to lag several versions behind. You may use RabbitMQ Packages outlined below, which are likely newer than apt.

    ```bash
    sudo add-apt-repository ppa:rabbitmq/rabbitmq-erlang
    sudo apt update
    sudo apt install git elixir erlang
    ```
  ]
)

=== Windows

#box(
  inset: 12pt,
  fill: luma(245),
  radius: 6pt,
  [
    #strong[via Scoop]

    ```cmd
    scoop install erlang
    scoop install elixir
    ```

    #strong[via Chocolatey]

    ```cmd
    choco install elixir
    ```
  ]
)

=== macOS

#box(
  inset: 12pt,
  fill: luma(245),
  radius: 6pt,
  [
    #strong[via Homebrew]

    ```zsh
    brew install elixir
    ```
  ]
)


=== BSD

#box(
  inset: 12pt,
  fill: luma(245),
  radius: 6pt,
  [
    #strong[FreeBSD]

    ```sh
    pkg install elixir
    ```

    #strong[OpenBSD]

    ```sh
    pkg_add elixir
    ```
  ]
)

= Text Editors

Some of the most popular text editors for Elixir development are:

- #link("https://code.visualstudio.com/", "Visual Studio Code")
- #link("https://www.sublimetext.com/", "Sublime Text")
- #link("https://neovim.io/", "Neovim")
- #link("https://www.gnu.org/software/emacs/", "Emacs")

All these editors are configurable, so don't be afraid to tweak them to your liking.

#solution[You should choose a text editor that you are comfortable with and works for you.]

= Questions

If you have any questions, feel free to ask in the WhatsApp group. The instructor or your colleagues will be happy to help you out.

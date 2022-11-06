;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services shells))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
  (packages (specifications->packages (list "git"
                                            "ripgrep"
                                            "xinit"
                                            "xhost"
                                            "htop"
                                            "emacs"
                                            "emacs-exwm"
                                            "ghc-next"
                                            "gccmakedep"
                                            "gcc-toolchain"
                                            "binutils"
                                            "clang"
                                            "gcc"
                                            "ghc-xmonad-contrib"
                                            "pinentry-rofi"
                                            "rofi"
                                            "picom"
                                            "qutebrowser"
                                            "gst-plugins-ugly"
                                            "gst-plugins-good"
                                            "gst-plugins-base"
                                            "gst-plugins-bad"
                                            "gst-libav"
                                            "rbw"
                                            "gparted"
                                            "p7zip"
                                            "unzip"
                                            "ntfs-3g"
                                            "firefox"
                                            "xmobar"
                                            "ghc"
                                            "xmonad"
                                            "emacs-autothemer"
                                            "vim"
                                            "emacs-evil-collection"
                                            "emacs-evil"
                                            "kitty"
                                            "nyxt"
                                            "arandr"
                                            "font-iosevka"
                                            "neofetch")))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
   (list (service home-bash-service-type
                  (home-bash-configuration
                   (aliases '(("grep" . "grep --color=auto") ("ll" . "ls -l")
                              ("ls" . "ls -p --color=auto")))
                   (bashrc (list (local-file
                                  "/home/tyler/src/guix-config/.bashrc"
                                  "bashrc")))
                   (bash-profile (list (local-file
                                        "/home/tyler/src/guix-config/.bash_profile"
                                        "bash_profile"))))))))

;; This is an operating system configuration generated
;; by the graphical installer.
;;
;; Once installation is complete, you can learn and modify
;; this file to tweak the system configuration, and pass it
;; to the 'guix system reconfigure' command to effect your
;; changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu)
	     (gnu packages xorg)
	     (gnu packages xfce)
	     (gnu packages cups)
	     (nongnu packages linux)
	     (nongnu system linux-initrd)
	     (nongnu packages nvidia)
	     (nongnu services nvidia)
	     (guix transformations))
(use-package-modules linux)
(use-service-modules cups desktop networking ssh xorg linux)

;;(define transform
;;  (options->transformation
 ;;  '((with-graft . "mesa=nvda"))))

(operating-system
  (kernel linux-6.1)
  (kernel-arguments (append
		     '("modprobe.blacklist=nouveau")
		     %default-kernel-arguments))
  (kernel-loadable-modules (list nvidia-module))
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (locale "en_US.utf8")
  (timezone "America/New_York")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "guix")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "tyler")
                  (comment "Tyler Wolf")
                  (group "users")
                  (home-directory "/home/tyler")
                  (supplementary-groups '("wheel" "netdev" "audio" "video" "lp")))
                %base-user-accounts))
  (packages (append (list (specification->package "nss-certs") xfce4-genmon-plugin)
                    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
   (append (list (service xfce-desktop-service-type)

                 ;; To configure OpenSSH, pass an 'openssh-configuration'
                 ;; record as a second argument to 'service' below.
                 (service openssh-service-type)
		 (service nvidia-service-type)
		 (service cups-service-type
			  (cups-configuration
			   (web-interface? #t)
			   (extensions
			    (list cups-filters hplip-minimal))))
                 (service xorg-server-service-type
                  (xorg-configuration
		   (keyboard-layout keyboard-layout)
		   (modules (cons* nvidia-driver %default-xorg-modules))
		   ;;(server (transform xorg-server))
		   (drivers '("nvidia")))))

           ;; This is the default list of services we
           ;; are appending to.
           %desktop-services))
  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  (swap-devices (list (swap-space
                        (target (uuid
                                 "8cf36978-d925-465f-b2fc-0eeaf4b6151f")))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "C6D7-DB06"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/")
                         (device (uuid
                                  "dba1c4a0-d62e-478f-ad6a-a0b34fb1adf5"
                                  'ext4))
                         (type "ext4"))
		       (file-system
		        (mount-point "/media/S70_Blade")
			 (device (uuid
				  "b8e1dc08-6d19-4e91-9d9b-9823dd37cb3f"
				  'f2fs))
			 (type "f2fs"))
		       %base-file-systems)))

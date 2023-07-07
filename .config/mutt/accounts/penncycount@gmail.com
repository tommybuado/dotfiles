# account settings
set imap_user = "penncycount@gmail.com"

set mbox_type = Maildir
set folder    = "~/.local/share/mail/penncycount@gmail.com/"
set spoolfile = "+INBOX"
set postponed = "+Drafts"
set record    = "+Sent"
set trash     = "+Trash"

set realname = "Penncy Count"
set from     = "penncycount@gmail.com"
set use_from = yes

set sendmail     = "/usr/bin/msmtp -a penncycount@gmail.com"
set edit_headers = yes

# account settings
set imap_user = "tommybuado@gmail.com"

set mbox_type = Maildir
set folder    = "~/.local/share/mail/tommybuado@gmail.com/"
set spoolfile = "+INBOX"
set postponed = "+Drafts"
set record    = "+Sent"
set trash     = "+Trash"

set realname = "Tommy Buado"
set from     = "tommybuado@gmail.com"
set use_from = yes

set sendmail     = "/usr/bin/msmtp -a tommybuado@gmail.com"
set edit_headers = yes

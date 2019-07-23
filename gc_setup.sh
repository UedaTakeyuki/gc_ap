/bash -e

# read gc.ini
gcini=/boot/gc.ini
gcini_nkfied=/tmp/gc.ini

if [ -f $gcini ]; then
    nkf -Lu $gcini > ${gcini_nkfied} # convert CRLF or CR to LF.
  . ${gcini_nkfied}
fi

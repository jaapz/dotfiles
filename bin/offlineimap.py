#!/usr/bin/env python

import os


def unencrypt_password(filename):
    """ Unencrypt the given file which contains the password.

    The file should be encrypted using:
        openssl rsa -in ~/.ssh/id_rsa -pubout > ~/.ssh/id_rsa.pub.pem
        openssl rsautl -encrypt -pubin -inkey ~/.ssh/id_rsa.pub.pem > ~/outputfile
    """
    return os.popen("cat %s | openssl rsautl -decrypt -inkey ~/.ssh/mail/id_rsa" % filename).read().rstrip()

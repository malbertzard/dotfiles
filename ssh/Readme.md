# SSH

## Encrypt Directory using gpg

In some cases, you may be interested in encrypting a whole directory, containing a lot of files.

In order to achieve that, you are going to create an archive first and encrypt it later on.

To create an archive, use the “tar” command along with the “-cvf” options that stand for “create a file in verbose mode”. Now that your archive is created, you can encrypt it using the “gpg” command with the “-c” option.

```bash
tar -cvf archive.tar <directory>

gpg -c archive.tar
```

## Decrypt Encrypted File on Linux

In order to decrypt an encrypted file on Linux, you have to use the “gpg” command with the “-d” option for “decrypt” and specify the “.gpg” file that you want to decrypt.

```bash
gpg -d <file>.gpg
```


## Command-Line Usage

#### Normal Usage

- Generate a key: `gpg --gen-key`
- Export a public key: 
  - To standard output: `gpg --export --armor <identifier>`
  - To a file: `gpg --export --armor <identifier> > pub_key.asc`
- Import a public key: `gpg --import <filename>`
  - _Note:_ this could be your own key that was signed by another GPG user, or it could be an associate's public key to add to your keyring.
- View keys in your keyring:
  - Public: `gpg --list-keys`
  - Public with fingerprints: `gpg --fingerprint`
  - Private: `gpg --list-secret-keys`
- Sign a key: `gpg --sign-key --ask-cert-level <identifier>`
- Check signatures: `gpg --list-sigs <optional identifier>`
- Check signatures for only keys that you have signatures for: `gpg --check-sigs`
- 

#### Danger Zone

- Export a private key: `gpg --export-secret-keys --armor <identifier> > secret.asc`

## Useful Links

#### General

[A nice overview on GPG usage in the command line.](http://blog.ghostinthemachines.com/2015/03/01/how-to-use-gpg-command-line/)

##### RiseUp.net Best Practices

[Advice on key management and algorithm choice from riseup.net.](https://riseup.net/en/security/message-security/openpgp/best-practices)

[Publicly notify change in keys for people on your chain of trust.](https://riseup.net/en/security/message-security/openpgp/key-transition)

#### GitHub Usage

[An overview on creating a new GPG key (as explained by GitHub).](https://help.github.com/en/articles/generating-a-new-gpg-key)

[An overview on adding a GPG key to your GitHub profile.](https://help.github.com/en/articles/adding-a-new-gpg-key-to-your-github-account)

[This was useful in solving upload issues when multiple keys use the same email address.](https://github.community/t5/How-to-use-Git-and-GitHub/Adding-a-gpg-key-isn-t-working/td-p/11079)

#### Tor Links

[Using keyservers.](https://trac.torproject.org/projects/tor/wiki/doc/TorifyHOWTO/GnuPG)

[An older, denser, more informative version of the link above.](https://trac.torproject.org/projects/tor/wiki/doc/TorifyHOWTO/GnuPG?version=53#L1)


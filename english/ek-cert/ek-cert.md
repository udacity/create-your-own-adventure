What is TPM Endorsement Key Certificate

To understand what is the EK certificate (or Endorsement Key Certificate), let’s first understand what is the TPM Endorsement Key. On a very basic level it is a cryptographic key that allows particular TPM device to prove it’s legitimacy (as in “not faked”) to users. You might wonder why won’t we use just serial number for that purpose? Well, serial numbers can be faked. For example an attacker can impersonate as a TPM to a user by copying the serial number from one of the previous messages. And though there are ways to protect against such an attack, for example by hashing the serial number with a random data, there are additional advantages to using asymmetric cryptographic keys. One of those is to ability to encrypt the data sent to the specific TPM in a way that only that TPM can decrypt it.

So how does it work? Let’s examine two use cases under the assumption that asymmetric key such as RSA is used. Asymmetric keys have 2 parts: the public part that is not a secret and a private part that is a secret known only to the specific TPM device.

Encryption – a user wants to send information to specific TPM but she doesn’t want others to be able to intercept the information. Here the solution is to encrypt the data using the target TPM’s public key and send it in the open. You might have guessed correctly that the only way to decrypt the message is to use the private key which, as mentioned earlier, is securely stored in the TPM. In this scenario the user usually retrieves the public key from the TPM itself using a dedicated command prior to encrypting the data.
Authentication – a user wants to make sure that the information that she received came indeed from her TPM. It turns out that our asymmetric key pair can help us to achieve this goal as well. The TPM uses it’s private key to sign on the information it sends out to the user. The user uses the public part of the key to verify the signature on the message. The only way the signature passes verification with specific public key is that it was created using the associated private key stored secretly (hopefully) in one specific TPM. This effectively proves that the message was sent by a specific TPM who’s public key we use for signature verification.
And now we get to why we need also an EK certificate. Consider the following attack: instead of trying to hack the TPM while its in use, an attacker can replace the TPM (physically or by software emulation) with his own version that functions exactly like a legitimate TPM but with a backdoor allowing the attacker to access protected data. Now the user starts using the TPM, trusting that the device is secure without knowing that it is compromised. This is actually not very difficult, there code for TPM 2.0 is easily accessible, including TCG’s reference implementation. How do we solve this problem? This is exactly the idea behind EK certificate.

One of the most important concepts in security in general and TPM specifically is Chain of Trust. Let’s start with the original problem and to make it interesting look at this as a dialog between the user and the TPM:

User - TPM, prove to me that your are not faked!
TPM - Trust me, I am a shiny new TPM just arrived from the fab.
User - Well, that's the issue TPM, I don't trust you!
TPM - OK user, who do you trust then?
User - I guess I trust my TPM vendor (let's say Intel)
TPM - Great, it so happens to be that Intel has a database of all the endorsement keys that it installed in it's TPMs during manufacturing. One for each TPM it produced.
User - So what?
TPM - For each EK Intel also provides a certificate. The certificate includes the public key which you can compare with the public key that I (TPM) provided you. If they match you can be assured that I am one of the TPMs that Intel manufactured, and you trust them, right?
User - Right, but how do I know that the certificate in Intel's database is not faked?
TPM - You are very hard user to please! But just so you know, all the certificates in Intel's database are signed by Intel's private key. So you can just use Intel's public key to verify that the certificate is legitimate.
Note that this is a simplified model and in reality the chains of trust have more hierarchies.

So in summary, the TPM EK certificate aims to provide certainty that the particular TPM to which it belongs is indeed a TPM that was manufactured by specific company and is not forged.

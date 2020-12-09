# Android Resign

This script allows you to resign any APK with any certificate.  

### Prerequisites

You'll only need the APK you want to sign and the Keystore with all it's informations.  

### Disclamer 
The script was only used and tested on a Mac OS Environment. It should work fine on any Unix distribution though.
Only native APKs were re-signed with this script, never tried anything else.

### How to

1) Clone this project.  
2) Create a file "whatever.properties" containing the following  
```
storeFile=/Path/To/keystore.jks
keyAlias=your_key_alias
keyAliasPassword=your_key_password
storePassword=your_store_password
```
3) Execute the Script with the following command line  
```
./signapk.sh my_apk.apk whatever.properties
```  

## Authors

* **Florian DUHEN** - *Initial work*

## Libs used by the script

The script is using the Jar files "Zipalign", "Keytool" and "Jarsigner".  
Zipalign in the Android Build Tools version : 27.0.3 (could use a newer one)
Keytool in the Android Build Tools version : 27.0.3 (could use a newer one)
Jarsigner in the Java package version : 1.8.0_152 (could use a newer one)
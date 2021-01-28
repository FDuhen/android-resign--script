#!/bin/bash

# param1, APK file
USER_HOME=$(eval echo ~${SUDO_USER})

APK=$1
CONF_PATH=$2
#reading the conf of the android certificate
if [ -z "$CONF_PATH" ]
then
	source $USER_HOME/.gradle/signing_prod.properties
else
    source $CONF_PATH
fi

# get the filename
APK_BASENAME=$(basename $APK)
SIGNED_APK="signed_"$APK_BASENAME

# delete META-INF folder
zip -d $APK META-INF/\*

chmod a+x jarsigner
chmod a+x keytool
# sign APK
./jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $storeFile -storepass $storePassword -keypass $keyAliasPassword $APK $keyAlias
#verify
./jarsigner -verify -keystore $storeFile $APK

chmod a+x zipalign
#zipalign
./zipalign -v 4 $APK $SIGNED_APK 

#TryCatch if not exist
./keytool -printcert -jarfile $SIGNED_APK
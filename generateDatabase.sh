rm -rf Database/
mkdir -p Database
swift run LiturgyMakeDatabase ./Database/database.realm
rm -f Sources/LiturgyDatabase/resources/database.realm
cp ./Database/database.realm Sources/LiturgyDatabase/resources/database.realm
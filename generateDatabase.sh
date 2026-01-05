rm -rf Database/
# rm liturgies.json
mkdir -p Database
mkdir -p Sources/LiturgyDatabase/resources
swift run LiturgyMakeDatabase ./Database/database.realm
rm -f Sources/LiturgyDatabase/resources/database.realm
cp ./Database/database.realm Sources/LiturgyDatabase/resources/database.realm
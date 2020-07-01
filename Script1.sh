echo "Hello There!"
url="http://13.89.226.45:9090"
b='Authorization: Bearer '$1''
echo $b
#echo $(ruby -ryaml -rjson -e \
#"puts JSON.pretty_generate(YAML.load_file('$2'))" ) >> data.json
#echo $(ruby -ryaml -rjson -e \
#"puts JSON.pretty_generate(YAML.load_file('$3'))" ) >> data.json
#echo $data.json

echo "Application Onboarding"
app1=$(curl -X POST  -H 'Content-Type:application/json' -H 'Accept:application/json' -H "${b}" -d @data.json ${url}/stargazer/api/application/update )
echo $app1

echo "List of application"
apps=$(curl -X GET ${url}/stargazer/api/applications/get -H 'Content-Type:application/json' -H 'Accept:application/json' -H "${b}")

echo $apps

echo "Prescription"
p=$(curl -X POST ${url}/stargazer/api/applications/get -H 'Content-Type:application/json' -H 'Accept:application/json' -H "${b}" -d @data.json ${url}/stargazer/api/manifest/update)

echo $p
echo $p >> result.json
#chmod +x script1.rb

#ruby script1.rb
#echo $var

echo $(ruby -e 'require "json"; file = File.open "result.json"; data = JSON.load file; puts data["security"]["sastScan"]["enabled"]')
#echo $(ruby -e 'require "json"; file = File.open "result.json"; data = JSON.load file; puts data["security"]["scaScan"]["enabled"]')
#echo $(ruby -e 'require "json"; file = File.open "result.json"; data = JSON.load file; puts data["security"]["dastScan"]["enabled"]')

echo "::set-output name=sastScan::$(ruby -e 'require "json"; file = File.open "result.json"; data = JSON.load file; puts data["security"]["sastScan"]["enabled"]')"
#echo "::set-output name=nikhar::$(ruby -e 'require "json"; file = File.open "result.json"; data = JSON.load file; puts data["security"]["scaScan"]["enabled"]')"
#echo "::set-output name=nikhar::$(ruby -e 'require "json"; file = File.open "result.json"; data = JSON.load file; puts data["security"]["dastScan"]["enabled"]')"
#echo "result:" $var

#if [ $var=="true" ]
#then 
#   echo "Perform SAST Scan"
#fi

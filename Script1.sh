echo "Hello There!"
url="http://13.89.226.45:9090"
b='Authorization: Bearer '$1''
echo $b
echo $(ruby -ryaml -rjson -e \
"puts JSON.pretty_generate(YAML.load_file('$2'))" ) >> data.json
echo $(ruby -ryaml -rjson -e \
"puts JSON.pretty_generate(YAML.load_file('$3'))" ) >> data.json
echo $data.json

echo "Application Onboarding"
app1=$(curl -X POST  -H 'Content-Type:application/json' -H 'Accept:application/json' -H "${b}" -d @data.json ${url}/stargazer/api/application/update )
echo $app1

echo "List of application"
apps=$(curl -X GET ${url}/stargazer/api/applications/get -H 'Content-Type:application/json' -H 'Accept:application/json' -H "${b}")

echo $apps

echo "Prescription"
p=$(curl -X POST ${url}/stargazer/api/applications/get -H 'Content-Type:application/json' -H 'Accept:application/json' -H "${b}" -d @data.json ${url}/stargazer/api/manifest/update)

echo $p

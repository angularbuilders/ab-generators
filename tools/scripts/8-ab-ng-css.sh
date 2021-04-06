echo "🚧 add CSS";
echo "add bulma";
npm i bulma
echo "this.projects.www.architect.build.options.styles[1] = 'node_modules/bulma/css/bulma.css';"
json -I -f angular.json -e "this.projects.www.architect.build.options.styles[1] = 'node_modules/bulma/css/bulma.css';"
git add *
git commit -m 'chore: add bulma'
echo "🏠 add CSS";

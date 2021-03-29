echo "🚧 add capabilities";
echo "add universal"
ng add @nguniversal/express-engine --interactive=false --defaults=true
git add *
git commit -m 'chore: add universal'
echo "add pwa"
ng add @angular/pwa
json -I -f package.json -e "this.scripts.build = 'ng build --prod';"
echo "this.scripts.build = 'ng build --prod';"
git add *
git commit -m 'chore: add pwa'
echo "add bulma";
npm i bulma
json -I -f angular.json -e "this.projects.web.architect.build.options.styles[1] = 'node_modules/bulma/css/bulma.css';"
echo "this.projects.web.architect.build.options.styles[1] = 'node_modules/bulma/css/bulma.css';"
git add *
git commit -m 'chore: add bulma'
echo "🏠 add capabilities";
echo "🚧 add capabilities";
echo "add universal"
ng add @nguniversal/express-engine --interactive=false --defaults=true
git add *
git commit -m 'chore: add universal'
echo "add pwa"
ng add @angular/pwa
echo "this.scripts.build = 'ng build --prod';"
json -I -f package.json -e "this.scripts.build = 'ng build --prod';"
git add *
git commit -m 'chore: add pwa'
echo "nx migrate latest"
nx migrate latest
npm install --legacy-peer-deps
git add *
git commit -m 'chore: nx migrate latest'
echo "🏠 add capabilities";
